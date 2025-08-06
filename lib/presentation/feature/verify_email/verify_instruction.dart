import '../../routing/guest_mode/post_login_instruction.dart';

class VerifyInstruction {
  final bool afterLogin;
  final PostLoginInstruction? postLoginInstruction;

  VerifyInstruction({
    this.afterLogin = false,
    this.postLoginInstruction,
  });
}