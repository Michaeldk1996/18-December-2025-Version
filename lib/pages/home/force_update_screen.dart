import 'package:b_s_p_consult/auth/firebase_auth/app_version_service.dart';
import 'package:b_s_p_consult/widgets/consts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_widgets.dart';

class ForceUpdateScreen extends StatefulWidget {
  final ForceUpdateResult upd;
  const ForceUpdateScreen(this.upd, {super.key});

  @override
  State<ForceUpdateScreen> createState() => _ForceUpdateScreenState();
}

class _ForceUpdateScreenState extends State<ForceUpdateScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 29),
      margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * .05),
      constraints: BoxConstraints(
        maxWidth: 550
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Color.fromRGBO(18, 20, 30, 1),
        border: Border.all(color: Colors.white10)
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 19,
        children: [
          Image.asset('assets/images/check.png'),
          Text('Action Needed',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
              font: GoogleFonts.figtree(
                fontWeight: FontWeight.w500,
                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
              ),
              color: Colors.white,
              fontSize: 22.0,
              letterSpacing: 0.0,
              fontWeight: FontWeight.w700,
              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
            ),
          ),
          Text('Your current version is no longer supported.',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
              font: GoogleFonts.figtree(
                fontWeight: FontWeight.w500,
                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
              ),
              color: Colors.white,
              fontSize: 16.0,
              letterSpacing: 0.0,
              fontWeight: FontWeight.w700,
              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 19),
            child: Text('To avoid interruptions and access all features, please update the app now.',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                font: GoogleFonts.figtree(
                  fontWeight: FontWeight.w500,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
                color: Colors.white,
                fontSize: 16.0,
                letterSpacing: 0.0,
                fontWeight: FontWeight.w700,
                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
              ),
            ),
          ),
          Container(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            width: double.infinity,
            child: FFButtonWidget(
              text: 'Update Now',
              options: context.buttonOptions,
              onPressed: (){
                launchUrl(Uri.parse(widget.upd.storeUrl ?? ''));
              },
            ),
          )
        ],
      ),
    );
  }
}