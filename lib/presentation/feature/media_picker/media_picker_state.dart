part of 'media_picker_cubit.dart';

@immutable
class MediaPickerState extends Equatable {
  final List<MediaFile> files;
  final List<int> toDeleteImagesIds;

  // we may need a isLoading field...

  const MediaPickerState({this.files = const [], this.toDeleteImagesIds = const []});

  /// Adds a new file to the list (without modifying the original list)
  MediaPickerState copyWithFile(MediaFile file) {
    return MediaPickerState(files: [...files, file], toDeleteImagesIds: toDeleteImagesIds);
  }

  /// Adds a list of files to the list (without modifying the original list)
  MediaPickerState copyWithFiles(List<MediaFile> newFiles) {
    return MediaPickerState(files: [...files, ...newFiles], toDeleteImagesIds: toDeleteImagesIds);
  }

  /// Replaces the entire list of files
  MediaPickerState copyWith(List<MediaFile> files) {
    return MediaPickerState(files: files, toDeleteImagesIds: toDeleteImagesIds);
  }

  /// Removes a file from the list
  MediaPickerState copyWithoutThisFile(MediaFile file) {
    var ids = toDeleteImagesIds;
    debugLog("copyWithoutThisFile: $file");
    if(file.id != null) {
      ids = [...ids, file.id!];
    }
    return MediaPickerState(
      files: files.where((element) => element != file).toList(),
      toDeleteImagesIds: ids
    );
  }

  @override
  String toString() => 'MediaPickerState(files: $files, toDeleteIds: $toDeleteImagesIds)';

  @override
  List<Object?> get props => [files, toDeleteImagesIds];
}
