import 'dart:convert';

import 'package:b_s_p_consult/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:http/http.dart' as http;

import '../../flutter_flow/flutter_flow_theme.dart';

class EmailVerification {
  static Future<bool> verifyCode(String email, String code) async {
    try {
      final sendEmail = await http.post(
          Uri.parse(
              'https://us-central1-bspconsult-bcd6e.cloudfunctions.net/verifyCode'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({"email": email, "code": code}));
      if (sendEmail.statusCode == 200) {
        debugPrint('send email success ${sendEmail.body}');
        return true;
      } else {
        debugPrint(
            'send email failed ${sendEmail.statusCode} - ${sendEmail.body}');
      }
    } catch (e) {
      debugPrint('error verify $e');
    }
    return false;
  }

  static Future<bool> verifyEmail(BuildContext context, String email) async {
    try {
      final sendEmail = await http.post(
          Uri.parse(
              'https://us-central1-bspconsult-bcd6e.cloudfunctions.net/sendVerificationCode'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({"email": email}));
      if (sendEmail.statusCode == 200) {
        debugPrint('send email success ${sendEmail.body}');
      } else {
        debugPrint(
            'send email failed ${sendEmail.statusCode} - ${sendEmail.body}');
      }
    } catch (e) {
      debugPrint("error sending email $e");
    }

    final res = await showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            insetPadding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(19),
            ),
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 35),
              margin: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(19),
                  border: Border.all(color: Colors.white),
                  color: FlutterFlowTheme.of(context).secondaryBackground),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 12,
                  children: [
                    Text(
                      'Verify your email',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.inter(
                              fontWeight: FontWeight.bold,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            fontSize: 24.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                    SizedBox(height: 9),
                    Text(
                      'We have sent an email with a six-digit verification code to confirm your email address. Please check your email, read the code, and enter it here.',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.inter(
                              fontWeight: FontWeight.bold,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                            color: FlutterFlowTheme.of(context)
                                .titleLarge
                                .color!
                                .withValues(alpha: .5),
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: PinCodeTextField(
                        appContext: context,
                        length: 6,
                        textStyle: TextStyle(color: Colors.white),
                        // onChanged: (value) {},
                        onCompleted: (value) async {
                          if (await verifyCode(email, value)) {
                            Navigator.of(context).pop(true);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Wrong code',
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                    SizedBox(height: 35),
                    Center(
                      child: FFButtonWidget(
                          text: 'Confirm',
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                            elevation: 3.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(100.0),
                          )),
                    )
                  ]),
            ),
          );
        });
    if (res is bool) return res;
    return false;
  }
}
