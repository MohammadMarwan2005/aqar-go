import 'package:aqar_go/data/model/ad/ad_data.dart';
import 'package:aqar_go/data/model/ad/request/create_ad_request.dart';
import 'package:aqar_go/data/model/api_response.dart';
import 'package:aqar_go/data/model/auth/auth_response_data.dart';
import 'package:aqar_go/data/model/near_to_you/near_to_you_request.dart';
import 'package:aqar_go/data/model/paged_response.dart';
import 'package:aqar_go/data/model/property/property_data.dart';
import 'package:aqar_go/data/model/review/data_review.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../model/activate_selected_ads/activate_selected_ads_request.dart';
import '../model/ad/response/create_ad_response.dart';
import '../model/auth/login_request.dart';
import '../model/auth/register_request.dart';
import '../model/profile/user/data_user.dart';
import '../model/paging/page_request.dart';
import '../model/report/create/create_report_request.dart';
import '../model/reset_password/reset/reset_password_request.dart';
import '../model/reset_password/send_email/send_reset_password_email_request.dart';
import '../model/search/data_search_filter_settings.dart';
import 'api_constants.dart';

part 'api_service.g.dart';

// dart run build_runner watch -d
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
  Future<APIResponse<DataUser>> getProfile();

  @GET(APIConstants.getUserPropertiesUrl)
  Future<APIResponse<PagedResponse<PropertyData>>> getUserProperties({
    @Query("page") required int page,
    @Body() required PageRequest request,
  });

  @POST(APIConstants.createAdUrl)
  Future<APIResponse<CreateAdResponse>> createAd(
    @Body() CreateAdRequest request,
  );

  @GET("${APIConstants.getAdByIdUrl}/{id}")
  Future<APIResponse<AdData>> getAdById(@Path("id") int id);

  @POST(APIConstants.getUserAdsUrl)
  Future<APIResponse<PagedResponse<AdData>>> getUserAds({
    @Query("page") required int page,
    @Body() required PageRequest request,
  });

  @POST(APIConstants.searchAdsUrl)
  Future<APIResponse<PagedResponse<AdData>>> search(
    @Query("page") int page,
    @Body() DataSearchFilterSettings dataSearchFilterSettings,
  );

  @POST(APIConstants.getNearToYouAdsUrl)
  Future<APIResponse<PagedResponse<AdData>>> getNearToYouAds({
    @Query("page") required int page,
    @Body() required NearToYouRequest request,
  });

  @POST(APIConstants.getRecommendedAdsUrl)
  Future<APIResponse<PagedResponse<AdData>>> getRecommendedAds({
    @Query("page") required int page,
    @Body() required PageRequest request,
  });

  @POST(APIConstants.activateSelectedAdsUrl)
  Future<APIResponse<List<dynamic>>> activateSelectedAds(
    @Body() ActivateSelectedAdsRequest activateSelectedAdsRequest,
  );

  @GET("${APIConstants.deactivateAdUrl}/{id}")
  Future<APIResponse<dynamic>> deactivateAd(@Path("id") int id);

  @DELETE("${APIConstants.deleteAdUrl}/{id}")
  Future<APIResponse<dynamic>> deleteAd(@Path("id") int id);

  @POST(APIConstants.verifyEmailUrl)
  Future<APIResponse<dynamic>> sendVerificationEmail();

  @POST(APIConstants.sendResetPasswordUrl)
  Future<APIResponse<dynamic>> sendResetPasswordEmail(
    @Body() SendResetPasswordEmailRequest request,
  );

  @POST(APIConstants.resetPasswordUrl)
  Future<APIResponse<AuthResponseData>> resetPassword(
    @Body() ResetPasswordRequest resetPasswordRequest,
  );

  @POST(APIConstants.updateProfileUrl)
  Future<APIResponse<DataUser>> updateProfile(@Body() FormData formData);

  @POST(APIConstants.createReportUrl)
  Future<APIResponse<dynamic>> createReport(
    @Body() CreateReportRequest createReportRequest,
  );

  @GET(APIConstants.getAdReviewsUrl)
  Future<APIResponse<List<DataReview>>> getAdReviews(@Path("id") int adId);

  @GET(APIConstants.getReviewByIdUrl)
  Future<APIResponse<DataReview>> getReviewById(@Path("id") int reviewId);

  @POST(APIConstants.createReviewUrl)
  Future<APIResponse<DataReview>> createReview(@Body() DataReview body);
}
