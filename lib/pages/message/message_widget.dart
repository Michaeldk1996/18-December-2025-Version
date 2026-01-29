import 'dart:io';

import 'package:b_s_p_consult/widgets/consts.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import '../analyses/analyses_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;

import '/backend/backend.dart';
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

  void chooseImage()async{
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
  }

  void pickImageAndUpload() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _pdf = null;
      _image = File(pickedFile.path);
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference storageRef = FirebaseStorage.instance.ref().child('images/$fileName');
      try {
        await storageRef.putFile(_image!);
        attachmentURL = await storageRef.getDownloadURL();
        if (mounted) {
          setState(() {});
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Upload failed!'), backgroundColor: Colors.red));
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
      Reference storageRef = FirebaseStorage.instance.ref().child('pdfs/$fileName');
      try {
        await storageRef.putFile(_pdf!);
        attachmentURL = await storageRef.getDownloadURL();
        if (mounted) {
          setState(() {});
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Upload failed!'), backgroundColor: Colors.red));
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
        _model.selectedTip = await CommunicationRecord.getDocumentOnce(widget.tipData!);
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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: Center(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  child: Image.asset('assets/images/bluecircle.png')
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Image.asset('assets/images/bluecircle2.png')
                ),
                Center(
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: 600
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 12,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                            child: Container(
                              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                              width: double.infinity,
                              height: 72.0 + MediaQuery.of(context).padding.top,
                              decoration: BoxDecoration(
                                // color: FlutterFlowTheme.of(context).primary,
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
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
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
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: TextFormField(
                              controller: _model.titleTextController,
                              focusNode: _model.titleFocusNode,
                              autofocus: true,
                              obscureText: false,
                              decoration: context.textfieldDecoration('Enter Title'),
                              style: context.textFieldStyle,
                              textAlign: TextAlign.start,
                              validator: _model.titleTextControllerValidator.asValidator(context),
                            ),
                          ),
                          if (widget.tipData == null)
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                // logFirebaseEvent('MESSAGE_PAGE_Container_bofb37vn_ON_TAP');
                                // logFirebaseEvent('Container_bottom_sheet');
                                // await showModalBottomSheet(
                                //   isScrollControlled: true,
                                //   backgroundColor: Colors.transparent,
                                //   enableDrag: false,
                                //   context: context,
                                //   builder: (context) {
                                //     return GestureDetector(
                                //       onTap: () {
                                //         FocusScope.of(context).unfocus();
                                //         FocusManager.instance.primaryFocus?.unfocus();
                                //       },
                                //       child: Padding(
                                //         padding: MediaQuery.viewInsetsOf(context),
                                //         child: GroupSelectorWidget(
                                //           currentGroup: _model.group,
                                //         ),
                                //       ),
                                //     );
                                //   },
                                // ).then((value){
                                //   safeSetState(() => _model.selectedGroup = value);
                                // });
                            
                                // logFirebaseEvent('Container_update_page_state');
                                // _model.group = _model.selectedGroup!;
                                // safeSetState(() {});
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 12),
                                width: double.infinity,
                                height: 20.0,
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
                                    // Text(
                                    //   _model.group,
                                    //   style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    //     font: GoogleFonts.inter(
                                    //       fontWeight: FontWeight.w500,
                                    //       fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                    //     ),
                                    //     fontSize: 16.0,
                                    //     letterSpacing: 0.0,
                                    //     fontWeight: FontWeight.w500,
                                    //     fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          RadioGroup<String>(
                            groupValue: _model.group,
                            onChanged: (value) {
                              setState(() {
                                _model.group = value!;
                              });
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  children: [
                                    Radio(value: 'Insights', backgroundColor: WidgetStatePropertyAll(Color.fromRGBO(43, 47, 56, 1))),
                                    Text('Insights', style: TextStyle(color: Colors.white)),
                                  ],
                                ),
                                Row(
                                  children: const [
                                    Radio(value: 'Bets', backgroundColor: WidgetStatePropertyAll(Color.fromRGBO(43, 47, 56, 1))),
                                    Text('Bets', style: TextStyle(color: Colors.white)),
                                  ],
                                ),
                                if (widget.tipData == null)
                                  Row(
                                    children: const [
                                      Radio(value: 'Both', backgroundColor: WidgetStatePropertyAll(Color.fromRGBO(43, 47, 56, 1))),
                                      Text('Both', style: TextStyle(color: Colors.white)),
                                    ],
                                  ),
                                Row(
                                  children: const [
                                    Radio(value: 'Exp_Insights', backgroundColor: WidgetStatePropertyAll(Color.fromRGBO(43, 47, 56, 1))),
                                    Text('Exp_Insights', style: TextStyle(color: Colors.white)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          if (widget.tipData == null)
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: chooseImage,
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 12),
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
                                  ],
                                ),
                              ),
                            ),
                          GestureDetector(
                            onTap: chooseImage,
                            child: Container(
                              width: double.infinity,
                              margin: EdgeInsets.symmetric(horizontal: 12),
                              height: MediaQuery.of(context).size.height *.20,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(255, 255, 255, 0.04),
                                borderRadius: BorderRadius.circular(12)
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  spacing: 12,
                                  children: [
                                    if (_pdf != null) 
                                      Icon(Icons.picture_as_pdf, size: 32, color: Colors.white) 
                                    else if (_image != null) 
                                      Image.memory(_image!.readAsBytesSync(), fit: BoxFit.cover, width: double.infinity, height: MediaQuery.of(context).size.height *.20)
                                    else
                                      ...[
                                        Image.asset('assets/images/upload.png'),
                                        Text('Upload Image', style: FlutterFlowTheme.of(context).titleSmall.override(color: Colors.white38))
                                      ]
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 9),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
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
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: TextFormField(
                              controller: _model.contentTextController,
                              focusNode: _model.contentFocusNode,
                              autofocus: false,
                              obscureText: false,
                              decoration: context.textfieldDecoration('Enter Description'),
                              style: context.textFieldStyle,
                              maxLines: 15,
                              validator: _model.contentTextControllerValidator.asValidator(context),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(12),
                            margin: EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              color: Setting.panelColor,
                              borderRadius: BorderRadius.circular(12)
                            ),
                            child: Builder(
                              builder: (context) {
                                final analysis = FFAppState().analyses.toList();
                            
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  spacing: 12,
                                  children: [
                                    Center(
                                      child: Text('ANALYSIS',
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
                                    context.divider,
                                    ListView.builder(
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
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 35),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(horizontal: 12),
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
                              text: '+ Add an analysis',
                              options: context.greybuttonOptions(),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: FFButtonWidget(
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
                            
                                  // logFirebaseEvent('Button_firestore_query');
                                  // _model.messages = await queryCommunicationRecordOnce(
                                  //   queryBuilder: (communicationRecord) => communicationRecord
                                  //       .where(
                                  //         'type',
                                  //         isEqualTo: 'Message',
                                  //       )
                                  //       .orderBy('date', descending: true),
                                  // );
                                  // if (_model.messages!.length > 15) {
                                  //   logFirebaseEvent('Button_backend_call');
                                  //   await _model.messages!.lastOrNull!.reference.delete();
                                  // }
                                } else {
                                  logFirebaseEvent('Button_backend_call');
                            
                                  await widget.tipData!.update(
                                    {
                                      ... createCommunicationRecordData(
                                        title: _model.titleTextController.text,
                                        message: _model.contentTextController.text,
                                        group: _model.group,
                                        date: getCurrentTimestamp,                                      
                                      ),
                                      'analyses': functions.convertJSONToStringList(FFAppState().analyses.toList()),
                                    }
                                  );
                                }
                            
                                logFirebaseEvent('Button_navigate_back');
                                context.safePop();
                            
                                safeSetState(() {});
                              },
                              text: widget.tipData != null ? 'Save' : 'Send',
                              options: context.buttonOptions
                            ),
                          ),
                          SizedBox(height: 50)
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
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
                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
