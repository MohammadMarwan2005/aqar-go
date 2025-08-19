import 'package:aqar_go/domain/model/domain_error.dart';
import 'package:aqar_go/domain/model/property.dart';
import 'package:aqar_go/domain/repo/property_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/model/resource.dart';
import '../../paging_base/cubit/paging_cubit.dart';

part 'my_properties_cubit.freezed.dart';
part 'my_properties_state.dart';

class MyPropertiesCubit extends PagingCubit<Property> {
  final PropertyRepo _propertyRepo;

  MyPropertiesCubit(this._propertyRepo)
    : super(const PagingState.loading([], 1, false));

  @override
  Future<Resource<List<Property>>> getItems(int page) async {
    return _propertyRepo.getUserProperties(page: page, pageSize: pageSize);
  }

  @override
  int pageSize = 5;
}
