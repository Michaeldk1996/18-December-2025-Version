import '/flutter_flow/flutter_flow_util.dart';
import 'confirm_reset_password_widget.dart' show ConfirmResetPasswordWidget;
import 'package:flutter/material.dart';

class ConfirmResetPasswordModel
    extends FlutterFlowModel<ConfirmResetPasswordWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailFocusNode?.dispose();
    emailTextController?.dispose();
  }
}
