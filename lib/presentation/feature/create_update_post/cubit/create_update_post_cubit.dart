import 'package:aqar_go/domain/model/domain_error.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/model/media_file.dart';
import '../../../../domain/model/property.dart';
import '../../../../domain/repo/ad_repo.dart';
import '../../../../domain/usecase/create_property_usecase.dart';
import '../post_form_data.dart';

part 'create_update_post_state.dart';

class CreateUpdatePostCubit extends Cubit<CreateUpdatePostState> {
  // property stuff...:
  // name, desc, area, price, images...
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final areaController = TextEditingController();
  final priceController = TextEditingController();
  final tempLocationIdController = TextEditingController();

  // the passed property when updating
  final Property? property;
  late bool isUpdate = property != null;

  final CreateUpdatePropertyUsecase _createUpdatePropertyUsecase;
  final AdRepo _adRepo;

  CreateUpdatePostCubit(
    this._createUpdatePropertyUsecase,
    this._adRepo, {
    this.property,
  }) : super(
         CreateUpdatePostInitial(formData: PostFormData.fromProperty(property)),
       );

  Future<void> createOrUpdatePost(
    List<MediaFile> mediaFiles,
    List<int> toDeleteImagesIds,
  ) async {
    final validated = formKey.currentState?.validate();
    if (validated == true) {
      emit(CreateUpdatePostLoading(formData: state.formData));

      final formData = state.formData;

      final response = await _createUpdatePropertyUsecase.call(
        formData,
        mediaFiles,
        toDeleteImagesIds,
        isUpdate,
        property,
      );

      response.when(
        onSuccess: (successData) {
          emit(
            CreateUpdatePostSuccess(
              formData: state.formData,
              property: successData,
            ),
          );
        },
        onError: (error) {
          emit(CreateUpdatePostError(formData: state.formData, error: error));
        },
      );
    } else {
      emit(
        CreateUpdatePostError(
          isSnackBar: true,
          formData: state.formData,
          error: DomainError(
            message: "Enter valid input please!",
            messageId: "Enter valid input please!",
          ),
        ),
      );
    }
  }

  Future<void> createAd() async {
    emit(CreateAdLoading(formData: state.formData));
    if (property == null) {
      emit(
        CreateUpdatePostError(
          isSnackBar: true,
          formData: state.formData,
          error: DomainError(
            message: "This property is not valid!",
            messageId: "This property is not valid!",
          ),
        ),
      );
      return;
    }

    final response = await _adRepo.createAd(property!.id);

    response.when(
      onSuccess: (successData) {
        emit(CreateAdSuccess(formData: state.formData));
      },
      onError: (error) {
        emit(CreateUpdatePostError(formData: state.formData, error: error));
      },
    );
  }

  void updateFormData(
    PostFormData Function(PostFormData currentFormData) update,
  ) {
    emit(state.copyWithFormData(update(state.formData)));
  }
}
