import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify/data/models/auth/create_user_request.dart';
import 'package:spotify/data/models/auth/signin_user_req.dart';

abstract class AuthFirebaseService{

  Future<Either> signup(CreateUserRequest createUserRequest);

  Future<Either> signin(SigninUserRequest signinUserReq);

}

class AuthFirebaseServiceImpl extends AuthFirebaseService{
  @override
  Future<Either> signin(SigninUserRequest signinUserReq) async{
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: signinUserReq.email, 
        password: signinUserReq.password
      );
      return Right('Signin was Successfull');
    } on FirebaseAuthException catch(e) {
      String message = '';

      if(e.code == 'invalid-email'){
        message = 'Not user found for that email';
      }else if(e.code == 'invalid-credential'){
        message = 'Wrong password provided for that user';
      }
      return Left(message);
    }
  }

  @override

  Future<Either> signup(CreateUserRequest createUserRequest) async{
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: createUserRequest.email, 
        password: createUserRequest.password
      );
      return const  Right('Signup was Successfull');
    } on FirebaseAuthException catch(e) {
      String message = '';

      if(e.code == 'weak-password'){
        message = 'The password provided is too weak';
      }else if(e.code == 'email-already-in-use'){
        message = 'an account already exists with that email';
      }
      return Left(message);
    }
  }
}