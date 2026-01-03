import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import '../analyses/analyses_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;

import '/backend/backend.dart';
import '/components/group_selector/group_selector_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'message_model.dart';
export 'message_model.dart';

class MessageWidget extends StatefulWidget {
  const MessageWidget({
    super.key,
    this.tipData,
  });

  final DocumentReference? tipData;

  static String routeName = 'Message';
  static String routePath = '/message';

  @override
  State<MessageWidget> createState() => _MessageWidgetState();
}

class _MessageWidgetState extends State<MessageWidget> {
  late MessageModel _model;
  File? _image, _pdf;
  final ImagePicker _picker = ImagePicker();
  String? attachmentURL;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  void pickImageAndUpload() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _pdf = null;
      _image = File(pickedFile.path);
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference storageRef =
          FirebaseStorage.instance.ref().child('images/$fileName');
      try {
        await storageRef.putFile(_image!);
        attachmentURL = await storageRef.getDownloadURL();
        if (mounted) {
          setState(() {});
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Upload failed!'), backgroundColor: Colors.red));
      }
    }
  }

  void pickPdfAndUpload() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null && result.files.single.path != null) {
      _image = null;
      _pdf = File(result.files.single.path!);
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference storageRef =
          FirebaseStorage.instance.ref().child('pdfs/$fileName');
      try {
        await storageRef.putFile(_pdf!);
        attachmentURL = await storageRef.getDownloadURL();
        if (mounted) {
          setState(() {});
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Upload failed!'), backgroundColor: Colors.red));
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MessageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Message'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('MESSAGE_PAGE_Message_ON_INIT_STATE');
      if (widget.tipData != null) {
        logFirebaseEvent('Message_backend_call');
        _model.selectedTip =
            await CommunicationRecord.getDocumentOnce(widget.tipData!);
        logFirebaseEvent('Message_update_page_state');
        _model.group = _model.selectedTip!.group;
        safeSetState(() {});
        logFirebaseEvent('Message_set_form_field');
        safeSetState(() {
          _model.titleTextController?.text = _model.selectedTip!.title;
        });
        logFirebaseEvent('Message_set_form_field');
        safeSetState(() {
          _model.contentTextController?.text = _model.selectedTip!.message;
        });
      }
    });

    _model.titleTextController ??= TextEditingController();
    _model.titleFocusNode ??= FocusNode();

    _model.contentTextController ??= TextEditingController();
    _model.contentFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFF122849),
        body: SafeArea(
          top: false,
          child: Stack(
            children: [
              Image.asset(
                'assets/images/home_bg.png',
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, right: 16.0, top: 0.0, bottom: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 24.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                4.0, 0.0, 24.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'MESSAGE_PAGE_Icon_j7kum3u5_ON_TAP');
                                logFirebaseEvent('Icon_navigate_back');
                                context.safePop();
                              },
                              child: Image.asset(
                                'assets/images/back_arrow.png',
                                width: 16.0,
                                height: 14.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Text(
                            widget.tipData != null
                                ? 'Edit a message'
                                : 'Add a message',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.figtree(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Title',
                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.figtree(
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 14.0,
                                    letterSpacing: 0.6,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                        SizedBox(height: 8.0),
                        Container(
                          height: 40.0,
                          child: TextFormField(
                            controller: _model.titleTextController,
                            focusNode: _model.titleFocusNode,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 10.0, 12.0, 10.0),
                              hintText: 'Enter Title',
                              hintStyle:
                                  FlutterFlowTheme.of(context).labelMedium.override(
                                        font: GoogleFonts.figtree(
                                          fontWeight: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .fontWeight,
                                          fontStyle: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .fontStyle,
                                        ),
                                        fontSize: 16.0,
                                        color: Color(0xFF667085),
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00FFFFFF),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF348AF7),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: Color(0xFFFFFFFF).withValues(alpha: 0.04),
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  font: GoogleFonts.figtree(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  fontSize: 16,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                            validator: _model.titleTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Text(
                          'Group',
                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                font: GoogleFonts.figtree(
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                                fontSize: 14.0,
                                letterSpacing: 0.6,
                                fontWeight: FontWeight.w400,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                        ),
                        SizedBox(height: 8.0),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Radio<String>(
                                  value: 'Insights',
                                  groupValue: _model.group,
                                  onChanged: (value) {
                                    safeSetState(() {
                                      _model.group = value!;
                                    });
                                  },
                                  activeColor: Color(0xFF007AFF),
                                  fillColor: WidgetStateProperty.resolveWith<Color>(
                                    (Set<WidgetState> states) {
                                      if (states.contains(WidgetState.selected)) {
                                        return Color(0xFF007AFF);
                                      }
                                      return Color(0xFF2B2F38);
                                    },
                                  ),
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  visualDensity: VisualDensity.compact,
                                ),
                                SizedBox(width: 4.0),
                                Text(
                                  'Insights',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.figtree(
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .fontStyle,
                                        ),
                                        color: Color(0xFFB9BDC7),
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ],
                            ),
                            SizedBox(width: 10.0),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Radio<String>(
                                  value: 'Bets',
                                  groupValue: _model.group,
                                  onChanged: (value) {
                                    safeSetState(() {
                                      _model.group = value!;
                                    });
                                  },
                                  activeColor: Color(0xFF007AFF),
                                  fillColor: WidgetStateProperty.resolveWith<Color>(
                                    (Set<WidgetState> states) {
                                      if (states.contains(WidgetState.selected)) {
                                        return Color(0xFF007AFF);
                                      }
                                      return Color(0xFF2B2F38);
                                    },
                                  ),
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  visualDensity: VisualDensity.compact,
                                ),
                                SizedBox(width: 4.0),
                                Text(
                                  'Bets',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.figtree(
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .fontStyle,
                                        ),
                                        color: Color(0xFFB9BDC7),
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ],
                            ),
                            SizedBox(width: 10.0),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Radio<String>(
                                  value: 'Both',
                                  groupValue: _model.group,
                                  onChanged: (value) {
                                    safeSetState(() {
                                      _model.group = value!;
                                    });
                                  },
                                  activeColor: Color(0xFF007AFF),
                                  fillColor: WidgetStateProperty.resolveWith<Color>(
                                    (Set<WidgetState> states) {
                                      if (states.contains(WidgetState.selected)) {
                                        return Color(0xFF007AFF);
                                      }
                                      return Color(0xFF2B2F38);
                                    },
                                  ),
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  visualDensity: VisualDensity.compact,
                                ),
                                SizedBox(width: 4.0),
                                Text(
                                  'Both',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.figtree(
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .fontStyle,
                                        ),
                                        color: Color(0xFFB9BDC7),
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ],
                            ),
                            SizedBox(width: 10.0),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Radio<String>(
                                  value: 'Exp-Insights',
                                  groupValue: _model.group,
                                  onChanged: (value) {
                                    safeSetState(() {
                                      _model.group = value!;
                                    });
                                  },
                                  activeColor: Color(0xFF007AFF),
                                  fillColor: WidgetStateProperty.resolveWith<Color>(
                                    (Set<WidgetState> states) {
                                      if (states.contains(WidgetState.selected)) {
                                        return Color(0xFF007AFF);
                                      }
                                      return Color(0xFF2B2F38);
                                    },
                                  ),
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  visualDensity: VisualDensity.compact,
                                ),
                                SizedBox(width: 4.0),
                                Flexible(
                                  child: Text(
                                    'Exp-Insights',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.figtree(
                                            fontWeight: FontWeight.w400,
                                            fontStyle: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .fontStyle,
                                          ),
                                          color: Color(0xFFB9BDC7),
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .fontStyle,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 20.0),
                        Text(
                          'Image',
                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                font: GoogleFonts.figtree(
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                                fontSize: 14.0,
                                letterSpacing: 0.6,
                                fontWeight: FontWeight.w400,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                        ),
                        SizedBox(height: 8.0),
                        InkWell(
                          onTap: () {
                            pickImageAndUpload();
                          },
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              return DottedBorder(
                                options: RectDottedBorderOptions(
                                  color: Color(0xFFFFFFFF).withOpacity(.12),
                                  dashPattern: [4, 4],
                                  strokeWidth: 1.0,
                                  strokeCap: StrokeCap.round,
                                ),
                                child: Container(
                                  width: double.infinity,
                                  height: 150.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFFFFFF).withOpacity(.04),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: _image != null
                                      ? Stack(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(6.0),
                                              child: Image.file(
                                                _image!,
                                                fit: BoxFit.cover,
                                                width: double.infinity,
                                                height: double.infinity,
                                              ),
                                            ),
                                            Positioned(
                                              top: 8.0,
                                              right: 8.0,
                                              child: InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    _image = null;
                                                    attachmentURL = null;
                                                  });
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.all(4.0),
                                                  decoration: BoxDecoration(
                                                    color: Colors.black
                                                        .withOpacity(0.5),
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Icon(
                                                    Icons.close,
                                                    color: Colors.white,
                                                    size: 16.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      : Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                                'assets/images/upload_icon.png',
                                                width: 44.0,
                                                height: 44.0),
                                            SizedBox(height: 12.0),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 16.0,
                                                vertical: 0.0,
                                              ),
                                              child: Text(
                                                'Upload Image',
                                                style: FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.figtree(
                                                        fontWeight: FontWeight.w400,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color: Color(0xFF667085),
                                                      fontSize: 16.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight: FontWeight.w400,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                          child: Text(
                            'Message',
                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  font: GoogleFonts.figtree(
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  fontSize: 14.0,
                                  letterSpacing: 0.6,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                        SizedBox(height: 8.0),
                        TextFormField(
                          controller: _model.contentTextController,
                          focusNode: _model.contentFocusNode,
                          autofocus: false,
                          obscureText: false,
                          maxLines: 10,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 10.0, 12.0, 10.0),
                            filled: true,
                            fillColor: Color(0xFFFFFFFF).withOpacity(0.04),
                            hintText: 'Enter Description',
                            hintStyle:
                                FlutterFlowTheme.of(context).labelMedium.override(
                                      font: GoogleFonts.figtree(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                      fontSize: 16.0,
                                      color: Color(0xFF667085),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00FFFFFF),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF348AF7),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                font: GoogleFonts.figtree(
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                          validator: _model.contentTextControllerValidator
                              .asValidator(context),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xFFFFFFFF).withOpacity(0.06),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 16.0, 16.0, 16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'ANALYSIS',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.figtree(
                                                fontWeight: FontWeight.w400,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color: Colors.white,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  thickness: 1.0,
                                  color: Color(0xFF383E49),
                                ),
                               Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                      child: Column(
                        children: [
                          Builder(
                            builder: (context) {
                              final analysis = FFAppState().analyses.toList();
                                
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: analysis.length,
                                itemBuilder: (context, analysisIndex) {
                                  final analysisItem = analysis[analysisIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 16.0),
                                            child: Text(
                                              getJsonField(
                                                analysisItem,
                                                r'''$.title''',
                                              ).toString(),
                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                    font: GoogleFonts.figtree(
                                                      fontWeight: FontWeight.w400,
                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                    ),
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                  ),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent('TIP_PAGE_Icon_netl5lvz_ON_TAP');
                                            logFirebaseEvent('Icon_update_app_state');
                                            FFAppState().removeFromAnalyses(analysisItem);
                                            safeSetState(() {});
                                          },
                                          child: Image.asset('assets/images/deleteIcon.png', width: 20, height: 20.0, fit: BoxFit.cover)
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                          SizedBox(height: 16.0),
                           FFButtonWidget(
                           onPressed: () async {
                             logFirebaseEvent('TIP_PAGE_ADD_AN_ANALYSIS_BTN_ON_TAP');
                             logFirebaseEvent('Button_navigate_to');
                               
                             context.pushNamed(
                               AnalysesWidget.routeName,
                               extra: <String, dynamic>{
                                 kTransitionInfoKey: TransitionInfo(
                                   hasTransition: true,
                                   transitionType: PageTransitionType.rightToLeft,
                                   duration: Duration(milliseconds: 300),
                                 ),
                               },
                             );
                           },
                           iconData: Icons.add,
                           text: 'Add an Analysis',
                           options: FFButtonOptions(
                             width: double.infinity,
                             height: 40.0,
                             padding: EdgeInsetsDirectional.fromSTEB(
                                 24.0, 0.0, 24.0, 0.0),
                             iconPadding: EdgeInsetsDirectional.fromSTEB(
                                 0.0, 0.0, 0.0, 0.0),
                             color:  Color(0xFFFFFFFF).withOpacity(0.10),
                             textStyle:
                                 FlutterFlowTheme.of(context).titleSmall.override(
                                       font: GoogleFonts.figtree(
                                           fontWeight: FontWeight.w500,
                                         fontStyle: FlutterFlowTheme.of(context)
                                             .titleSmall
                                             .fontStyle,
                                       ),
                                       color: Colors.white,
                                       letterSpacing: 0.6,
                                       fontSize: 14.0,
                                       fontWeight: FlutterFlowTheme.of(context)
                                           .titleSmall
                                           .fontWeight,
                                       fontStyle: FlutterFlowTheme.of(context)
                                           .titleSmall
                                           .fontStyle,
                                     ),
                             elevation: 3.0,
                             borderSide: BorderSide(
                               color: Color(0xFFFFFFFF).withOpacity(0.20),
                               width: 1.0,
                             ),
                             borderRadius: BorderRadius.circular(8.0),
                           ),
                         ),
                        ],
                      ),
                    ),
                               
                                
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        
                         SizedBox(height: 16.0),
                                FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent('MESSAGE_PAGE_SEND_BTN_ON_TAP');
                                  if (widget.tipData == null) {
                                    if (_model.group == 'Both') {
                                      logFirebaseEvent('Button_backend_call');
                                      
                                      await CommunicationRecord.collection.doc().set({
                                        ...createCommunicationRecordData(
                                          title: _model.titleTextController.text,
                                          message: _model.contentTextController.text,
                                          date: getCurrentTimestamp,
                                          imageUrl: _image != null ? attachmentURL : null,
                                          pdfUrl: _pdf != null ? attachmentURL : null,
                                          type: 'Message',
                                          group: 'Insights',
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'analyses': functions.convertJSONToStringList(FFAppState().analyses.toList()),
                                          },
                                        ),
                                      });
                                      logFirebaseEvent('Button_backend_call');
                                      
                                      await CommunicationRecord.collection.doc().set({
                                        ...createCommunicationRecordData(
                                          title: _model.titleTextController.text,
                                          message: _model.contentTextController.text,
                                          date: getCurrentTimestamp,
                                          imageUrl: _image != null ? attachmentURL : null,
                                          pdfUrl: _pdf != null ? attachmentURL : null,
                                          type: 'Message',
                                          group: 'Bets',
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'analyses': functions.convertJSONToStringList(FFAppState().analyses.toList()),
                                          },
                                        ),
                                      });
                                    } else {
                                      logFirebaseEvent('Button_backend_call');
                                      
                                      await CommunicationRecord.collection.doc().set({
                                        ...createCommunicationRecordData(
                                          title: _model.titleTextController.text,
                                          message: _model.contentTextController.text,
                                          date: getCurrentTimestamp,
                                          imageUrl: _image != null ? attachmentURL : null,
                                          pdfUrl: _pdf != null ? attachmentURL : null,
                                          type: 'Message',
                                          group: _model.group,
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'analyses': functions.convertJSONToStringList(FFAppState().analyses.toList()),
                                          },
                                        ),
                                      });
                                    }
                                      
                                    logFirebaseEvent('Button_firestore_query');
                                    _model.messages = await queryCommunicationRecordOnce(
                                      queryBuilder: (communicationRecord) => communicationRecord
                                          .where(
                                            'type',
                                            isEqualTo: 'Message',
                                          )
                                          .orderBy('date', descending: true),
                                    );
                                    if (_model.messages!.length > 15) {
                                      logFirebaseEvent('Button_backend_call');
                                      await _model.messages!.lastOrNull!.reference.delete();
                                    }
                                  } else {
                                    logFirebaseEvent('Button_backend_call');
                                      
                                    await widget.tipData!.update(createCommunicationRecordData(
                                      title: _model.titleTextController.text,
                                      message: _model.contentTextController.text,
                                      date: getCurrentTimestamp,
                                    ));
                                  }
                                      
                                  logFirebaseEvent('Button_navigate_back');
                                  context.safePop();
                                      
                                  safeSetState(() {});
                                  },
                                  text: widget.tipData != null ? 'Save' : 'Send',
                                  options: FFButtonOptions(
                                    width: double.infinity,
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: Color(0xFF348AF7).withOpacity(0.2),
                                    textStyle:
                                        FlutterFlowTheme.of(context).titleSmall.override(
                                              font: GoogleFonts.figtree(
                                                  fontWeight: FontWeight.w500,
                                                fontStyle: FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                              ),
                                              color: Colors.white,
                                              letterSpacing: 0.6,
                                              fontSize: 14.0,
                                              fontWeight: FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontWeight,
                                              fontStyle: FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontStyle,
                                            ),
                                    elevation: 3.0,
                                    borderSide: BorderSide(
                                      color: Color(0xFF348AF7),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              /*  Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                      child: Container(
                        width: double.infinity,
                        height: 72.0,
                        decoration: BoxDecoration(
                          color: Color(0xFF122849),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent('MESSAGE_PAGE_Icon_j7kum3u5_ON_TAP');
                                  logFirebaseEvent('Icon_navigate_back');
                                  context.safePop();
                                },
                                child: Icon(
                                  Icons.arrow_back_sharp,
                                  color: Colors.white,
                                  size: 24.0,
                                ),
                              ),
                            ),
                            Text(
                              widget.tipData != null ? 'Edit a message' : 'Add a message',
                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                    ),
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 12.0),
                      child: Container(
                        width: double.infinity,
                        height: 50.0,
                        decoration: BoxDecoration(),
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Title',
                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                    ),
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                child: TextFormField(
                                  controller: _model.titleTextController,
                                  focusNode: _model.titleFocusNode,
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                          font: GoogleFonts.inter(
                                            fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                            fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                          fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                        ),
                                    hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                          font: GoogleFonts.inter(
                                            fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                            fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                          fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                        ),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                  ),
                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                        ),
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                      ),
                                  textAlign: TextAlign.end,
                                  validator: _model.titleTextControllerValidator.asValidator(context),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (widget.tipData == null)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 24.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent('MESSAGE_PAGE_Container_bofb37vn_ON_TAP');
                            logFirebaseEvent('Container_bottom_sheet');
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return GestureDetector(
                                  onTap: () {
                                    FocusScope.of(context).unfocus();
                                    FocusManager.instance.primaryFocus?.unfocus();
                                  },
                                  child: Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: GroupSelectorWidget(
                                      currentGroup: _model.group,
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() => _model.selectedGroup = value));
                            
                            logFirebaseEvent('Container_update_page_state');
                            _model.group = _model.selectedGroup!;
                            safeSetState(() {});
                            
                            safeSetState(() {});
                          },
                          child: Container(
                            width: double.infinity,
                            height: 50.0,
                            decoration: BoxDecoration(),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Group',
                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                        ),
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                      ),
                                ),
                                Text(
                                  _model.group,
                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                        ),
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    if (widget.tipData == null)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 24.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return GestureDetector(
                                  onTap: () {
                                    FocusScope.of(context).unfocus();
                                    FocusManager.instance.primaryFocus?.unfocus();
                                  },
                                  child: Padding(padding: MediaQuery.viewInsetsOf(context), child: selectImagePdf(context)),
                                );
                              },
                            ).then((value) {
                              if (value is String && value == 'image') {
                                pickImageAndUpload();
                              } else if (value is String && value == 'pdf') {
                                pickPdfAndUpload();
                              }
                            });
                          },
                          child: Container(
                            width: double.infinity,
                            height: 50.0,
                            decoration: BoxDecoration(),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Image',
                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                        ),
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                      ),
                                ),
                                if (_pdf != null) Icon(Icons.picture_as_pdf, size: 32, color: Colors.white) else if (_image != null) Image.memory(_image!.readAsBytesSync(), height: 50)
                              ],
                            ),
                          ),
                        ),
                      ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                      child: Text(
                        'Message',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                              ),
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                            ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 24.0),
                      child: Container(
                        width: double.infinity,
                        height: 200.0,
                        decoration: BoxDecoration(
                          color: Color(0x14919EAB),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                child: TextFormField(
                                  controller: _model.contentTextController,
                                  focusNode: _model.contentFocusNode,
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                          font: GoogleFonts.inter(
                                            fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                            fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                          fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                        ),
                                    hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                          font: GoogleFonts.inter(
                                            fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                            fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                          fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                        ),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                  ),
                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                        font: GoogleFonts.inter(fontWeight: FontWeight.w500, fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle),
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                      ),
                                  maxLines: null,
                                  validator: _model.contentTextControllerValidator.asValidator(context),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                      child: Builder(
                        builder: (context) {
                          final analysis = FFAppState().analyses.toList();
                            
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: analysis.length,
                            itemBuilder: (context, analysisIndex) {
                              final analysisItem = analysis[analysisIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                        child: Text(
                                          getJsonField(
                                            analysisItem,
                                            r'''$.title''',
                                          ).toString(),
                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                ),
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                              ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent('TIP_PAGE_Icon_netl5lvz_ON_TAP');
                                        logFirebaseEvent('Icon_update_app_state');
                                        FFAppState().removeFromAnalyses(analysisItem);
                                        safeSetState(() {});
                                      },
                                      child: Icon(
                                        Icons.delete_outlined,
                                        color: FlutterFlowTheme.of(context).secondaryText,
                                        size: 24.0,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent('TIP_PAGE_ADD_AN_ANALYSIS_BTN_ON_TAP');
                          logFirebaseEvent('Button_navigate_to');
                            
                          context.pushNamed(
                            AnalysesWidget.routeName,
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.rightToLeft,
                                duration: Duration(milliseconds: 300),
                              ),
                            },
                          );
                        },
                        text: 'Add an analysis',
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                font: GoogleFonts.inter(
                                  fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                ),
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                              ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent('MESSAGE_PAGE_SEND_BTN_ON_TAP');
                        if (widget.tipData == null) {
                          if (_model.group == 'Both') {
                            logFirebaseEvent('Button_backend_call');
                            
                            await CommunicationRecord.collection.doc().set({
                              ...createCommunicationRecordData(
                                title: _model.titleTextController.text,
                                message: _model.contentTextController.text,
                                date: getCurrentTimestamp,
                                imageUrl: _image != null ? attachmentURL : null,
                                pdfUrl: _pdf != null ? attachmentURL : null,
                                type: 'Message',
                                group: 'Insights',
                              ),
                              ...mapToFirestore(
                                {
                                  'analyses': functions.convertJSONToStringList(FFAppState().analyses.toList()),
                                },
                              ),
                            });
                            logFirebaseEvent('Button_backend_call');
                            
                            await CommunicationRecord.collection.doc().set({
                              ...createCommunicationRecordData(
                                title: _model.titleTextController.text,
                                message: _model.contentTextController.text,
                                date: getCurrentTimestamp,
                                imageUrl: _image != null ? attachmentURL : null,
                                pdfUrl: _pdf != null ? attachmentURL : null,
                                type: 'Message',
                                group: 'Bets',
                              ),
                              ...mapToFirestore(
                                {
                                  'analyses': functions.convertJSONToStringList(FFAppState().analyses.toList()),
                                },
                              ),
                            });
                          } else {
                            logFirebaseEvent('Button_backend_call');
                            
                            await CommunicationRecord.collection.doc().set({
                              ...createCommunicationRecordData(
                                title: _model.titleTextController.text,
                                message: _model.contentTextController.text,
                                date: getCurrentTimestamp,
                                imageUrl: _image != null ? attachmentURL : null,
                                pdfUrl: _pdf != null ? attachmentURL : null,
                                type: 'Message',
                                group: _model.group,
                              ),
                              ...mapToFirestore(
                                {
                                  'analyses': functions.convertJSONToStringList(FFAppState().analyses.toList()),
                                },
                              ),
                            });
                          }
                            
                          logFirebaseEvent('Button_firestore_query');
                          _model.messages = await queryCommunicationRecordOnce(
                            queryBuilder: (communicationRecord) => communicationRecord
                                .where(
                                  'type',
                                  isEqualTo: 'Message',
                                )
                                .orderBy('date', descending: true),
                          );
                          if (_model.messages!.length > 15) {
                            logFirebaseEvent('Button_backend_call');
                            await _model.messages!.lastOrNull!.reference.delete();
                          }
                        } else {
                          logFirebaseEvent('Button_backend_call');
                            
                          await widget.tipData!.update(createCommunicationRecordData(
                            title: _model.titleTextController.text,
                            message: _model.contentTextController.text,
                            date: getCurrentTimestamp,
                          ));
                        }
                            
                        logFirebaseEvent('Button_navigate_back');
                        context.safePop();
                            
                        safeSetState(() {});
                      },
                      text: widget.tipData != null ? 'Save' : 'Send',
                      options: FFButtonOptions(
                        width: 100.0,
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                              font: GoogleFonts.inter(
                                fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                              ),
                              color: Colors.white,
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                              fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                            ),
                        elevation: 3.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                    ),
                  ],
                ), */
            ],
          ),
        ),
      ),
    );
  }
}

Widget selectImagePdf(BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 50),
    color: FlutterFlowTheme.of(context).secondaryBackground,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 50,
      children: [
        GestureDetector(
          onTap: () => context.pop('image'),
          child: Text(
            '+ Image',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 16.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w500,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
          ),
        ),
        GestureDetector(
          onTap: () => context.pop('pdf'),
          child: Text(
            '+ PDF',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 16.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w500,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
          ),
        ),
      ],
    ),
  );
}
