import 'package:core/utilities/data/network_gen/error_handler.dart';
import 'package:dartz/dartz.dart';
import 'package:core/utilities/data/network_gen/failure.dart';
import 'package:injectable/injectable.dart';
import '../dtos/requests/sign_up_request.dart';
import '../dtos/responses/sign_up_response.dart';
import '../services/rest_service.dart';

abstract class AuthRepository {
  Future<Either<Failure, SignUpResponse>> signUp(
    SignUpRequest request,
  );
}

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthService _authService;

  AuthRepositoryImpl(this._authService);

  @override
  Future<Either<Failure, SignUpResponse>> signUp(SignUpRequest request)async {
    try {
      final SignUpResponse response =
          await _authService.signUp(request);
      return Right(response);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }
}
