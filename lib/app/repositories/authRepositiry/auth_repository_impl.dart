import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:mobility/app/error/app_error.dart';
import 'package:mobility/app/models/user/my_user.dart';
import 'package:mobility/app/repositories/authRepositiry/i_auth_repository.dart';

@LazySingleton(as: IAuthRepository)
class AuthRepositoryImpl implements IAuthRepository {
  final auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  late User currentUser;

//Realtime Database
  static final entryPoint = FirebaseDatabase.instance.ref();
  static final driverEntry = entryPoint.child("drivers");

// Firestore Database
  static final entryDB = FirebaseFirestore.instance;
  static final driversDB = entryDB.collection("driversInfos");
  static final usersDB = entryDB.collection("users");

  addUser({required String uid, required Map<String, dynamic> map}) async {
    // driverEntry.child(uid).set(map);
    await usersDB.doc(uid).set(map);
  }

  @override
  Future<Either<AppError, bool>> addDriverInfos(
      {required String uid, required Map<String, dynamic> map}) async {
    try {
      await driversDB.doc(uid).set(map);
      return right(true);
    } catch (e) {
      return left(GenericAppError("error to add infos: $e"));
    }
  }

  @override
  Future<Either<AppError, User>> getCurrentUser() async {
    try {
      return right(auth.currentUser!);
    } catch (e) {
      return left(GenericAppError("error to get current User: $e"));
    }
  }

  @override
  Future<Either<AppError, MyUser>> getUser(String uid) async {
    try {
      var documentSnapshot = (await usersDB.doc(uid).get());
      MyUser user = MyUser.fromJson(documentSnapshot.data()!);
      return right(user);
    } catch (e) {
      return left(GenericAppError("error to get User: $e"));
    }
  }

  @override
  Future<void> signOutFromGoogle() async {
    await _googleSignIn.signOut();
    await auth.signOut();
  }

  @override
  Future<void> signOut() async {
    await auth.signOut();
  }

  @override
  Future<Either<AppError, bool>> resetpassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      return right(true);
    } catch (e) {
      return left(GenericAppError("error to reset Password: $e"));
    }
  }

  @override
  Future<Either<AppError, UserCredential>> signInWithGoogle(
      {bool reauth = false}) async {
    try {
      User? previousUser;
      UserCredential userCreds;
      await GoogleSignIn().signOut();
      final googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        return Left(GenericAppError("Cancelled by User"));
      }
      final googleAuthentication = await googleUser.authentication;
      if (reauth) {
        previousUser = (await getCurrentUser()).fold((l) => null, (r) => r);
        final relinkCred = GoogleAuthProvider.credential(
            idToken: googleAuthentication.idToken,
            accessToken: googleAuthentication.accessToken);
        userCreds = await previousUser!.linkWithCredential(relinkCred);
        print(reauth);
        return Right(userCreds);
      } else {
        final authCredential = GoogleAuthProvider.credential(
            idToken: googleAuthentication.idToken,
            accessToken: googleAuthentication.accessToken);

        final UserCredential userCreds =
            await auth.signInWithCredential(authCredential);
        User currentUser = userCreds.user!;
        // print("userCreds : $userCreds");
        print("user : ${currentUser.email}");

        //  User? user = userCreds.user;
        String uid = currentUser.uid;
        Map<String, dynamic> map = {
          "uid": uid,
          "name": currentUser.displayName!,
          "email": currentUser.email,
          "isDriver": false
        };
        addUser(uid: uid, map: map);
        return Right(userCreds);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return Left(GenericAppError('email-already-in-use'));
      } else if (e.code == 'invalid-email') {
        return Left(GenericAppError('invalid-email'));
      }
      if (e.code == 'operation-not-allowed') {
        return Left(GenericAppError('operation-not-allowed'));
      }
      if (e.code == 'user-disabled') {
        return Left(GenericAppError('user-disabled'));
      } else {
        return Left(GenericAppError('Server error'));
      }
    } catch (e) {
      return Left(GenericAppError("cancel by user"));
    }
  }

  Future<Either<AppError, UserCredential>> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      User currentUser = credential.user!;
      print("user : ${currentUser.email}");
      return Right(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return Left(GenericAppError('email-already-in-use'));
      } else if (e.code == 'invalid-email') {
        return Left(GenericAppError('invalid-email'));
      }
      if (e.code == 'operation-not-allowed') {
        return Left(GenericAppError('operation-not-allowed'));
      }
      if (e.code == 'week-password') {
        return Left(GenericAppError('week-password'));
      } else {
        return Left(GenericAppError('Server error'));
      }
    }
  }

  @override
  Future<Either<AppError, UserCredential>> signInWithEmailAndPassword({
    required String? userName,
    required String? userNumber,
    required String? typeOfCar,
    required String? brand,
    required String? color,
    required String userEmail,
    required String userPassword,
    bool isLinkWithCredentials = false,
  }) async {
    User previousUser;
    UserCredential userCreds;
    try {
      if (isLinkWithCredentials) {
        // This is where the magic happens
        // First get the currentUSer
        previousUser = (await getCurrentUser()) as User;
        // Get the credentials from the EmailAuthProvider
        final authCreds = EmailAuthProvider.credential(
            email: userEmail, password: userPassword);
        // And link it to the current account
        userCreds = await previousUser.linkWithCredential(authCreds);
        return Right(userCreds);
      } else {
        userCreds = await auth.createUserWithEmailAndPassword(
          email: userEmail,
          password: userPassword,
        );

        User? user = userCreds.user;
        String uid = user!.uid;
        Map<String, dynamic> map = {
          "uid": uid,
          "name": userName!,
          "email": userEmail,
          "isDriver": true
        };
        addUser(uid: uid, map: map);

        Map<String, String> mapInfos = {
          "uid": uid,
          "number": userNumber!,
          "typeofcar": typeOfCar!,
          "brand": brand!,
          "color": color!,
        };
        addDriverInfos(uid: uid, map: mapInfos);

        // User user = auth.currentUser!;
        // if (!user.emailVerified) {
        //   await user.sendEmailVerification();
        // }
        User currentUser = userCreds.user!;
        print("user : ${currentUser.email}");
        return Right(userCreds);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return Left(GenericAppError('email-already-in-use'));
      } else if (e.code == 'invalid-email') {
        return Left(GenericAppError('invalid-email'));
      }
      if (e.code == 'operation-not-allowed') {
        return Left(GenericAppError('operation-not-allowed'));
      }
      if (e.code == 'week-password') {
        return Left(GenericAppError('week-password'));
      } else {
        return Left(GenericAppError('Server error'));
      }
    }
  }

  // Future<Either<AuthFailure, Unit>> signInWithFacebook({bool reauth = false}) async {
  //   try {
  //     final result = await _facebookLogin.logIn(['email']);
  //     auth.User previousUser;
  //     switch (result.status) {
  //       case FacebookLoginStatus.loggedIn:
  //         final FacebookAccessToken accessToken = result.accessToken;
  //         final facebookAuthCred =
  //             auth.FacebookAuthProvider.credential(accessToken.token);
  //         if (reauth) {
  //           previousUser = await getCurrentUser();
  //           await previousUser.linkWithCredential(facebookAuthCred);
  //         } else {
  //           await _firebaseAuth.signInWithCredential(facebookAuthCred);
  //         }
  //         break;
  //       case FacebookLoginStatus.cancelledByUser:
  //         return const Left(AuthFailure.cancelledByUser());
  //       case FacebookLoginStatus.error:
  //         return const Left(AuthFailure.serverError());
  //     }

  //     return right(unit);
  //   } on PlatformException catch (e) {
  //     print(e);
  //     return const Left(AuthFailure.serverError());
  //   }
  // }

  //  @override
  // Future<Either<FirebaseauthFailure, Unit>> changePassword(
  //     Password newPassword, Password oldPassword, EmailAddress email) async {
  //   final auth.User user = await getCurrentUser();
  //   try {
  //     await user.updatePassword(newPassword.getOrCrash());
  //     return right(unit);
  //   } on auth.FirebaseAuthException catch (e) {
  //     if (e.code.contains('requires-recent-login')) {
  //       try {
  //         final auth.AuthCredential credential =
  //             auth.EmailAuthProvider.credential(
  //                 email: email.getOrCrash(),
  //                 password: oldPassword.getOrCrash());
  //         await user.reauthenticateWithCredential(credential);
  //         return right(unit);
  //       } on auth.FirebaseAuthException catch (e) {
  //         if (e.code.contains('user-mismatch')) {
  //           return left(const FirebaseauthFailure.userMismatch());
  //         } else if (e.code.contains('user-not-found')) {
  //           return left(const FirebaseauthFailure.userNotFound());
  //         } else if (e.code.contains('invalid-credential')) {
  //           return left(const FirebaseauthFailure.invalidCredential());
  //         } else if (e.code.contains('invalid-email')) {
  //           return left(const FirebaseauthFailure.invalidEmail());
  //         } else if (e.code.contains('wrong-password')) {
  //           return left(const FirebaseauthFailure.wrongPassword());
  //         }
  //       }
  //     } else if (e.code.contains('weak-password')) {
  //       return left(const FirebaseauthFailure.weakPassword());
  //     }
  //     return left(const FirebaseauthFailure.serverError());
  //   }
  // }

//Apple code iOS.
  //  Future<Either<AuthFailure, Unit>> signInWithApple({bool reauth = false}) async {
  //   try {
  //     auth.User previousUser;
  //     if (reauth) {
  //       previousUser = await getCurrentUser();
  //     }
  //     final credential = await apple.SignInWithApple.getAppleIDCredential(
  //       scopes: [
  //         apple.AppleIDAuthorizationScopes.email, apple.AppleIDAuthorizationScopes.fullName,
  //       ],
  //       webAuthenticationOptions: apple.WebAuthenticationOptions(
  //         clientId: appleClientId,
  //         redirectUri: Uri.parse(appleRedirectUri),
  //       ),
  //     );
  //     if (credential == null) {
  //       return const Left(AuthFailure.cancelledByUser());
  //     }
  //     final oAuthProvider = auth.OAuthProvider(appleProvider); // basically appleProvider is the String "apple.com"
  //     final newCredentials = oAuthProvider.credential(
  //       idToken: credential.identityToken,
  //       accessToken: credential.authorizationCode,
  //     );
  //     if (reauth) {
  //       await previousUser.linkWithCredential(newCredentials);
  //     } else {
  //       final auth.UserCredential userCreds =
  //           await _firebaseAuth.signInWithCredential(newCredentials);
  //     }
  //     return right(unit);
  //   } on apple.SignInWithAppleException catch (e) {
  //     if (e is apple.SignInWithAppleNotSupportedException) {
  //       return const Left(AuthFailure.wrongIosVersion());
  //     }
  //     return const Left(AuthFailure.serverError());
  //   }  on auth.FirebaseAuthException catch (e) {
  //     // Handle FirebaseAuthException
  //   }
  // }
}
