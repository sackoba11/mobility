import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_database/firebase_database.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:mobility/app/error/app_error.dart';
import 'package:mobility/app/repositories/authRepositiry/i_auth_repository.dart';

@LazySingleton(as: IAuthRepository)
class AuthRepositoryImpl implements IAuthRepository {
  static final entryPoint = FirebaseDatabase.instance.ref();
  static final userEntry = entryPoint.child("users");
  final auth.FirebaseAuth firebaseAuth = auth.FirebaseAuth as auth.FirebaseAuth;

  addUser(String uid, Map map) async {
    userEntry.child(uid).set(map);
    //await entryDB.collection("users").doc(uid).set(map);
  }

  // obtenir user
  // Future<MyUser> getUser(String uid) async {
  //   DatabaseEvent snapshot = (await userEntry.child(uid).once());
  //   MyUser user = MyUser(snapshot.snapshot);
  //   return user;
  // }

  // @override
  // Future<Either<AppError, bool>> signInWithGoogle() async {
  //   return right(true);
  // }

  Future<auth.User> getCurrentUser() async {
    return firebaseAuth.currentUser!;
  }

  @override
  Future<Either<AppError, Unit>> signInWithGoogle({bool reauth = false}) async {
    try {
      auth.User previousUser;
      final googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        return Left(GenericAppError("Cancelled by User"));
      }
      final googleAuthentication = await googleUser.authentication;
      if (reauth) {
        previousUser = await getCurrentUser();
        final relinkCred = auth.GoogleAuthProvider.credential(
            idToken: googleAuthentication.idToken,
            accessToken: googleAuthentication.accessToken);
        await previousUser.linkWithCredential(relinkCred);
      } else {
        final authCredential = auth.GoogleAuthProvider.credential(
            idToken: googleAuthentication.idToken,
            accessToken: googleAuthentication.accessToken);

        final auth.UserCredential userCreds =
            await firebaseAuth.signInWithCredential(authCredential);
      }
      return right(unit);
    } on auth.FirebaseAuthException catch (e) {
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
    }
  }

  @override
  Future<Either<AppError, Unit>> signInWithEmailAndPassword({
    required String usereEmail,
    required String userPassword,
    bool isLinkWithCredentials = false,
  }) async {
    auth.User previousUser;
    try {
      if (isLinkWithCredentials) {
        // This is where the magic happens
        // First get the currentUSer
        previousUser = await getCurrentUser();
        // Get the credentials from the EmailAuthProvider
        final authCreds = auth.EmailAuthProvider.credential(
            email: usereEmail, password: userPassword);
        // And link it to the current account
        await previousUser.linkWithCredential(authCreds);
      } else {
        final auth.UserCredential userCreds =
            await firebaseAuth.createUserWithEmailAndPassword(
          email: usereEmail,
          password: userPassword,
        );
        auth.User user = firebaseAuth.currentUser!;
        if (!user.emailVerified) {
          await user.sendEmailVerification();
        }
      }
      return const Right(unit);
    } on auth.FirebaseAuthException catch (e) {
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

  // Future<UserCredential> signInWithGoogle() async {
  //   // Trigger the authentication flow
  //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  //   // Obtain the auth details from the request
  //   final GoogleSignInAuthentication? googleAuth =
  //       await googleUser?.authentication;

  //   // Create a new credential
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth?.accessToken,
  //     idToken: googleAuth?.idToken,
  //   );

  //   // Once signed in, return the UserCredential
  //   return await FirebaseAuth.instance.signInWithCredential(credential);
  // }

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

  // @overrideFuture<void> resetPassword({@required EmailAddress email}) =>_firebaseAuth.sendPasswordResetEmail(email: email.getOrCrash());

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
