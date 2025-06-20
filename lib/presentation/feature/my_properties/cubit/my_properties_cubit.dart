import 'package:aqar_go/domain/model/domain_error.dart';
import 'package:aqar_go/domain/model/property.dart';
import 'package:aqar_go/domain/repo/property_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_properties_state.dart';

part 'my_properties_cubit.freezed.dart';

class MyPropertiesCubit extends Cubit<MyPropertiesState> {
  final PropertyRepo _propertyRepo;

  MyPropertiesCubit(this._propertyRepo)
    : super(const MyPropertiesState.loading()) {
    fetchMyProperties();
  }

  Future<void> fetchMyProperties() async {
    emit(MyPropertiesState.loading());
    final response = await _propertyRepo.getUserProperties();
    response.when(
      onSuccess: (successData) {
        emit(MyPropertiesState.success(successData));
      },
      onError: (error) {
        emit(MyPropertiesState.error(error));
      },
    );
  }
}
