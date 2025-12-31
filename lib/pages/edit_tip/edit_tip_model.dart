import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'edit_tip_widget.dart' show EditTipWidget;
import 'package:flutter/material.dart';

class EditTipModel extends FlutterFlowModel<EditTipWidget> {
  ///  Local state fields for this page.

  String group = 'Public';

  String uploadedImageUrl = 'false';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in EditTip widget.
  CommunicationRecord? selectedTrip;
  // State field(s) for title widget.
  FocusNode? titleFocusNode;
  TextEditingController? titleTextController;
  String? Function(BuildContext, String?)? titleTextControllerValidator;
  // State field(s) for reliability widget.
  FocusNode? reliabilityFocusNode;
  TextEditingController? reliabilityTextController;
  String? Function(BuildContext, String?)? reliabilityTextControllerValidator;
  bool isDataUploading_uploadDataSk7 = false;
  FFUploadedFile uploadedLocalFile_uploadDataSk7 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataSk7 = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    titleFocusNode?.dispose();
    titleTextController?.dispose();

    reliabilityFocusNode?.dispose();
    reliabilityTextController?.dispose();
  }
}
