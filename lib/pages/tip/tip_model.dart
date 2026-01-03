import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'tip_widget.dart' show TipWidget;
import 'package:flutter/material.dart';

class TipModel extends FlutterFlowModel<TipWidget> {
  ///  Local state fields for this page.

  String group = 'Insights';

  ///  State fields for stateful widgets in this page.

  // State field(s) for title widget.
  FocusNode? titleFocusNode;
  TextEditingController? titleTextController;
  String? Function(BuildContext, String?)? titleTextControllerValidator;
  // Stores action output result for [Bottom Sheet - GroupSelector] action in Container widget.
  String? selectedGroup;
  // State field(s) for reliability widget.
  FocusNode? reliabilityFocusNode;
  TextEditingController? reliabilityTextController;
  FocusNode? minimumoddFocusNode;
  TextEditingController? minimumoddTextController;
  String? Function(BuildContext, String?)? reliabilityTextControllerValidator;
  // State field(s) for content widget.
  FocusNode? contentFocusNode;
  TextEditingController? contentTextController;
  String? Function(BuildContext, String?)? contentTextControllerValidator;
  bool isDataUploading_uploadData = false;
  FFUploadedFile uploadedLocalFile_uploadData = FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadData = '';

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<CommunicationRecord>? posts;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<CommunicationRecord>? messages;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    titleFocusNode?.dispose();
    titleTextController?.dispose();

    reliabilityFocusNode?.dispose();
    reliabilityTextController?.dispose();

    minimumoddFocusNode?.dispose();
    minimumoddTextController?.dispose();

    contentFocusNode?.dispose();
    contentTextController?.dispose();
  }
}
