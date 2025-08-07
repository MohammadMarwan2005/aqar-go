import 'package:freezed_annotation/freezed_annotation.dart';

@JsonSerializable(genericArgumentFactories: true)
class PagedResponse<T> {
  @JsonKey(name: "current_page")
  final int currentPage;

  @JsonKey(name: "last_page")
  final int lastPage;

  final List<T> data;

  PagedResponse({
    required this.currentPage,
    required this.lastPage,
    required this.data,
  });

  factory PagedResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    return PagedResponse(
      currentPage: json["current_page"],
      lastPage: json["last_page"],
      data: List<T>.from(json["data"].map((x) => fromJsonT(x))),
    );
  }

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) {
    return {
      "current_page": currentPage,
      "last_page": lastPage,
      "data": data.map((x) => toJsonT(x)).toList(),
    };
  }
}
