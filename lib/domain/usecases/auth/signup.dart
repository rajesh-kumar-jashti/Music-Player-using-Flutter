import 'package:dartz/dartz.dart';
import 'package:spotify/core/usecase/usecase.dart';
import 'package:spotify/data/models/auth/create_user_request.dart';
import 'package:spotify/domain/repository/auth.dart';
import 'package:spotify/service_locator.dart';

class SignupUseCase implements UseCase<Either,   CreateUserRequest>{

  @override
  Future<Either> call({CreateUserRequest ? params}) async{
    return  sl<AuthRepository>().signup(params!);
  }
}