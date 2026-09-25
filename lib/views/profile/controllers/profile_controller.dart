import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:mobility/common/theme/theme_service.dart';
import 'package:mobility/data/repositories/authRepositiry/auth_repository_impl.dart';
import 'package:mobility/models/user/my_user.dart';

/// Profil utilisateur réel (Phase shell) : compte + préférences + logout.
class ProfileController extends GetxController {
  final Rx<User?> firebaseUser = Rx<User?>(null);
  final Rxn<MyUser> appUser = Rxn<MyUser>();
  final RxBool isLoading = true.obs;
  final RxBool isDriverAccount = false.obs;
  final RxBool isDark = false.obs;

  @override
  void onInit() {
    super.onInit();
    isDark.value = Get.isDarkMode;
    load();
  }

  Future<void> toggleTheme(bool dark) async {
    isDark.value = dark;
    await ThemeService.toggleDark(dark);
  }

  Future<void> load() async {
    isLoading.value = true;
    final user = FirebaseAuth.instance.currentUser;
    firebaseUser.value = user;
    if (user != null) {
      final result =
          await AuthRepositoryImpl().getUser(user.uid);
      result.fold(
        (_) => appUser.value = null,
        (u) {
          appUser.value = u;
          isDriverAccount.value = u.isDriver;
        },
      );
    }
    isLoading.value = false;
  }

  String get displayName {
    final name = appUser.value?.name.trim().isNotEmpty == true
        ? appUser.value!.name.trim()
        : firebaseUser.value?.displayName?.trim();
    if (name != null && name.isNotEmpty) return name;
    return firebaseUser.value?.email?.split('@').firstOrNull ?? 'Utilisateur';
  }

  String get email =>
      appUser.value?.email ?? firebaseUser.value?.email ?? '';

  /// Déconnexion adaptée au type de compte, puis retour aux services.
  Future<void> logout(String servicesRoute) async {
    if (isDriverAccount.value) {
      await AuthRepositoryImpl().signOut();
    } else {
      await AuthRepositoryImpl().signOutFromGoogle();
    }
    Get.offAllNamed(servicesRoute);
  }
}
