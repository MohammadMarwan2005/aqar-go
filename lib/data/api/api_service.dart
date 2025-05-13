import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'api_constants.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: APIConstants.baseUrl)
abstract class APIService {
  factory APIService(Dio dio, {String baseUrl}) = _APIService;
}
