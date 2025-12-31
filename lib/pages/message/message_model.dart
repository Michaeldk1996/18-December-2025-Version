import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'message_widget.dart' show MessageWidget;
import 'package:flutter/material.dart';

class MessageModel extends FlutterFlowModel<MessageWidget> {
  ///  Local state fields for this page.

  String group = 'Public';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in Message widget.
  CommunicationRecord? selectedTip;
  // State field(s) for title widget.
  FocusNode? titleFocusNode;
  TextEditingController? titleTextController;
  String? Function(BuildContext, String?)? titleTextControllerValidator;
  // Stores action output result for [Bottom Sheet - GroupSelector] action in Container widget.
  String? selectedGroup;
  // State field(s) for content widget.
  FocusNode? contentFocusNode;
  TextEditingController? contentTextController;
  String? Function(BuildContext, String?)? contentTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<CommunicationRecord>? messages;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    titleFocusNode?.dispose();
    titleTextController?.dispose();

    contentFocusNode?.dispose();
    contentTextController?.dispose();
  }
}
