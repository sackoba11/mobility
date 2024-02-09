import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:mobility/app/error/app_error.dart';
import 'package:mobility/app/repositories/authRepositiry/i_auth_repository.dart';

@LazySingleton(as: IAuthRepository)
class AuthRepositoryImpl implements IAuthRepository {
  static final entryPoint = FirebaseDatabase.instance.ref();
  static final userEntry = entryPoint.child("users");

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

  @override
  Future<Either<AppError, bool>> signIn() async {
    return right(true);
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
