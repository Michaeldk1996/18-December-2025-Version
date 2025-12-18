import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../flutter_flow/flutter_flow_theme.dart';

class CsTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool numberOnly;
  final bool obscureText;
  final bool autofocus;
  const CsTextFormField({this.controller, this.focusNode, this.numberOnly = false, this.obscureText = false, this.autofocus= false, super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      autofocus: autofocus,
      obscureText: obscureText,
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
      keyboardType: numberOnly ? const TextInputType.numberWithOptions(decimal: true) : null,
      inputFormatters: numberOnly
        ? [
            FilteringTextInputFormatter.allow(RegExp(r'[0-9,.]')),
            TextInputFormatter.withFunction((oldValue, newValue) {
              String text = newValue.text.replaceAll(',', '.');
              return newValue.copyWith(text: text, selection: newValue.selection);
            }),
          ]
        : null,
    );
  }
}