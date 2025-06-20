import 'package:equatable/equatable.dart';

class MediaFile extends Equatable {
  final int? id;
  final String? imageUrl;
  final String? path;

  const MediaFile({this.id, this.imageUrl, this.path});

  MediaFile copyWith({int? id, String? imageUrl, String? path}) {
    return MediaFile(
      id: id ?? this.id,
      imageUrl: imageUrl ?? this.imageUrl,
      path: path ?? this.path,
    );
  }

  @override
  List<Object?> get props => [id, imageUrl, path];
}
