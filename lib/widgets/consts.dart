import 'package:b_s_p_consult/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../flutter_flow/flutter_flow_theme.dart';

class Setting{
  static Color get panelColor => Color.fromRGBO(255, 255, 255, 0.06);

  static String get silver_priceId  => 'price_1OgVTPCf4YXq1rsyGHWrpUI3';
  static String get Advanced_priceId  => 'price_1SgyrmCf4YXq1rsyFk0I3ljo';
  static String get Gold_priceId  => 'price_1NqWtkCf4YXq1rsyDvmsIWtF';

  static String get silver_Advance_priceId  => 'price_1Sh1flCf4YXq1rsy94ex1p16';
  static String get silver_Gold_priceId  => 'price_1OgVtOCf4YXq1rsy99bw9IHr';
  static String get Advanced_gold_priceId  => 'price_1Sh1gECf4YXq1rsycqlOtspg';
}


extension BuildContextExtension on BuildContext{
  
  FFButtonOptions get buttonOptions => FFButtonOptions(
    height: 40.0,
    padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
    color: Color(0x33348AF7),//FlutterFlowTheme.of(context).primary,
    textStyle: FlutterFlowTheme.of(this).titleSmall.override(
      font: GoogleFonts.inter(
        fontWeight: FlutterFlowTheme.of(this).titleSmall.fontWeight,
        fontStyle: FlutterFlowTheme.of(this).titleSmall.fontStyle,
      ),
      color: Colors.white,
      letterSpacing: 0.0,
      fontWeight: FlutterFlowTheme.of(this).titleSmall.fontWeight,
      fontStyle: FlutterFlowTheme.of(this).titleSmall.fontStyle,
    ),
    elevation: 3.0,
    borderSide: BorderSide(
      color: Color(0xFF348AF7),
      width: 1.0,
    ),
    borderRadius: BorderRadius.circular(8.0),
  );
  
  FFButtonOptions cusbuttonOptions({Color? background, Color? fontColor, double? fontSize, FontWeight? fontWeight}) => FFButtonOptions(
    height: 40.0,
    padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
    color: background ?? Color(0x33348AF7),//FlutterFlowTheme.of(context).primary,
    textStyle: FlutterFlowTheme.of(this).titleSmall.override(
      font: GoogleFonts.inter(
        fontWeight: fontWeight ?? FlutterFlowTheme.of(this).titleSmall.fontWeight,
        fontStyle: FlutterFlowTheme.of(this).titleSmall.fontStyle,
      ),
      color: fontColor ?? Colors.white,
      letterSpacing: 0.0,
      fontWeight: FlutterFlowTheme.of(this).titleSmall.fontWeight,
      fontStyle: FlutterFlowTheme.of(this).titleSmall.fontStyle,
      fontSize: fontSize
    ),
    elevation: 3.0,
    borderSide: BorderSide(
      color: Color(0xFF348AF7),
      width: 1.0,
    ),
    borderRadius: BorderRadius.circular(8.0),
  );

  FFButtonOptions greybuttonOptions({Color? background, Color? fontColor, double? fontSize, FontWeight? fontWeight}) => FFButtonOptions(
    height: 40.0,
    padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
    color: background ?? Color.fromRGBO(255, 255, 255, 0.1),//FlutterFlowTheme.of(context).primary,
    textStyle: FlutterFlowTheme.of(this).titleSmall.override(
      font: GoogleFonts.inter(
        fontWeight: fontWeight ?? FlutterFlowTheme.of(this).titleSmall.fontWeight,
        fontStyle: FlutterFlowTheme.of(this).titleSmall.fontStyle,
      ),
      color: fontColor ?? Colors.white,
      letterSpacing: 0.0,
      fontWeight: FlutterFlowTheme.of(this).titleSmall.fontWeight,
      fontStyle: FlutterFlowTheme.of(this).titleSmall.fontStyle,
      fontSize: fontSize
    ),
    elevation: 3.0,
    borderSide: BorderSide(
      color: Color.fromRGBO(255, 255, 255, 0.2),
      width: 1.0,
    ),
    borderRadius: BorderRadius.circular(8.0),
  );

  FFButtonOptions get redbuttonOptions => FFButtonOptions(
    height: 40.0,
    padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
    color: Color.fromRGBO(251, 55, 72, 0.12),//FlutterFlowTheme.of(context).primary,
    textStyle: FlutterFlowTheme.of(this).titleSmall.override(
      font: GoogleFonts.inter(
        fontWeight: FlutterFlowTheme.of(this).titleSmall.fontWeight,
        fontStyle: FlutterFlowTheme.of(this).titleSmall.fontStyle,
      ),
      color: Color.fromRGBO(251, 55, 72, 1),
      letterSpacing: 0.0,
      fontWeight: FlutterFlowTheme.of(this).titleSmall.fontWeight,
      fontStyle: FlutterFlowTheme.of(this).titleSmall.fontStyle,
    ),
    elevation: 3.0,
    borderSide: BorderSide(
      color: Color.fromRGBO(251, 55, 72, 1),
      width: 1.0,
    ),
    borderRadius: BorderRadius.circular(8.0),
  );

  FFButtonOptions get redbuttonOptionsWhiteText => FFButtonOptions(
    height: 40.0,
    padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
    color: Color.fromRGBO(251, 55, 72, 0.12),//FlutterFlowTheme.of(context).primary,
    textStyle: FlutterFlowTheme.of(this).titleSmall.override(
      font: GoogleFonts.inter(
        fontWeight: FlutterFlowTheme.of(this).titleSmall.fontWeight,
        fontStyle: FlutterFlowTheme.of(this).titleSmall.fontStyle,
      ),
      color: Colors.white,
      letterSpacing: 0.0,
      fontWeight: FlutterFlowTheme.of(this).titleSmall.fontWeight,
      fontStyle: FlutterFlowTheme.of(this).titleSmall.fontStyle,
    ),
    elevation: 3.0,
    borderSide: BorderSide(
      color: Color.fromRGBO(251, 55, 72, 1),
      width: 1.0,
    ),
    borderRadius: BorderRadius.circular(8.0),
  );

  FFButtonOptions get goldbuttonOptions => FFButtonOptions(
    height: 40.0,
    padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
    color: Color.fromRGBO(255, 203, 43, 0.2),
    textStyle: FlutterFlowTheme.of(this).titleSmall.override(
      font: GoogleFonts.inter(
        fontWeight: FlutterFlowTheme.of(this).titleSmall.fontWeight,
        fontStyle: FlutterFlowTheme.of(this).titleSmall.fontStyle,
      ),
      color: Colors.white,
      letterSpacing: 0.0,
      fontWeight: FlutterFlowTheme.of(this).titleSmall.fontWeight,
      fontStyle: FlutterFlowTheme.of(this).titleSmall.fontStyle,
    ),
    elevation: 3.0,
    borderSide: BorderSide(
      color: Color.fromRGBO(255, 203, 43, 1),
      width: 1.0,
    ),
    borderRadius: BorderRadius.circular(8.0),
  );
  
  Widget get divider => Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Divider(color: FlutterFlowTheme.of(this).primaryText.withValues(alpha: 0.25)),
      ),
      SizedBox(height: 9),
    ],
  );

  InputDecoration textfieldDecoration(String hint)=>InputDecoration(
    labelStyle: FlutterFlowTheme.of(this).labelMedium.override(
      font: GoogleFonts.inter(
        fontWeight: FlutterFlowTheme.of(this).labelMedium.fontWeight,
        fontStyle: FlutterFlowTheme.of(this).labelMedium.fontStyle,
      ),
      letterSpacing: 0.0,
      fontWeight: FlutterFlowTheme.of(this).labelMedium.fontWeight,
      fontStyle: FlutterFlowTheme.of(this).labelMedium.fontStyle,
    ),
    hintStyle: FlutterFlowTheme.of(this).labelMedium.override(
      font: GoogleFonts.inter(
        fontWeight: FlutterFlowTheme.of(this).labelMedium.fontWeight,
        fontStyle: FlutterFlowTheme.of(this).labelMedium.fontStyle,
      ),
      letterSpacing: 0.0,
      fontWeight: FlutterFlowTheme.of(this).labelMedium.fontWeight,
      fontStyle: FlutterFlowTheme.of(this).labelMedium.fontStyle,
    ),
    hint: Text(hint, style: TextStyle(color: FlutterFlowTheme.of(this).accent4)),
    contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
    errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
    focusedErrorBorder: InputBorder.none,
    filled: true,
    fillColor: Color.fromRGBO(255, 255, 255, 0.04),
  );

  TextStyle get textFieldStyle => FlutterFlowTheme.of(this).bodyMedium.override(
    font: GoogleFonts.inter(
      fontWeight: FontWeight.w500,
      fontStyle: FlutterFlowTheme.of(this).bodyMedium.fontStyle,
    ),
    fontSize: 16.0,
    letterSpacing: 0.0,
    fontWeight: FontWeight.w500,
    fontStyle: FlutterFlowTheme.of(this).bodyMedium.fontStyle,
  );

  TextStyle get passtextFieldStyle => FlutterFlowTheme.of(this).bodyMedium.override(
    font: GoogleFonts.roboto(
      fontWeight: FontWeight.w500,
      fontStyle: FlutterFlowTheme.of(this).bodyMedium.fontStyle,
    ),
    fontSize: 16.0,
    letterSpacing: 0.0,
    fontWeight: FontWeight.w500,
    fontStyle: FlutterFlowTheme.of(this).bodyMedium.fontStyle,
  );

  Future<dynamic> showAsModal(Widget child, {bool dismissible = true})async{
    return await showDialog(
      context: this,
      barrierDismissible: dismissible,
      builder: (context) {
        return Dialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: Colors.transparent,
          child: child
        );
      }
    );
  }
}