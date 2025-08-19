import 'package:aqar_go/data/model/api_response.dart';
import 'package:aqar_go/data/model/create_property/create_property_request.dart';
import 'package:aqar_go/data/model/paged_response.dart';
import 'package:aqar_go/data/model/paging/page_request.dart';
import 'package:aqar_go/data/model/property/property_data.dart';

import '../../domain/model/property.dart';
import '../../domain/model/resource.dart';
import '../../domain/repo/property_repo.dart';
import '../api/api_service.dart';
import '../api/safe_api_caller.dart';

class PropertyRepoImpl extends PropertyRepo {
  final APIService _apiService;
  final SafeAPICaller _safeAPICaller;

  PropertyRepoImpl(this._apiService, this._safeAPICaller);

  @override
  Future<Resource<Property>> createProperty(Property property) async {
    final data = await property.asFormData();
    return await _safeAPICaller.call<Property, APIResponse<PropertyData>>(
      apiCall: () {
        return _apiService.createProperty(data);
      },
      dataToDomain: (data) {
        return data.data.toDomain();
      },
    );
  }

  @override
  Future<Resource<Property>> updateProperty(
    Property property,
    List<int> toDeleteIds,
  ) async {
    final formData = await property.asFormData(toDeleteImagesIds: toDeleteIds);
    return await _safeAPICaller.call<Property, APIResponse<PropertyData>>(
      apiCall: () {
        return _apiService.updateProperty(property.id, formData);
      },
      dataToDomain: (data) {
        return data.data.toDomain();
      },
    );
  }

  @override
  Future<Resource<List<Property>>> getUserProperties({
    required int page,
    required int pageSize,
  }) async {
    return await _safeAPICaller
        .call<List<Property>, APIResponse<PagedResponse<PropertyData>>>(
          apiCall: () {
            return _apiService.getUserProperties(
              page: page,
              request: PageRequest(pageSize: pageSize),
            );
          },
          dataToDomain: (data) {
            return data.data.data
                .map((dataProperty) => dataProperty.toDomain())
                .toList();
          },
        );
  }
}
