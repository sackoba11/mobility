import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

/// Avatar utilisateur sans crash (Phase 4) : photo si dispo, sinon initiale
/// (displayName, à défaut email, à défaut "?").
class UserAvatar extends StatelessWidget {
  final User? user;
  final double radius;

  const UserAvatar({super.key, required this.user, this.radius = 20});

  static String initialOf(User? user) {
    final displayName = user?.displayName?.trim();
    if (displayName != null && displayName.isNotEmpty) {
      return displayName[0].toUpperCase();
    }
    final email = user?.email?.trim();
    if (email != null && email.isNotEmpty) {
      return email[0].toUpperCase();
    }
    return "?";
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final photoUrl = user?.photoURL;
    if (photoUrl != null && photoUrl.isNotEmpty) {
      return CircleAvatar(
        radius: radius,
        backgroundImage: NetworkImage(photoUrl),
        backgroundColor: scheme.primaryContainer,
      );
    }
    return CircleAvatar(
      radius: radius,
      backgroundColor: scheme.primary,
      child: Text(
        initialOf(user),
        style: TextStyle(
          color: scheme.onPrimary,
          fontSize: radius,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
