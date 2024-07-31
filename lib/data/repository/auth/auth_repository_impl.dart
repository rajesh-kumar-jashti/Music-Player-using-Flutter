import 'package:dartz/dartz.dart';
import 'package:spotify/data/datasources/auth/auth_firebase_service.dart';
import 'package:spotify/data/models/auth/create_user_request.dart';
import 'package:spotify/data/models/auth/signin_user_req.dart';
import 'package:spotify/domain/repository/auth.dart';
import 'package:spotify/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository{
  @override
  Future<Either> signin(SigninUserRequest signinUserReq) async{
    return await sl<AuthFirebaseService>().signin(signinUserReq);
  }

  @override
  Future<Either> signup(CreateUserRequest createUserRequest) async{
    return await sl<AuthFirebaseService>().signup(createUserRequest);
  }
}