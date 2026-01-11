import 'package:b_s_p_consult/widgets/consts.dart';

import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'notification_model.dart';
export 'notification_model.dart';

class NotificationWidget extends StatefulWidget {
  const NotificationWidget({super.key});

  static String routeName = 'Notification';
  static String routePath = '/notification';

  @override
  State<NotificationWidget> createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  late NotificationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'Notification'});
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
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primary,
        body: Container(
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
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'NOTIFICATION_PAGE_Icon_1zbqapch_ON_TAP');
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
                                'Send a notification',
                                style:
                                  FlutterFlowTheme.of(context).bodyMedium.override(
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
                          style:FlutterFlowTheme.of(context).bodyMedium.override(
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
                          validator: _model.titleTextControllerValidator.asValidator(context),
                        ),
                      ),
                      Container(
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
                        width: double.infinity,
                        height: 300.0,
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
                      Spacer(),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal: 19),
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent('NOTIFICATION_PAGE_SEND_BTN_ON_TAP');
                            logFirebaseEvent('Button_trigger_push_notification');
                            triggerPushNotification(
                              notificationTitle: _model.titleTextController.text,
                              notificationText: _model.contentTextController.text,
                              notificationSound: 'default',
                              userRefs: FFAppState().allUsers.toList(),
                              initialPageName: 'Home',
                              parameterData: {},
                            );
                            logFirebaseEvent('Button_navigate_back');
                            context.safePop();
                          },
                          text: 'Send',
                          options: context.buttonOptions,
                        ),
                      ),
                      SizedBox(height: 22)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
