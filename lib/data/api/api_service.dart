import 'package:aqar_go/data/model/api_response.dart';
import 'package:aqar_go/data/model/auth/auth_response_data.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import '../model/auth/login_request.dart';
import '../model/auth/register_request.dart';
import 'api_constants.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: APIConstants.baseUrl)
abstract class APIService {
  factory APIService(Dio dio, {String baseUrl}) = _APIService;

  @POST(APIConstants.loginUrl)
  Future<APIResponse<AuthResponseData>> login(@Body() LoginRequest request);

  @POST(APIConstants.registerUrl)
  Future<APIResponse<AuthResponseData>> register(
    @Body() RegisterRequest request,
  );
}
