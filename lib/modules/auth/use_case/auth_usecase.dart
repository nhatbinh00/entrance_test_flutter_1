import 'package:injectable/injectable.dart';
import '../dtos/requests/sign_up_request.dart';
import '../dtos/responses/sign_up_response.dart';
import '../repositories/auth_repository.dart';
import 'package:core/utilities/data/network_gen/error_handler.dart';
import 'package:dartz/dartz.dart';
import 'package:core/utilities/data/network_gen/failure.dart';

@LazySingleton()
class AuthUseCase {
  final AuthRepository _authRepository;
  AuthUseCase(this._authRepository);

  /// verify OTP
  Future<Either<Failure, SignUpResponse>> signUp(
    SignUpRequest request,
  ) async {
    return await _authRepository.signUp(request);
  }
}
