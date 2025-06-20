import 'package:aqar_go/domain/model/domain_error.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../../domain/model/media_file.dart';
import '../../../../domain/model/property.dart';
import '../../../../domain/usecase/create_property_usecase.dart';
import '../post_form_data.dart';

part 'edit_create_post_state.dart';

/* todo:
* you have a state, with a PostFormData, the PostFormData has:
* 1. #Primry_Fields: the property details, like its title, description, price... and selected property type
* 2. #Secondary_Fields: fields depending on the selected property type...
* >> to create a post:
* a. you fill the primary fields, b. fill a type, c. fill the secondary fields, d. click post,
* - that will validate the input, then will send the request,
* if the request succeeded, go out,
* if it failed: show error message,
*
* >> to update a post:
* a. load the current post data and fill it in the PostFormData
* b. like create, but use update, not create
* */

class EditCreatePostCubit extends Cubit<EditCreatePostState> {
  // property stuff...:
  // name, desc, area, price, images...
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final areaController = TextEditingController();
  final priceController = TextEditingController();
  final tempLocationIdController = TextEditingController();

  final CreatePropertyUsecase _createPropertyUsecase;

  EditCreatePostCubit(this._createPropertyUsecase)
    : super(EditCreatePostInitial(formData: PostFormData()));

  Future<void> createPost(List<MediaFile> mediaFiles) async {
    final validated = formKey.currentState?.validate();
    if (validated == true) {
      emit(EditCreatePostLoading(formData: state.formData));

      final formData = state.formData;
      final area = int.parse(formData.area);
      final locationId = formData.locationId ?? -1;
      final price = int.parse(formData.price);
      final title = formData.title;
      final description = formData.description;
      final propertable = formData.getPropertable();

      final response = await _createPropertyUsecase.call(
        Property(
          id: 0,
          userId: 0,
          locationId: locationId,
          propertableId: 0,
          area: area,
          price: price,
          title: title,
          description: description,
          propertable: propertable,
          images: mediaFiles,
        ),
        mediaFiles,
      );

      response.when(
        onSuccess: (successData) {
          emit(
            EditCreatePostSuccess(
              formData: state.formData,
              property: successData,
            ),
          );
        },
        onError: (error) {
          emit(EditCreatePostError(formData: state.formData, error: error));
        },
      );

    } else {
      emit(
        EditCreatePostError(
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

  void updateFormData(
    PostFormData Function(PostFormData currentFormData) update,
  ) {
    emit(state.copyWithFormData(update(state.formData)));
  }
}
