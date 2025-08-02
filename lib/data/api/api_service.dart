import 'package:aqar_go/data/model/ad/ad_data.dart';
import 'package:aqar_go/data/model/ad/request/create_ad_request.dart';
import 'package:aqar_go/data/model/api_response.dart';
import 'package:aqar_go/data/model/auth/auth_response_data.dart';
import 'package:aqar_go/data/model/profile/data_user_profile.dart';
import 'package:aqar_go/data/model/property/property_data.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import '../model/activate_selected_ads/activate_selected_ads_request.dart';
import '../model/ad/response/create_ad_response.dart';
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

  // @POST(APIConstants.createProperty)
  // Future<APIResponse<PropertyData>> createProperty(@Body() CreatePropertyRequest request);

  @POST(APIConstants.createPropertyUrl)
  Future<APIResponse<PropertyData>> createProperty(@Body() FormData formData);

  @POST(
    "${APIConstants.updatePropertyUrl}/{id}",
  ) // we should pass the id like this: // APIConstants.updatePropertyUrl /{id}
  Future<APIResponse<PropertyData>> updateProperty(
    @Path("id") int id,
    @Body() FormData formData,
  );

  @GET(APIConstants.getProfileUrl)
  Future<APIResponse<DataUserProfile>> getProfile();

  @GET(APIConstants.getUserPropertiesUrl)
  Future<APIResponse<List<PropertyData>>> getUserProperties();

  @POST(APIConstants.createAdUrl)
  Future<APIResponse<CreateAdResponse>> createAd(
    @Body() CreateAdRequest request,
  );

  @GET("${APIConstants.getAdByIdUrl}/{id}")
  Future<APIResponse<AdData>> getAdById(@Path("id") int id);

  @POST(APIConstants.getUserAdsUrl)
  Future<APIResponse<List<AdData>>> getUserAds();

  @POST(APIConstants.activateSelectedAdsUrl)
  Future<APIResponse<List<dynamic>>> activateSelectedAds(
    @Body() ActivateSelectedAdsRequest activateSelectedAdsRequest,
  );

  @GET("${APIConstants.deactivateAdUrl}/{id}")
  Future<APIResponse<dynamic>> deactivateAd(@Path("id") int id);

  @DELETE("${APIConstants.deleteAdUrl}/{id}")
  Future<APIResponse<dynamic>> deleteAd(@Path("id") int id);
}
