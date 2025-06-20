import 'package:aqar_go/common/helpers/logging_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

import '../../../domain/model/media_file.dart';

part 'media_picker_state.dart';

class MediaPickerCubit extends Cubit<MediaPickerState> {
  final ImagePicker _imagePicker;

  MediaPickerCubit(this._imagePicker) : super(MediaPickerState());

  Future<void> pickImage() async {
    final pickedFile = await _imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      final mediaFile = MediaFile(path: pickedFile.path);
      emit(state.copyWithFile(mediaFile));
    }
  }

  void removeImage(MediaFile file) {
    emit(state.copyWithoutThisFile(file));
  }
}
