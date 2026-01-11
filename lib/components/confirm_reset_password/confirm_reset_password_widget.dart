import 'package:b_s_p_consult/widgets/consts.dart';

import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'confirm_reset_password_model.dart';
export 'confirm_reset_password_model.dart';

class ConfirmResetPasswordWidget extends StatefulWidget {
  const ConfirmResetPasswordWidget({super.key});

  @override
  State<ConfirmResetPasswordWidget> createState() =>
      _ConfirmResetPasswordWidgetState();
}

class _ConfirmResetPasswordWidgetState
    extends State<ConfirmResetPasswordWidget> {
  late ConfirmResetPasswordModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConfirmResetPasswordModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: 600
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                spacing: 12,
                children: [
                  SizedBox(height: 22),
                  Image.asset('assets/images/reset.png'),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 9.0),
                    child: Text(
                      'Reset Password',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.inter(
                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        fontSize: 20.0,
                        letterSpacing: 0.0,
                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 12),
                    padding: EdgeInsets.symmetric(horizontal: 35),
                    child: Text('Are you sure you would like to get an email at ${currentUserEmail} to reset your password?',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.inter(
                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        fontSize: 14.0,
                        lineHeight: 1.5,
                        letterSpacing: 0.0,
                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 0.02),
                      border: Border(top: BorderSide(color: Colors.white24))
                    ),
                    child: Row(
                      spacing: 12,
                      children: [
                        Expanded(
                          child: FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent('RESET_PASSWORD_COMP_CANCEL_BTN_ON_TAP');
                              logFirebaseEvent('Button_dismiss_dialog');
                              Navigator.pop(context);
                            },
                            text: 'Cancel',
                            options: context.greybuttonOptions(),
                          ),
                        ),
                        Expanded(
                          child: FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent('RESET_PASSWORD_COMP_CONFIRM_BTN_ON_TAP');
                              logFirebaseEvent('Button_auth');
                              await authManager.resetPassword(
                                email: currentUserEmail,
                                context: context,
                              );
                              context.pop();
                            },
                            text: 'Confirm',
                            options: context.buttonOptions,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Padding(
                  //   padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                  //   child: Row(
                  //     mainAxisSize: MainAxisSize.max,
                  //     mainAxisAlignment: MainAxisAlignment.end,
                  //     children: [
                  //       FFButtonWidget(
                  //         onPressed: () async {
                  //           logFirebaseEvent(
                  //               'CONFIRM_RESET_PASSWORD_CANCEL_BTN_ON_TAP');
                  //           logFirebaseEvent('Button_dismiss_dialog');
                  //           Navigator.pop(context);
                  //         },
                  //         text: 'Cancel',
                  //         options: FFButtonOptions(
                  //           height: 40.0,
                  //           padding: EdgeInsetsDirectional.fromSTEB(
                  //               24.0, 0.0, 24.0, 0.0),
                  //           iconPadding: EdgeInsetsDirectional.fromSTEB(
                  //               0.0, 0.0, 0.0, 0.0),
                  //           color:
                  //               FlutterFlowTheme.of(context).secondaryBackground,
                  //           textStyle:
                  //               FlutterFlowTheme.of(context).titleSmall.override(
                  //                     font: GoogleFonts.inter(
                  //                       fontWeight: FlutterFlowTheme.of(context)
                  //                           .titleSmall
                  //                           .fontWeight,
                  //                       fontStyle: FlutterFlowTheme.of(context)
                  //                           .titleSmall
                  //                           .fontStyle,
                  //                     ),
                  //                     color: FlutterFlowTheme.of(context).primary,
                  //                     letterSpacing: 0.0,
                  //                     fontWeight: FlutterFlowTheme.of(context)
                  //                         .titleSmall
                  //                         .fontWeight,
                  //                     fontStyle: FlutterFlowTheme.of(context)
                  //                         .titleSmall
                  //                         .fontStyle,
                  //                   ),
                  //           elevation: 0.0,
                  //           borderSide: BorderSide(
                  //             color: FlutterFlowTheme.of(context)
                  //                 .secondaryBackground,
                  //             width: 0.0,
                  //           ),
                  //           borderRadius: BorderRadius.circular(8.0),
                  //         ),
                  //       ),
                  //       FFButtonWidget(
                  //         onPressed: () async {
                  //           logFirebaseEvent(
                  //               'CONFIRM_RESET_PASSWORD_CONFIRM_BTN_ON_TA');
                  //           logFirebaseEvent('Button_auth');
                  //           if (currentUserEmail.isEmpty) {
                  //             ScaffoldMessenger.of(context).showSnackBar(
                  //               SnackBar(
                  //                 content: Text(
                  //                   'Email required!',
                  //                 ),
                  //               ),
                  //             );
                  //             return;
                  //           }
                  //           await authManager.resetPassword(
                  //             email: currentUserEmail,
                  //             context: context,
                  //           );
                  //         },
                  //         text: 'Confirm',
                  //         options: FFButtonOptions(
                  //           height: 40.0,
                  //           padding: EdgeInsetsDirectional.fromSTEB(
                  //               24.0, 0.0, 24.0, 0.0),
                  //           iconPadding: EdgeInsetsDirectional.fromSTEB(
                  //               0.0, 0.0, 0.0, 0.0),
                  //           color:
                  //               FlutterFlowTheme.of(context).secondaryBackground,
                  //           textStyle:
                  //               FlutterFlowTheme.of(context).titleSmall.override(
                  //                     font: GoogleFonts.inter(
                  //                       fontWeight: FlutterFlowTheme.of(context)
                  //                           .titleSmall
                  //                           .fontWeight,
                  //                       fontStyle: FlutterFlowTheme.of(context)
                  //                           .titleSmall
                  //                           .fontStyle,
                  //                     ),
                  //                     color: FlutterFlowTheme.of(context).primary,
                  //                     letterSpacing: 0.0,
                  //                     fontWeight: FlutterFlowTheme.of(context)
                  //                         .titleSmall
                  //                         .fontWeight,
                  //                     fontStyle: FlutterFlowTheme.of(context)
                  //                         .titleSmall
                  //                         .fontStyle,
                  //                   ),
                  //           elevation: 0.0,
                  //           borderSide: BorderSide(
                  //             color: FlutterFlowTheme.of(context)
                  //                 .secondaryBackground,
                  //             width: 0.0,
                  //           ),
                  //           borderRadius: BorderRadius.circular(8.0),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
