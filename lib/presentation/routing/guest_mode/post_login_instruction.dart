import 'package:freezed_annotation/freezed_annotation.dart';
part 'post_login_instruction.freezed.dart';

@freezed
class PostLoginInstruction with _$PostLoginInstruction {
  factory PostLoginInstruction({
    required String redirectionRoute,
    Object? itsExtras,
  }) = _PostLoginInstruction;
}
