part of 'media_picker_cubit.dart';

@immutable
class MediaPickerState extends Equatable {
  final List<MediaFile> files;

  // we may need a isLoading field...

  const MediaPickerState({this.files = const []});

  /// Adds a new file to the list (without modifying the original list)
  MediaPickerState copyWithFile(MediaFile file) {
    return MediaPickerState(files: [...files, file]);
  }

  /// Replaces the entire list of files
  MediaPickerState copyWith(List<MediaFile> files) {
    return MediaPickerState(files: files);
  }

  /// Removes a file from the list
  MediaPickerState copyWithoutThisFile(MediaFile file) {
    return MediaPickerState(
      files: files.where((element) => element != file).toList(),
    );
  }

  @override
  String toString() => 'MediaPickerState(files: $files)';

  @override
  List<Object?> get props => files;
}
