import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../dtos/requests/sign_up_request.dart';
import '../dtos/responses/sign_up_response.dart';
import '../route.dart';

part 'rest_service.g.dart';

@lazySingleton
@RestApi()
abstract class AuthService {
  @factoryMethod
  factory AuthService(Dio dio) = _AuthService;

  @POST(RouteApi.signUp)
  Future<SignUpResponse> signUp(
      @Body() SignUpRequest request,
  );
}
