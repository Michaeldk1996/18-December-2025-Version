import 'package:package_info_plus/package_info_plus.dart';

import '../../components/change_stakingstrategy.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/action_selector/action_selector_widget.dart';
import '/components/change_bankroll/change_bankroll_widget.dart';
import '/components/confirm_delete_account_dialog/confirm_delete_account_dialog_widget.dart';
import '/components/confirm_reset_password/confirm_reset_password_widget.dart';
import '/components/tip_item/tip_item_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import '/index.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  static String routeName = 'Home';
  static String routePath = '/home';

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  // bool? _verify;
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  Widget subscriptionMenu(int value, String title) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        safeSetState(() {
          _model.subscriptionMode = value;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
            child: Text(
              title,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                    color: Colors.white,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
            ),
          ),
          if (_model.subscriptionMode == value)
            Divider(
              thickness: 2.0,
              color: Colors.white,
            ),
        ],
      ),
    );
  }

  Widget riskManagment({bool hint = false}) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(
          valueOrDefault<double>(
            MediaQuery.sizeOf(context).width < 500.0 ? 12.0 : 100.0,
            0.0,
          ),
          12.0,
          valueOrDefault<double>(
            MediaQuery.sizeOf(context).width < 500.0 ? 12.0 : 100.0,
            0.0,
          ),
          0.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
        ),
        child: Builder(
          builder: (context) => Container(
            padding: EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 2.0, 2.0),
            decoration: BoxDecoration(
              color: hint ? null : FlutterFlowTheme.of(context).primaryText,
              borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
              border: Border.all(
                color: Color(0x14EFF0F6),
                width: 1.0,
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: 12),
                Container(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 24.0),
                  width: double.infinity,
                  decoration: BoxDecoration(color: hint ? FlutterFlowTheme.of(context).primary : null, borderRadius: BorderRadius.vertical(top: Radius.circular(19))),
                  child: Center(
                    child: Text(
                      'Risk Management',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.inter(
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                            ),
                            color: hint ? FlutterFlowTheme.of(context).primaryText : FlutterFlowTheme.of(context).secondaryBackground,
                            fontSize: 20.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                          ),
                    ),
                  ),
                ),
                if (hint)
                  Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                    SizedBox(height: 25),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 14.0),
                      child: Text(
                        'Build your staking plan',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.inter(
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                              ),
                              color: hint ? FlutterFlowTheme.of(context).primaryText : FlutterFlowTheme.of(context).secondaryBackground,
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                            ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                      child: Text(
                        'Add your bankroll and select a staking system to continue.',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.inter(
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                              ),
                              color: hint ? FlutterFlowTheme.of(context).primaryText : FlutterFlowTheme.of(context).secondaryBackground,
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                            ),
                      ),
                    ),
                    SizedBox(height: 35),
                  ]),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent('HOME_PAGE_Container_f28twcc9_ON_TAP');
                    logFirebaseEvent('Container_alert_dialog');
                    await showAlignedDialog(
                      context: context,
                      isGlobal: false,
                      avoidOverflow: false,
                      targetAnchor: AlignmentDirectional(0.0, -1.0).resolve(Directionality.of(context)),
                      followerAnchor: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                      builder: (dialogContext) {
                        return Material(
                          color: Colors.transparent,
                          child: GestureDetector(
                            onTap: () {
                              FocusScope.of(dialogContext).unfocus();
                              FocusManager.instance.primaryFocus?.unfocus();
                            },
                            child: ChangeBankrollWidget(),
                          ),
                        );
                      },
                    ).then((value) {
                      if (value is String && value.isNotEmpty) {
                        safeSetState(() => _model.bankrollResult = value);
                      }
                    });

                    logFirebaseEvent('Container_backend_call');
                    await currentUserReference!.update(createUsersRecordData(
                      bankroll: _model.bankrollResult,
                    ));

                    safeSetState(() {});
                  },
                  child: Container(
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 10.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Bankroll',
                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                      ),
                                      color: hint ? FlutterFlowTheme.of(context).primaryText : FlutterFlowTheme.of(context).secondaryBackground,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                    ),
                              ),
                              AuthUserStreamWidget(
                                builder: (context) => Text(
                                  '${valueOrDefault(currentUserDocument?.bankroll, '')} €',
                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                        ),
                                        color: hint ? FlutterFlowTheme.of(context).primaryText : FlutterFlowTheme.of(context).secondaryBackground,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: changeStakingStrategy,
                  child: Container(
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12.0, 10.0, 12.0, 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 12,
                        children: [
                          Text(
                            'Staking Strategy',
                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  ),
                                  color: hint ? FlutterFlowTheme.of(context).primaryText : FlutterFlowTheme.of(context).secondaryBackground,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                ),
                          ),
                          AuthUserStreamWidget(
                            builder: (context) => Text(
                              ('${valueOrDefault(currentUserDocument?.stakingStrategy, '')}'),
                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                    ),
                                    color: hint ? FlutterFlowTheme.of(context).primaryText : FlutterFlowTheme.of(context).secondaryBackground,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                if (hint) ...[
                  Spacer(),
                  FFButtonWidget(
                    text: 'Done',
                    onPressed: () => Navigator.of(context).pop(),
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
                  SizedBox(height: 25)
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget subscriptionitemFeature(String title, bool valid) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Opacity(
            opacity: valid ? 1 : 0.5,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 12.0, 0.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: SvgPicture.asset(
                  'assets/images/checkbox.svg',
                  width: 22.0,
                  height: 22.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Text(
            title,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                font: GoogleFonts.inter(
                  fontWeight: FontWeight.bold,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
                color: Colors.white,
                letterSpacing: 0.0,
                fontWeight: FontWeight.bold,
                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                decoration: valid ? null : TextDecoration.lineThrough),
          ),
        ],
      ),
    );
  }

  Widget subscriptionDetails({required int price1, required int price2, required String img, required String title1, required String title2, required String note, String? title3, required List<String> validFeatures, required List<String> notvalidFeatuted, required VoidCallback onPresses}) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: 200.0,
            height: 90.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF0867EF), Color(0xFF0D1117)],
                stops: [0.0, 1.0],
                begin: AlignmentDirectional(0.0, -1.0),
                end: AlignmentDirectional(0, 1.0),
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(0.0),
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 2.0, 0.0),
              child: Container(
                width: 200.0,
                height: 90.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      '€$price1',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.inter(
                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                            ),
                            color: Color(0xFF627083),
                            fontSize: 28.0,
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                            decoration: TextDecoration.lineThrough,
                          ),
                    ),
                    Text(
                      '€$price2',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.inter(
                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                            ),
                            color: Color(0xFFF9FAFB),
                            fontSize: 50.0,
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                            lineHeight: 1.0,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(valueOrDefault<double>(MediaQuery.sizeOf(context).width < 500.0 ? 12.0 : 100.0, 0.0), 0.0, valueOrDefault<double>(MediaQuery.sizeOf(context).width < 500.0 ? 12.0 : 100.0, 0.0), 20.0),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 70.0,
                    color: Color(0x300986FB),
                    offset: Offset(0.0, 0.0),
                  )
                ],
                gradient: LinearGradient(
                  colors: [Color(0xFF076AF4), Color(0xFF0D1117), Color(0xFF086AF5)],
                  stops: [0.0, 0.5, 1.0],
                  begin: AlignmentDirectional(-0.93, -1.0),
                  end: AlignmentDirectional(0.93, 1.0),
                ),
                borderRadius: BorderRadius.circular(24.0),
              ),
              child: Padding(
                padding: EdgeInsets.all(2.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 7.0,
                        color: Color(0x0F14142B),
                        offset: Offset(
                          0.0,
                          2.0,
                        ),
                      )
                    ],
                    borderRadius: BorderRadius.circular(24.0),
                    border: Border.all(
                      color: Color(0x14EFF0F6),
                      width: 1.0,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 14.0, 14.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 0.0, 12.0),
                              child: Image.asset(
                                'assets/images/$img',
                                width: 100.0,
                                height: 100.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              width: 110.0,
                              height: 33.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                borderRadius: BorderRadius.circular(40.0),
                                border: Border.all(
                                  color: Color(0xFF0867EF),
                                  width: 2.0,
                                ),
                              ),
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Text(
                                '€33/month',
                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 0.0, 0.0),
                        child: Text(
                          '$title1 Program',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                font: GoogleFonts.inter(
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                ),
                                color: Colors.white,
                                fontSize: 34.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                              ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 0.0, 0.0),
                        child: Text(
                          title2,
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                font: GoogleFonts.inter(
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                ),
                                color: Colors.white,
                                fontSize: 22.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                              ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 30.0),
                        child: Text(
                          note,
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                font: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                ),
                                color: Color(0xFF9A9A9A),
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                              ),
                        ),
                      ),
                      for (var i in validFeatures) subscriptionitemFeature(i, true),
                      for (var i in notvalidFeatuted) subscriptionitemFeature(i, false),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 20.0),
                              child: FFButtonWidget(
                                onPressed: onPresses,
                                text: 'Get $title1',
                                options: FFButtonOptions(
                                  height: 50.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                        ),
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
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
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget accessDenied() {
    return AuthUserStreamWidget(
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              'assets/images/lock-svg-svg.png',
              width: 300.0,
              height: 300.0,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 24.0),
            child: Text('Unlock this content by upgrading your Membership',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                font: GoogleFonts.inter(fontWeight: FontWeight.w500, fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle),
                color: FlutterFlowTheme.of(context).primaryText,
                fontSize: 22.0,
                letterSpacing: 0.0,
                fontWeight: FontWeight.w500,
                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle
              )
            )
          ),
          FFButtonWidget(
            onPressed: () async {
              logFirebaseEvent('HOME_CHOOSE_YOUR_MEMBERSHIP_BTN_ON_TAP');
              logFirebaseEvent('Button_page_view');
              await _model.pageViewController?.animateToPage(
                2,
                duration: Duration(milliseconds: 500),
                curve: Curves.ease,
              );
              logFirebaseEvent('Button_update_page_state');
              _model.pageNumber = 2;
              safeSetState(() {});
            },
            text: (int.tryParse('${currentUserDocument?.membership ?? '0'}') ?? 0) < 8
              ? 'Choose your membership'
              : 'Upgrade Membership',
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
                  color: Colors.white,
                  letterSpacing: 0.0,
                  fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle),
              elevation: 3.0,
              borderSide: BorderSide(
                color: Colors.transparent,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(40.0),
            ),
          ),
        ],
      ),
    );
  }

  Widget communicationItems(String groupName) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(),
      child: StreamBuilder<List<CommunicationRecord>>(
        stream: queryCommunicationRecord(
          queryBuilder: (communicationRecord) => communicationRecord.where('group', isEqualTo: '$groupName').orderBy('date', descending: true),
        ),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            );
          }
          List<CommunicationRecord> listViewCommunicationRecordList = snapshot.data!;

          return ListView.separated(
            padding: EdgeInsets.fromLTRB(
              0,
              12.0,
              0,
              0,
            ),
            scrollDirection: Axis.vertical,
            itemCount: listViewCommunicationRecordList.length,
            separatorBuilder: (_, __) => SizedBox(height: 20.0),
            itemBuilder: (context, listViewIndex) {
              final listViewCommunicationRecord = listViewCommunicationRecordList[listViewIndex];
              return Column(
                mainAxisSize: MainAxisSize.min,
                spacing: 35,
                children: [
                  // if (listViewIndex == 0 && groupName.toLowerCase().contains('exp-'))
                  //   Transform.scale(
                  //     scale: .85,
                  //     child: accessDenied()
                  //   ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onLongPress: () async {
                      var _shouldSetState = false;
                      if (valueOrDefault(currentUserDocument?.role, '') != 'administrator') return;
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
                              child: ActionSelectorWidget(),
                            ),
                          );
                        },
                      ).then((value) => safeSetState(() => _model.selectedAction = value));
                      _shouldSetState = true;
                      if (_model.selectedAction == 'Delete') {
                        logFirebaseEvent('TipItem_backend_call');
                        await listViewCommunicationRecord.reference.delete();
                      } else if (_model.selectedAction == 'Modify') {
                        if (listViewCommunicationRecord.type == 'Tip') {
                          logFirebaseEvent('TipItem_navigate_to');
                  
                          context.pushNamed(
                            EditTipWidget.routeName,
                            queryParameters: {
                              'tripData': serializeParam(listViewCommunicationRecord.reference, ParamType.DocumentReference),
                            }.withoutNulls,
                          );
                        } else if (listViewCommunicationRecord.type == 'Message') {
                          logFirebaseEvent('TipItem_navigate_to');
                  
                          context.pushNamed(
                            MessageWidget.routeName,
                            queryParameters: {
                              'tipData': serializeParam(listViewCommunicationRecord.reference, ParamType.DocumentReference),
                            }.withoutNulls,
                          );
                        }
                      } else {
                        if (_shouldSetState) safeSetState(() {});
                        return;
                      }
                      if (_shouldSetState) safeSetState(() {});
                    },
                    child: wrapWithModel(
                      model: _model.tipItemModels1.getModel(
                        listViewIndex.toString(),
                        listViewIndex,
                      ),
                      updateCallback: () => safeSetState(() {}),
                      child: TipItemWidget(
                          key: Key(
                            'Keywjh_${listViewIndex.toString()}',
                          ),
                          title: listViewCommunicationRecord.title,
                          message: listViewCommunicationRecord.message,
                          group: listViewCommunicationRecord.group,
                          tipType: listViewCommunicationRecord.tipType,
                          type: listViewCommunicationRecord.type,
                          date: listViewCommunicationRecord.date,
                          analyses: listViewCommunicationRecord.analyses,
                          reliability: listViewCommunicationRecord.reliability,
                          minimumodd: listViewCommunicationRecord.minimumodd,
                          imageUrl: listViewCommunicationRecord.imageUrl,
                          pdfUrl: listViewCommunicationRecord.pdfUrl),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }

  void checkUser() async {
    // _verify = await FirebaseAuth.instance.currentUser?.emailVerified ?? false;
    // if (mounted) setState(() {});
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    debugPrint('inja ${packageInfo.version}');
  }

  void askStakingStrategy() {
    showModalBottomSheet(isScrollControlled: false, backgroundColor: FlutterFlowTheme.of(context).secondaryBackground, enableDrag: false, context: context, builder: (context) => Container(color: FlutterFlowTheme.of(context).secondaryBackground, child: riskManagment(hint: true)));
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Home'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('HOME_PAGE_Home_ON_INIT_STATE');

      if ((currentUserDocument?.stakingStrategy.isEmpty ?? true) || (valueOrDefault(currentUserDocument?.bankroll, '') == '')) {
        askStakingStrategy();
      }
      if (valueOrDefault(currentUserDocument?.bankroll, '') == '') {
        logFirebaseEvent('Home_backend_call');

        await currentUserReference!.update(createUsersRecordData(
          bankroll: '0',
        ));
      }
      logFirebaseEvent('Home_firestore_query');
      _model.userList = await queryUsersRecordOnce();
      logFirebaseEvent('Home_update_app_state');
      FFAppState().allUsers = _model.userList!.map((e) => e.reference).toList().toList().cast<DocumentReference>();
      checkUser();
      safeSetState(() {});
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  void changeStakingStrategy() async {
    logFirebaseEvent('HOME_PAGE_Container_f28twcc9_ON_TAP');
    logFirebaseEvent('Container_alert_dialog');
    await showAlignedDialog(
      context: context,
      isGlobal: false,
      avoidOverflow: false,
      builder: (dialogContext) {
        return Material(
          color: Colors.transparent,
          child: GestureDetector(
            onTap: () {
              FocusScope.of(dialogContext).unfocus();
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: ChangeStakingStrategylWidget(currentUserDocument?.stakingStrategy),
          ),
        );
      },
    ).then((value) => safeSetState(() {
          if (value is String && value.isNotEmpty) {
            _model.stakingStrategy = value;
          }
        }));

    logFirebaseEvent('Container_STakingStrategy_call');
    await currentUserReference!.update(createUsersRecordData(stakingStrategy: _model.stakingStrategy));
    safeSetState(() {});
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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
                      child: PageView(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: _model.pageViewController ??= PageController(initialPage: 1),
                        scrollDirection: Axis.horizontal,
                        children: [
                          Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration(),
                            child: Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).secondaryBackground,
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                                      child: Stack(
                                        alignment: AlignmentDirectional(0.0, 0.0),
                                        children: [
                                          Align(
                                            alignment: AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(0.0),
                                                child: Image.asset(
                                                  'assets/images/Logo.png',
                                                  width: 30.0,
                                                  height: 30.8,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              'Profile',
                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                    font: GoogleFonts.montserrat(
                                                      fontWeight: FontWeight.w500,
                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                    ),
                                                    color: Colors.white,
                                                    fontSize: 20.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                  ),
                                            ),
                                          ),
                                          Align(
                                            alignment: AlignmentDirectional(1.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 24.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor: Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent('HOME_PAGE_Icon_dwi1qizi_ON_TAP');
                                                  logFirebaseEvent('Icon_auth');
                                                  GoRouter.of(context).prepareAuthEvent();
                                                  await authManager.signOut();
                                                  GoRouter.of(context).clearRedirectLocation();

                                                  logFirebaseEvent('Icon_navigate_to');

                                                  context.goNamedAuth(LoginWidget.routeName, context.mounted);
                                                },
                                                child: Icon(
                                                  Icons.logout,
                                                  color: Colors.white,
                                                  size: 24.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).width < 500.0 ? 12.0 : 100.0,
                                            0.0,
                                          ),
                                          20.0,
                                          valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).width < 500.0 ? 12.0 : 100.0,
                                            0.0,
                                          ),
                                          0.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(10.0),
                                            bottomRight: Radius.circular(10.0),
                                            topLeft: Radius.circular(10.0),
                                            topRight: Radius.circular(10.0),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 2.0, 2.0),
                                          child: Material(
                                            color: Colors.transparent,
                                            elevation: 3.0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10.0),
                                            ),
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color: FlutterFlowTheme.of(context).primaryText,
                                                borderRadius: BorderRadius.circular(10.0),
                                                border: Border.all(
                                                  color: Color(0x14EFF0F6),
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(12.0, 16.0, 12.0, 16.0),
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                                                      child: Row(
                                                        mainAxisSize: MainAxisSize.max,
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Text(
                                                            'Information',
                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                  font: GoogleFonts.inter(
                                                                    fontWeight: FontWeight.w600,
                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                  fontSize: 20.0,
                                                                  letterSpacing: 0.0,
                                                                  fontWeight: FontWeight.w600,
                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                                                      child: Row(
                                                        mainAxisSize: MainAxisSize.max,
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Text(
                                                            'Username',
                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                  font: GoogleFonts.inter(
                                                                    fontWeight: FontWeight.w500,
                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                  fontSize: 16.0,
                                                                  letterSpacing: 0.0,
                                                                  fontWeight: FontWeight.w500,
                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                ),
                                                          ),
                                                          AuthUserStreamWidget(
                                                            builder: (context) => Text(
                                                              valueOrDefault(currentUserDocument?.username, ''),
                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                    font: GoogleFonts.inter(
                                                                      fontWeight: FontWeight.w500,
                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                    fontSize: 16.0,
                                                                    letterSpacing: 0.0,
                                                                    fontWeight: FontWeight.w500,
                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                                                      child: Row(
                                                        mainAxisSize: MainAxisSize.max,
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Text(
                                                            'E-mail',
                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                  font: GoogleFonts.inter(
                                                                    fontWeight: FontWeight.w500,
                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                  fontSize: 16.0,
                                                                  letterSpacing: 0.0,
                                                                  fontWeight: FontWeight.w500,
                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                ),
                                                          ),
                                                          Text(
                                                            currentUserEmail.maybeHandleOverflow(
                                                              maxChars: 25,
                                                              replacement: '…',
                                                            ),
                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                  font: GoogleFonts.inter(
                                                                    fontWeight: FontWeight.w500,
                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                  fontSize: 16.0,
                                                                  letterSpacing: 0.0,
                                                                  fontWeight: FontWeight.w500,
                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisSize: MainAxisSize.max,
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Password',
                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                font: GoogleFonts.inter(
                                                                  fontWeight: FontWeight.w500,
                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                fontSize: 16.0,
                                                                letterSpacing: 0.0,
                                                                fontWeight: FontWeight.w500,
                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                              ),
                                                        ),
                                                        Builder(
                                                          builder: (context) => InkWell(
                                                            splashColor: Colors.transparent,
                                                            focusColor: Colors.transparent,
                                                            hoverColor: Colors.transparent,
                                                            highlightColor: Colors.transparent,
                                                            onTap: () async {
                                                              logFirebaseEvent('HOME_PAGE_Text_i8nl9xie_ON_TAP');
                                                              logFirebaseEvent('Text_alert_dialog');
                                                              await showDialog(
                                                                context: context,
                                                                builder: (dialogContext) {
                                                                  return Dialog(
                                                                    elevation: 0,
                                                                    insetPadding: EdgeInsets.zero,
                                                                    backgroundColor: Colors.transparent,
                                                                    alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                    child: GestureDetector(
                                                                      onTap: () {
                                                                        FocusScope.of(dialogContext).unfocus();
                                                                        FocusManager.instance.primaryFocus?.unfocus();
                                                                      },
                                                                      child: ConfirmResetPasswordWidget(),
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            },
                                                            child: Text(
                                                              'Reset Password',
                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                    font: GoogleFonts.inter(
                                                                      fontWeight: FontWeight.w500,
                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                    fontSize: 16.0,
                                                                    letterSpacing: 0.0,
                                                                    fontWeight: FontWeight.w500,
                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).width < 500.0 ? 12.0 : 100.0,
                                            0.0,
                                          ),
                                          12.0,
                                          valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).width < 500.0 ? 12.0 : 100.0,
                                            0.0,
                                          ),
                                          0.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(10.0),
                                            bottomRight: Radius.circular(10.0),
                                            topLeft: Radius.circular(10.0),
                                            topRight: Radius.circular(10.0),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 2.0, 2.0),
                                          child: Material(
                                            color: Colors.transparent,
                                            elevation: 3.0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10.0),
                                            ),
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color: FlutterFlowTheme.of(context).primaryText,
                                                borderRadius: BorderRadius.circular(10.0),
                                                border: Border.all(
                                                  color: Color(0x14EFF0F6),
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(12.0, 16.0, 12.0, 16.0),
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                                                      child: Stack(
                                                        children: [
                                                          Align(
                                                            alignment: AlignmentDirectional(0.0, -1.0),
                                                            child: Text(
                                                              'Premium',
                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                    font: GoogleFonts.inter(
                                                                      fontWeight: FontWeight.w600,
                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                    fontSize: 20.0,
                                                                    letterSpacing: 0.0,
                                                                    fontWeight: FontWeight.w600,
                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    // if ((((currentUserDocument?.expireDate != null) && (currentUserDocument!.expireDate! >= getCurrentTimestamp)) && (valueOrDefault(currentUserDocument?.membership, '') == '10')) ||
                                                    //     ((valueOrDefault(currentUserDocument?.membership, '') == '8') && ((currentUserDocument?.expireDate != null) && (currentUserDocument!.expireDate! >= getCurrentTimestamp))))
                                                    if ((int.tryParse(currentUserDocument?.membership ?? '0') ?? 0) >= 8)
                                                      Padding(
                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                                                        child: AuthUserStreamWidget(
                                                          builder: (context) => Row(
                                                            mainAxisSize: MainAxisSize.max,
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [
                                                              Padding(
                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                child: Stack(
                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                  children: [
                                                                    Container(
                                                                      width: 30.0,
                                                                      height: 30.0,
                                                                      decoration: BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                        border: Border.all(
                                                                          color: Color(0x5B57636C),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    ClipRRect(
                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                      child: Image.asset(
                                                                        'assets/images/${valueOrDefault(currentUserDocument?.membership, '') == '8' ? 'silver_large' : valueOrDefault(currentUserDocument?.membership, '') == '9' ? 'email' : 'gold_large'}.png',
                                                                        width: 28.0,
                                                                        height: 28.0,
                                                                        fit: BoxFit.cover,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Text(
                                                                valueOrDefault(currentUserDocument?.membership, '') == '8'
                                                                    ? 'Silver'
                                                                    : valueOrDefault(currentUserDocument?.membership, '') == '9'
                                                                        ? 'Advanced'
                                                                        : valueOrDefault(currentUserDocument?.membership, '') == '10'
                                                                            ? 'Gold'
                                                                            : '',
                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                      font: GoogleFonts.inter(
                                                                        fontWeight: FontWeight.bold,
                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                      fontSize: 22.0,
                                                                      letterSpacing: 0.0,
                                                                      fontWeight: FontWeight.bold,
                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    if ((int.tryParse(currentUserDocument?.membership ?? '0') ?? 0) < 10)
                                                      AuthUserStreamWidget(
                                                        builder: (context) => FFButtonWidget(
                                                          onPressed: () async {
                                                            logFirebaseEvent('HOME_RENEW_MY_SUBSCRIPTION_BTN_ON_TAP');
                                                            var _shouldSetState = false;
                                                            if (valueOrDefault(currentUserDocument?.membership, '') == '8') {
                                                              if (currentUserDocument!.expireDate! < getCurrentTimestamp) {
                                                                logFirebaseEvent('Button_show_snack_bar');
                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                  SnackBar(
                                                                    content: Text(
                                                                      'Please use the same email address as your account for subscription payment',
                                                                      style: TextStyle(color: FlutterFlowTheme.of(context).primaryText),
                                                                    ),
                                                                    duration: Duration(milliseconds: 4000),
                                                                    backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                  ),
                                                                );
                                                                logFirebaseEvent('Button_backend_call');

                                                                await currentUserReference!.update(createUsersRecordData(
                                                                  membership: '1',
                                                                ));
                                                                logFirebaseEvent('Button_page_view');
                                                                await _model.pageViewController?.animateToPage(
                                                                  2,
                                                                  duration: Duration(milliseconds: 500),
                                                                  curve: Curves.ease,
                                                                );
                                                                // if (_shouldSetState) safeSetState(() {});
                                                                return;
                                                              }
                                                              logFirebaseEvent('Button_firestore_query');
                                                              _model.settingsResponse = await querySettingsRecordOnce(
                                                                singleRecord: true,
                                                              ).then((s) => s.firstOrNull);
                                                              _shouldSetState = true;
                                                              if (_model.settingsResponse!.approve) {
                                                                logFirebaseEvent('Button_backend_call');
                                                                _model.apiResultd8s = await CreateCheckoutSessionCall.call(
                                                                  priceId: 'price_1OgVtOCf4YXq1rsy99bw9IHr',
                                                                  customerEmail: currentUserEmail,
                                                                  platform: 'mobile',
                                                                );

                                                                _shouldSetState = true;
                                                                if ((_model.apiResultd8s?.succeeded ?? true)) {
                                                                  logFirebaseEvent('Button_launch_u_r_l');
                                                                  await launchURL(getJsonField(
                                                                    (_model.apiResultd8s?.jsonBody ?? ''),
                                                                    r'''$.redirectUrl''',
                                                                  ).toString());
                                                                }
                                                              } else {
                                                                logFirebaseEvent('Button_revenue_cat');
                                                                _model.didPurchaseUpgrade = await revenue_cat.purchasePackage(revenue_cat.offerings!.current!.getPackage('bspconsult_upgrade_gold_masterclass')!.identifier);
                                                                _shouldSetState = true;
                                                                if (_model.didPurchaseUpgrade!) {
                                                                  logFirebaseEvent('Button_backend_call');

                                                                  await currentUserReference!.update(createUsersRecordData(
                                                                    membership: '10',
                                                                    expireDate: functions.getNextYearDate(getCurrentTimestamp),
                                                                  ));
                                                                }
                                                              }
                                                            } else {
                                                              logFirebaseEvent('Button_page_view');
                                                              await _model.pageViewController?.animateToPage(
                                                                2,
                                                                duration: Duration(milliseconds: 500),
                                                                curve: Curves.ease,
                                                              );
                                                            }

                                                            if (_shouldSetState) safeSetState(() {});
                                                          },
                                                          text: (int.tryParse(currentUserDocument?.membership ?? '0') ?? 0) < 8
                                                            ? 'Choose Membership'
                                                            : (int.tryParse(currentUserDocument?.membership ?? '0') ?? 0) == 9
                                                              ? 'Upgrade to Gold'
                                                              : 'Upgrade to Gold Masterclass', //(valueOrDefault(currentUserDocument?.membership, '') == '8') && ((currentUserDocument?.expireDate != null) && (currentUserDocument!.expireDate! >= getCurrentTimestamp)) ? 'Upgrade to Gold Masterclass' : 'Choose my subscription',
                                                          options: FFButtonOptions(
                                                            height: 40.0,
                                                            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                            iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                            color: FlutterFlowTheme.of(context).primary,
                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                  font: GoogleFonts.inter(
                                                                    fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                  ),
                                                                  color: Colors.white,
                                                                  fontSize: 16.0,
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
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    riskManagment(),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).width < 500.0 ? 12.0 : 100.0,
                                            0.0,
                                          ),
                                          12.0,
                                          valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).width < 500.0 ? 12.0 : 100.0,
                                            0.0,
                                          ),
                                          0.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(10.0),
                                            bottomRight: Radius.circular(10.0),
                                            topLeft: Radius.circular(10.0),
                                            topRight: Radius.circular(10.0),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 2.0, 2.0),
                                          child: Material(
                                            color: Colors.transparent,
                                            elevation: 3.0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10.0),
                                            ),
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color: FlutterFlowTheme.of(context).primaryText,
                                                borderRadius: BorderRadius.circular(10.0),
                                                border: Border.all(
                                                  color: Color(0x14EFF0F6),
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                                                      child: Row(
                                                        mainAxisSize: MainAxisSize.max,
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Text(
                                                            'Free Training',
                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                  font: GoogleFonts.inter(
                                                                    fontWeight: FontWeight.w600,
                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                  fontSize: 20.0,
                                                                  letterSpacing: 0.0,
                                                                  fontWeight: FontWeight.w600,
                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                                                      child: InkWell(
                                                        splashColor: Colors.transparent,
                                                        focusColor: Colors.transparent,
                                                        hoverColor: Colors.transparent,
                                                        highlightColor: Colors.transparent,
                                                        onTap: () async {
                                                          logFirebaseEvent('HOME_PAGE_Row_ksq6k8v6_ON_TAP');
                                                          logFirebaseEvent('Row_launch_u_r_l');
                                                          await launchURL('https://bspconsult.myclickfunnels.com/optin-page--9b9da?new_run=true');
                                                        },
                                                        child: Row(
                                                          mainAxisSize: MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 9.0, 0.0),
                                                              child: Stack(
                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                children: [
                                                                  Container(
                                                                    width: 30.0,
                                                                    height: 30.0,
                                                                    decoration: BoxDecoration(
                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                      border: Border.all(
                                                                        color: Color(0x5B57636C),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  ClipRRect(
                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                    child: Image.asset(
                                                                      'assets/images/normal_large.png',
                                                                      width: 28.0,
                                                                      height: 28.0,
                                                                      fit: BoxFit.cover,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Text(
                                                              'Strategy Models',
                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                    font: GoogleFonts.inter(
                                                                      fontWeight: FontWeight.w500,
                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                    fontSize: 16.0,
                                                                    letterSpacing: 0.0,
                                                                    fontWeight: FontWeight.w500,
                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                    lineHeight: 1.0,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    InkWell(
                                                      splashColor: Colors.transparent,
                                                      focusColor: Colors.transparent,
                                                      hoverColor: Colors.transparent,
                                                      highlightColor: Colors.transparent,
                                                      onTap: () async {
                                                        logFirebaseEvent('HOME_PAGE_Row_by92kxnw_ON_TAP');
                                                        logFirebaseEvent('Row_launch_u_r_l');
                                                        await launchURL('https://bspconsult.myclickfunnels.com/optin-page?new_run=true');
                                                      },
                                                      child: Row(
                                                        mainAxisSize: MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 9.0, 0.0),
                                                            child: Stack(
                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                              children: [
                                                                Container(
                                                                  width: 30.0,
                                                                  height: 30.0,
                                                                  decoration: BoxDecoration(
                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                    border: Border.all(
                                                                      color: Color(0x5B57636C),
                                                                    ),
                                                                  ),
                                                                ),
                                                                ClipRRect(
                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                  child: Image.asset(
                                                                    'assets/images/gold_large.png',
                                                                    width: 28.0,
                                                                    height: 28.0,
                                                                    fit: BoxFit.cover,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Text(
                                                            'Strategy Masterclass',
                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                  font: GoogleFonts.inter(
                                                                    fontWeight: FontWeight.w500,
                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                  fontSize: 16.0,
                                                                  letterSpacing: 0.0,
                                                                  fontWeight: FontWeight.w500,
                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                  lineHeight: 1.0,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).width < 500.0 ? 12.0 : 100.0,
                                            0.0,
                                          ),
                                          12.0,
                                          valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).width < 500.0 ? 12.0 : 100.0,
                                            0.0,
                                          ),
                                          0.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(2.0),
                                          child: Material(
                                            color: Colors.transparent,
                                            elevation: 3.0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10.0),
                                            ),
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color: FlutterFlowTheme.of(context).primaryText,
                                                borderRadius: BorderRadius.circular(10.0),
                                                border: Border.all(
                                                  color: Color(0x14EFF0F6),
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(12.0, 16.0, 12.0, 16.0),
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                                                      child: Row(
                                                        mainAxisSize: MainAxisSize.max,
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Text(
                                                            'Contact us',
                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                  font: GoogleFonts.inter(fontWeight: FontWeight.w600, fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle),
                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                  fontSize: 20.0,
                                                                  letterSpacing: 0.0,
                                                                  fontWeight: FontWeight.w600,
                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                                                      child: InkWell(
                                                        splashColor: Colors.transparent,
                                                        focusColor: Colors.transparent,
                                                        hoverColor: Colors.transparent,
                                                        highlightColor: Colors.transparent,
                                                        onTap: () async {
                                                          logFirebaseEvent('HOME_PAGE_Row_mv41e30d_ON_TAP');
                                                          logFirebaseEvent('Row_launch_u_r_l');
                                                          await launchURL('instagram://user?username=bspconsult');
                                                        },
                                                        child: Row(
                                                          mainAxisSize: MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                              child: SvgPicture.asset(
                                                                'assets/images/instagram.svg',
                                                                width: 32.0,
                                                                height: 32.0,
                                                                fit: BoxFit.cover,
                                                              ),
                                                            ),
                                                            Text(
                                                              'Instagram',
                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                    font: GoogleFonts.inter(fontWeight: FontWeight.w500, fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle),
                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
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
                                                    // Padding(
                                                    //   padding: EdgeInsetsDirectional.fromSTEB(0.0,0.0,0.0,16.0),
                                                    //   child: InkWell(
                                                    //     splashColor:Colors.transparent,
                                                    //     focusColor: Colors.transparent,
                                                    //     hoverColor: Colors.transparent,
                                                    //     highlightColor: Colors.transparent,
                                                    //     onTap: () async {
                                                    //       Clipboard.setData(ClipboardData(text: 'management@bspconsult.com'));
                                                    //       final Uri emailUri = Uri(
                                                    //         scheme: 'mailto',
                                                    //         path: 'management@bspconsult.com',
                                                    //       );
                                                    //       await launchUrl(emailUri);
                                                    //       ScaffoldMessenger.of(context).showSnackBar(
                                                    //         SnackBar(
                                                    //           content:
                                                    //             Text('management@bspconsult.com copied to the clipboard',
                                                    //               style: TextStyle(color: Colors.black),
                                                    //             ),
                                                    //           duration: Duration(milliseconds: 4000),
                                                    //           backgroundColor: FlutterFlowTheme.of(context).info,
                                                    //         ),
                                                    //       );
                                                    //     },
                                                    //     child: Row(
                                                    //       mainAxisSize: MainAxisSize.max,
                                                    //       children: [
                                                    //         Padding(
                                                    //           padding: EdgeInsetsDirectional.fromSTEB(0.0,0.0,10.0,0.0),
                                                    //           child: Image.asset(
                                                    //             'assets/images/email.png',
                                                    //             width: 32.0,
                                                    //             height: 32.0,
                                                    //             fit: BoxFit.cover,
                                                    //           ),
                                                    //         ),
                                                    //         Text(
                                                    //           'Mail',
                                                    //           style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                    //             font: GoogleFonts.inter(
                                                    //               fontWeight: FontWeight.w500,
                                                    //               fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle),
                                                    //               color: FlutterFlowTheme.of(context).secondaryBackground,
                                                    //               fontSize: 16.0,
                                                    //               letterSpacing: 0.0,
                                                    //               fontWeight: FontWeight.w500,
                                                    //               fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                    //           ),
                                                    //         ),
                                                    //       ],
                                                    //     ),
                                                    //   ),
                                                    // ),
                                                    InkWell(
                                                      splashColor: Colors.transparent,
                                                      focusColor: Colors.transparent,
                                                      hoverColor: Colors.transparent,
                                                      highlightColor: Colors.transparent,
                                                      onTap: () async {
                                                        logFirebaseEvent('HOME_PAGE_Row_l2skxv1m_ON_TAP');
                                                        logFirebaseEvent('Row_launch_u_r_l');
                                                        await launchURL('https://t.snapchat.com/lPLA1XMl');
                                                      },
                                                      child: Row(
                                                        mainAxisSize: MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                            child: SvgPicture.asset(
                                                              'assets/images/snapchat.svg',
                                                              width: 32.0,
                                                              height: 32.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          Text(
                                                            'Snapchat',
                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                  font: GoogleFonts.inter(fontWeight: FontWeight.w500, fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle),
                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                  fontSize: 16.0,
                                                                  letterSpacing: 0.0,
                                                                  fontWeight: FontWeight.w500,
                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).width < 500.0 ? 12.0 : 100.0,
                                            0.0,
                                          ),
                                          12.0,
                                          valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).width < 500.0 ? 12.0 : 100.0,
                                            0.0,
                                          ),
                                          40.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(2.0),
                                          child: Material(
                                            color: Colors.transparent,
                                            elevation: 3.0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10.0),
                                            ),
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color: FlutterFlowTheme.of(context).primaryText,
                                                borderRadius: BorderRadius.circular(10.0),
                                                border: Border.all(
                                                  color: Color(0x14EFF0F6),
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(12.0, 16.0, 12.0, 16.0),
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                                                      child: Row(
                                                        mainAxisSize: MainAxisSize.max,
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Text(
                                                            'Account',
                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                  font: GoogleFonts.inter(
                                                                    fontWeight: FontWeight.w600,
                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                  fontSize: 20.0,
                                                                  letterSpacing: 0.0,
                                                                  fontWeight: FontWeight.w600,
                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                                                      child: InkWell(
                                                        splashColor: Colors.transparent,
                                                        focusColor: Colors.transparent,
                                                        hoverColor: Colors.transparent,
                                                        highlightColor: Colors.transparent,
                                                        onTap: () async {
                                                          logFirebaseEvent('HOME_PAGE_Row_yl2k432c_ON_TAP');
                                                          logFirebaseEvent('Row_navigate_to');

                                                          context.pushNamed(TermsAndServiceWidget.routeName);
                                                        },
                                                        child: Row(
                                                          mainAxisSize: MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                              child: Icon(
                                                                Icons.construction,
                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                size: 28.0,
                                                              ),
                                                            ),
                                                            Text(
                                                              'Terms of Service',
                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                    font: GoogleFonts.inter(
                                                                      fontWeight: FontWeight.w500,
                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
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
                                                    Padding(
                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                                                      child: InkWell(
                                                        splashColor: Colors.transparent,
                                                        focusColor: Colors.transparent,
                                                        hoverColor: Colors.transparent,
                                                        highlightColor: Colors.transparent,
                                                        onTap: () async {
                                                          logFirebaseEvent('HOME_PAGE_Row_q128pquw_ON_TAP');
                                                          logFirebaseEvent('Row_navigate_to');

                                                          context.pushNamed(PrivacypolicyWidget.routeName);
                                                        },
                                                        child: Row(
                                                          mainAxisSize: MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                              child: Icon(
                                                                Icons.privacy_tip_outlined,
                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                size: 28.0,
                                                              ),
                                                            ),
                                                            Text(
                                                              'Privacy Policy',
                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                    font: GoogleFonts.inter(
                                                                      fontWeight: FontWeight.w500,
                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
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
                                                    Builder(
                                                      builder: (context) => FFButtonWidget(
                                                        onPressed: () async {
                                                          logFirebaseEvent('HOME_PAGE_DELETE_MY_ACCOUNT_BTN_ON_TAP');
                                                          logFirebaseEvent('Button_alert_dialog');
                                                          await showDialog(
                                                            barrierDismissible: false,
                                                            context: context,
                                                            builder: (dialogContext) {
                                                              return Dialog(
                                                                elevation: 0,
                                                                insetPadding: EdgeInsets.zero,
                                                                backgroundColor: Colors.transparent,
                                                                alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                child: GestureDetector(
                                                                  onTap: () {
                                                                    FocusScope.of(dialogContext).unfocus();
                                                                    FocusManager.instance.primaryFocus?.unfocus();
                                                                  },
                                                                  child: ConfirmDeleteAccountDialogWidget(),
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        },
                                                        text: 'Delete my account',
                                                        icon: Icon(
                                                          Icons.delete_outline,
                                                          size: 15.0,
                                                        ),
                                                        options: FFButtonOptions(
                                                          width: MediaQuery.sizeOf(context).width * 0.95,
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
                                                          borderRadius: BorderRadius.circular(10.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration(),
                            child: Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).secondaryBackground,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                                    child: Stack(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      children: [
                                        Align(
                                          alignment: AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(0.0),
                                              child: Image.asset(
                                                'assets/images/Logo.png',
                                                width: 30.0,
                                                height: 30.8,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            'BSP Consult',
                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                  ),
                                                  color: Colors.white,
                                                  fontSize: 22.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                ),
                                          ),
                                        ),
                                        Align(
                                          alignment: AlignmentDirectional(1.0, 0.0),
                                          child: Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 24.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor: Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent('HOME_PAGE_Icon_h3pxq1c5_ON_TAP');
                                                logFirebaseEvent('Icon_navigate_to');

                                                context.goNamed(LoginWidget.routeName);
                                              },
                                              child: Icon(
                                                Icons.logout,
                                                color: Colors.white,
                                                size: 24.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent('HOME_PAGE_Column_afftpejl_ON_TAP');
                                            logFirebaseEvent('Column_update_page_state');
                                            _model.tipMode = 1;
                                            safeSetState(() {});
                                          },
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                child: Text(
                                                  'Insights',
                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight: FontWeight.w500,
                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                        ),
                                                        color: Colors.white,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight: FontWeight.w500,
                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                      ),
                                                ),
                                              ),
                                              if (_model.tipMode == 1)
                                                Divider(
                                                  thickness: 2.0,
                                                  color: Colors.white,
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent('HOME_PAGE_Column_dtj10t9a_ON_TAP');
                                            logFirebaseEvent('Column_update_page_state');
                                            _model.tipMode = 2;
                                            safeSetState(() {});
                                          },
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                child: Text(
                                                  'Bets',
                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight: FontWeight.w500,
                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                        ),
                                                        color: Colors.white,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight: FontWeight.w500,
                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                      ),
                                                ),
                                              ),
                                              if (_model.tipMode == 2)
                                                Divider(
                                                  thickness: 2.0,
                                                  color: Colors.white,
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).width < 500.0 ? 12.0 : 100.0,
                                            0.0,
                                          ),
                                          0.0,
                                          valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).width < 500.0 ? 12.0 : 100.0,
                                            0.0,
                                          ),
                                          12.0),
                                      child: Stack(
                                        children: [
                                          if (_model.tipMode == 1)
                                            if ((int.tryParse('${currentUserDocument?.membership ?? '0'}') ?? 0) >= 9 && 
                                                (currentUserDocument?.expireDate != null) && 
                                                (currentUserDocument!.expireDate! >= getCurrentTimestamp)
                                            ) 
                                              communicationItems('Insights')
                                            else if ((int.tryParse('${currentUserDocument?.membership ?? '0'}') ?? 0) == 8 && 
                                                     (currentUserDocument?.expireDate != null) && 
                                                     (currentUserDocument!.expireDate! >= getCurrentTimestamp)
                                            ) 
                                              accessDenied()
                                            else 
                                              communicationItems('Exp-Insights'),
                                          if (_model.tipMode == 2) 
                                            if ((int.tryParse('${currentUserDocument?.membership ?? '0'}') ?? 0) < 8 || 
                                                (int.tryParse('${currentUserDocument?.membership ?? '0'}') ?? 0) > 10 || 
                                                (currentUserDocument?.expireDate == null) || 
                                                (currentUserDocument!.expireDate! < getCurrentTimestamp)
                                            ) 
                                              accessDenied()
                                            else 
                                              communicationItems('Bets'),
                                          Align(
                                            alignment: AlignmentDirectional(1.0, 1.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 4.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                children: [
                                                  if (_model.floatingAction)
                                                    Padding(
                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                      child: Column(
                                                        mainAxisSize: MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                                                            child: Row(
                                                              mainAxisSize: MainAxisSize.max,
                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 30.0, 0.0),
                                                                  child: Material(
                                                                    color: Colors.transparent,
                                                                    elevation: 3.0,
                                                                    shape: RoundedRectangleBorder(
                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                    ),
                                                                    child: Container(
                                                                      width: 150.0,
                                                                      height: 28.0,
                                                                      decoration: BoxDecoration(
                                                                        color: Color(0xFF424242),
                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                      ),
                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                      child: Text(
                                                                        'Send a notification',
                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: Colors.white,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Material(
                                                                  color: Colors.transparent,
                                                                  elevation: 3.0,
                                                                  shape: const CircleBorder(),
                                                                  child: Container(
                                                                    width: 40.0,
                                                                    height: 40.0,
                                                                    decoration: BoxDecoration(
                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                      shape: BoxShape.circle,
                                                                    ),
                                                                    child: InkWell(
                                                                      splashColor: Colors.transparent,
                                                                      focusColor: Colors.transparent,
                                                                      hoverColor: Colors.transparent,
                                                                      highlightColor: Colors.transparent,
                                                                      onTap: () async {
                                                                        logFirebaseEvent('HOME_PAGE_Icon_irp5tv2m_ON_TAP');
                                                                        logFirebaseEvent('Icon_update_page_state');
                                                                        _model.floatingAction = false;
                                                                        safeSetState(() {});
                                                                        logFirebaseEvent('Icon_navigate_to');

                                                                        context.pushNamed(
                                                                          NotificationWidget.routeName,
                                                                          extra: <String, dynamic>{
                                                                            kTransitionInfoKey: TransitionInfo(
                                                                              hasTransition: true,
                                                                              transitionType: PageTransitionType.rightToLeft,
                                                                              duration: Duration(milliseconds: 300),
                                                                            ),
                                                                          },
                                                                        );
                                                                      },
                                                                      child: Icon(
                                                                        Icons.mail_rounded,
                                                                        color: Colors.white,
                                                                        size: 24.0,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                                                            child: Row(
                                                              mainAxisSize: MainAxisSize.max,
                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 30.0, 0.0),
                                                                  child: Material(
                                                                    color: Colors.transparent,
                                                                    elevation: 3.0,
                                                                    shape: RoundedRectangleBorder(
                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                    ),
                                                                    child: Container(
                                                                      width: 125.0,
                                                                      height: 28.0,
                                                                      decoration: BoxDecoration(
                                                                        color: Color(0xFF424242),
                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                      ),
                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                      child: Text(
                                                                        'Add a message',
                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: Colors.white,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
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
                                                                    logFirebaseEvent('HOME_PAGE_Container_atjh2jjw_ON_TAP');
                                                                    logFirebaseEvent('Container_update_page_state');
                                                                    _model.floatingAction = false;
                                                                    safeSetState(() {});
                                                                    logFirebaseEvent('Container_navigate_to');

                                                                    context.pushNamed(
                                                                      MessageWidget.routeName,
                                                                      extra: <String, dynamic>{
                                                                        kTransitionInfoKey: TransitionInfo(
                                                                          hasTransition: true,
                                                                          transitionType: PageTransitionType.rightToLeft,
                                                                          duration: Duration(milliseconds: 300),
                                                                        ),
                                                                      },
                                                                    );
                                                                  },
                                                                  child: Material(
                                                                    color: Colors.transparent,
                                                                    elevation: 3.0,
                                                                    shape: const CircleBorder(),
                                                                    child: Container(
                                                                      width: 40.0,
                                                                      height: 40.0,
                                                                      decoration: BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                        shape: BoxShape.circle,
                                                                      ),
                                                                      child: Align(
                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                        child: FaIcon(
                                                                          FontAwesomeIcons.solidComment,
                                                                          color: Colors.white,
                                                                          size: 24.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                                                            child: Row(
                                                              mainAxisSize: MainAxisSize.max,
                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 30.0, 0.0),
                                                                  child: Material(
                                                                    color: Colors.transparent,
                                                                    elevation: 3.0,
                                                                    shape: RoundedRectangleBorder(
                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                    ),
                                                                    child: Container(
                                                                      width: 80.0,
                                                                      height: 28.0,
                                                                      decoration: BoxDecoration(
                                                                        color: Color(0xFF424242),
                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                      ),
                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                      child: Text(
                                                                        'Add a tip',
                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: Colors.white,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
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
                                                                    logFirebaseEvent('HOME_PAGE_Container_zu2vywzh_ON_TAP');
                                                                    logFirebaseEvent('Container_update_page_state');
                                                                    _model.floatingAction = false;
                                                                    safeSetState(() {});
                                                                    logFirebaseEvent('Container_navigate_to');

                                                                    context.pushNamed(
                                                                      TipWidget.routeName,
                                                                      extra: <String, dynamic>{
                                                                        kTransitionInfoKey: TransitionInfo(
                                                                          hasTransition: true,
                                                                          transitionType: PageTransitionType.rightToLeft,
                                                                          duration: Duration(milliseconds: 300),
                                                                        ),
                                                                      },
                                                                    );
                                                                  },
                                                                  child: Material(
                                                                    color: Colors.transparent,
                                                                    elevation: 3.0,
                                                                    shape: const CircleBorder(),
                                                                    child: Container(
                                                                      width: 40.0,
                                                                      height: 40.0,
                                                                      decoration: BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                        shape: BoxShape.circle,
                                                                      ),
                                                                      child: Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                        child: Icon(
                                                                          Icons.bar_chart,
                                                                          color: Colors.white,
                                                                          size: 24.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  if (valueOrDefault(currentUserDocument?.role, '') == 'administrator')
                                                    AuthUserStreamWidget(
                                                      builder: (context) => Material(
                                                        color: Colors.transparent,
                                                        elevation: 3.0,
                                                        shape: const CircleBorder(),
                                                        child: Container(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          decoration: BoxDecoration(
                                                            color: Color(0xFF505050),
                                                            shape: BoxShape.circle,
                                                          ),
                                                          child: InkWell(
                                                            splashColor: Colors.transparent,
                                                            focusColor: Colors.transparent,
                                                            hoverColor: Colors.transparent,
                                                            highlightColor: Colors.transparent,
                                                            onTap: () async {
                                                              logFirebaseEvent('HOME_PAGE_Stack_b5sdc9hw_ON_TAP');
                                                              logFirebaseEvent('Stack_update_page_state');
                                                              _model.floatingAction = !_model.floatingAction;
                                                              safeSetState(() {});
                                                            },
                                                            child: Stack(
                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                              children: [
                                                                if (!_model.floatingAction)
                                                                  Icon(
                                                                    Icons.add,
                                                                    color: Colors.white,
                                                                    size: 24.0,
                                                                  ),
                                                                if (_model.floatingAction)
                                                                  Icon(
                                                                    Icons.clear,
                                                                    color: Colors.white,
                                                                    size: 24.0,
                                                                  ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).secondaryBackground,
                            ),
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                                      child: Stack(
                                        alignment: AlignmentDirectional(0.0, 0.0),
                                        children: [
                                          Align(
                                            alignment: AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(0.0),
                                                child: Image.asset(
                                                  'assets/images/Logo.png',
                                                  width: 30.0,
                                                  height: 30.8,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              'Subscriptions',
                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                    font: GoogleFonts.montserrat(
                                                      fontWeight: FontWeight.w500,
                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                    ),
                                                    color: Colors.white,
                                                    fontSize: 20.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                  ),
                                            ),
                                          ),
                                          Align(
                                            alignment: AlignmentDirectional(1.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 24.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor: Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent('HOME_PAGE_Icon_p2m6c1lq_ON_TAP');
                                                  logFirebaseEvent('Icon_navigate_to');

                                                  context.goNamed(LoginWidget.routeName);
                                                },
                                                child: Icon(
                                                  Icons.logout,
                                                  color: Colors.white,
                                                  size: 24.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Expanded(child: subscriptionMenu(1, 'Silver')),
                                        Expanded(child: subscriptionMenu(2, 'Advance')),
                                        Expanded(child: subscriptionMenu(3, 'Gold')),
                                      ],
                                    ),
                                    if (_model.subscriptionMode == 1)
                                      subscriptionDetails(
                                        price1: 850,
                                        price2: 397,
                                        img: 'silver_large.png',
                                        title1: 'Silver',
                                        title2: 'Start with Structure.',
                                        note: 'For bettors who want a simple, disciplined foundation built on structured bets, clear analysis and repeatable execution.',
                                        validFeatures: [
                                          'Structured Bets',
                                          'Detailed Bet Analysis',
                                          'Tournament Previews',
                                          'Live Betting Opportunities',
                                        ],
                                        notvalidFeatuted: [
                                          'Tournament Insights (Key Data)',
                                          'BSP Tennis Betting Model',
                                          'Essential Video Content',
                                          'High-Stakes Betting Frameworks',
                                          'BSP Masterclass (20+ Hours of Video)',
                                          'Real Time Study Cases',
                                        ],
                                        onPresses: () async {
                                          logFirebaseEvent('HOME_PAGE_START_NOW_BTN_ON_TAP');
                                          logFirebaseEvent('Button_firestore_query');
                                          _model.settings = await querySettingsRecordOnce(singleRecord: true).then((s) => s.firstOrNull);
                                          if (_model.settings!.approve) {
                                            logFirebaseEvent('Button_backend_call');
                                            _model.apiResult3fa = await CreateCheckoutSessionCall.call(
                                              priceId: 'price_1OgVTPCf4YXq1rsyGHWrpUI3',
                                              customerEmail: currentUserEmail,
                                              platform: 'mobile',
                                            );

                                            if ((_model.apiResult3fa?.succeeded ?? true)) {
                                              logFirebaseEvent('Button_launch_u_r_l');
                                              await launchURL(getJsonField(
                                                (_model.apiResult3fa?.jsonBody ?? ''),
                                                r'''$.redirectUrl''',
                                              ).toString());
                                            }
                                          } else {
                                            logFirebaseEvent('Button_revenue_cat');
                                            _model.didPurchaseSilver = await revenue_cat.purchasePackage(revenue_cat.offerings!.current!.getPackage('silver')!.storeProduct.identifier);
                                            if (_model.didPurchaseSilver!) {
                                              logFirebaseEvent('Button_backend_call');

                                              await currentUserReference!.update(createUsersRecordData(
                                                membership: '8',
                                                expireDate: functions.getNextYearDate(getCurrentTimestamp),
                                              ));
                                            }
                                            logFirebaseEvent('Button_page_view');
                                            await _model.pageViewController?.animateToPage(
                                              0,
                                              duration: Duration(milliseconds: 500),
                                              curve: Curves.ease,
                                            );
                                          }

                                          safeSetState(() {});
                                        },
                                      ),
                                    if (_model.subscriptionMode == 2)
                                      subscriptionDetails(
                                        price1: 597,
                                        price2: 397,
                                        img: 'email.png',
                                        title1: 'Advanced',
                                        title2: 'Bet with a real edge.',
                                        note: 'For bettors who want structured bets supported by game-changing data context, deeper insight into odds, and the ability to consistently spot mispriced odds.',
                                        validFeatures: [
                                          'Structured Bets',
                                          'Detailed Bet Analysis',
                                          'Tournament Previews',
                                          'Live Betting Opportunities',
                                          'Tournament Insights (Key Data)',
                                          'BSP Tennis Betting Model',
                                          'Essential Video Content ',
                                        ],
                                        notvalidFeatuted: [
                                          'High-Stakes Betting Frameworks',
                                          'BSP Masterclass (20+ Hours of Video)',
                                          'Real Time Study Cases',
                                        ],
                                        onPresses: () async {
                                          logFirebaseEvent('HOME_PAGE_START_NOW_BTN_ON_TAP');
                                          logFirebaseEvent('Button_firestore_query');
                                          _model.approveState = await querySettingsRecordOnce(
                                            singleRecord: true,
                                          ).then((s) => s.firstOrNull);
                                          if (_model.approveState!.approve) {
                                            logFirebaseEvent('Button_backend_call');
                                            _model.apiResultr4n = await CreateCheckoutSessionCall.call(
                                              priceId: 'price_1NqWtkCf4YXq1rsyDvmsIWtF',
                                              customerEmail: currentUserEmail,
                                              platform: 'mobile',
                                            );

                                            if ((_model.apiResultr4n?.succeeded ?? true)) {
                                              logFirebaseEvent('Button_launch_u_r_l');
                                              await launchURL(getJsonField(
                                                (_model.apiResultr4n?.jsonBody ?? ''),
                                                r'''$.redirectUrl''',
                                              ).toString());
                                            }
                                          } else {
                                            logFirebaseEvent('Button_revenue_cat');
                                            _model.didPurchaseGold = await revenue_cat.purchasePackage(revenue_cat.offerings!.current!.getPackage('gold')!.storeProduct.identifier);
                                            if (_model.didPurchaseGold!) {
                                              logFirebaseEvent('Button_backend_call');

                                              await currentUserReference!.update(createUsersRecordData(
                                                membership: '10',
                                                expireDate: functions.getNextYearDate(getCurrentTimestamp),
                                              ));
                                              logFirebaseEvent('Button_page_view');
                                              await _model.pageViewController?.animateToPage(
                                                0,
                                                duration: Duration(milliseconds: 500),
                                                curve: Curves.ease,
                                              );
                                            }
                                          }
                                          safeSetState(() {});
                                        },
                                      ),
                                    if (_model.subscriptionMode == 3)
                                      subscriptionDetails(
                                        price1: 997,
                                        price2: 397,
                                        img: 'gold_large.png',
                                        title1: 'Gold',
                                        title2: 'Operate at the highest level.',
                                        note: 'For bettors who want to master high-level decision-making, advanced strategies and real-world study cases to operate at their highest potential.',
                                        validFeatures: [
                                          'Structured Bets',
                                          'Detailed Bet Analysis',
                                          'Tournament Previews',
                                          'Live Betting Opportunities',
                                          'Tournament Insights (Key Data)',
                                          'BSP Tennis Betting Model',
                                          'Essential Video Content ',
                                          'High-Stakes Betting Frameworks',
                                          'BSP Masterclass (20+ Hours of Video)',
                                          'Real Time Study Cases',
                                        ],
                                        notvalidFeatuted: [],
                                        onPresses: () async {
                                          logFirebaseEvent('HOME_PAGE_START_NOW_BTN_ON_TAP');
                                          logFirebaseEvent('Button_firestore_query');
                                          _model.approveState = await querySettingsRecordOnce(
                                            singleRecord: true,
                                          ).then((s) => s.firstOrNull);
                                          if (_model.approveState!.approve) {
                                            logFirebaseEvent('Button_backend_call');
                                            _model.apiResultr4n = await CreateCheckoutSessionCall.call(
                                              priceId: 'price_1NqWtkCf4YXq1rsyDvmsIWtF',
                                              customerEmail: currentUserEmail,
                                              platform: 'mobile',
                                            );

                                            if ((_model.apiResultr4n?.succeeded ?? true)) {
                                              logFirebaseEvent('Button_launch_u_r_l');
                                              await launchURL(getJsonField(
                                                (_model.apiResultr4n?.jsonBody ?? ''),
                                                r'''$.redirectUrl''',
                                              ).toString());
                                            }
                                          } else {
                                            logFirebaseEvent('Button_revenue_cat');
                                            _model.didPurchaseGold = await revenue_cat.purchasePackage(revenue_cat.offerings!.current!.getPackage('gold')!.storeProduct.identifier);
                                            if (_model.didPurchaseGold!) {
                                              logFirebaseEvent('Button_backend_call');

                                              await currentUserReference!.update(createUsersRecordData(
                                                membership: '10',
                                                expireDate: functions.getNextYearDate(getCurrentTimestamp),
                                              ));
                                              logFirebaseEvent('Button_page_view');
                                              await _model.pageViewController?.animateToPage(
                                                0,
                                                duration: Duration(milliseconds: 500),
                                                curve: Curves.ease,
                                              );
                                            }
                                          }
                                          safeSetState(() {});
                                        },
                                      ),
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
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: Stack(
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Material(
                                    color: Colors.transparent,
                                    elevation: 0.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(0.0),
                                        bottomRight: Radius.circular(0.0),
                                        topLeft: Radius.circular(20.0),
                                        topRight: Radius.circular(20.0),
                                      ),
                                    ),
                                    child: Container(
                                      width: double.infinity,
                                      height: 60.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF272A32),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(0.0),
                                          bottomRight: Radius.circular(0.0),
                                          topLeft: Radius.circular(20.0),
                                          topRight: Radius.circular(20.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 52.0, 0.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent('HOME_PAGE_Column_4aemalkp_ON_TAP');
                                          logFirebaseEvent('Column_update_page_state');
                                          _model.pageNumber = 0;
                                          safeSetState(() {});
                                          logFirebaseEvent('Column_page_view');
                                          await _model.pageViewController?.animateToPage(
                                            0,
                                            duration: Duration(milliseconds: 500),
                                            curve: Curves.ease,
                                          );
                                        },
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                              child: FaIcon(
                                                FontAwesomeIcons.user,
                                                color: _model.pageNumber == 0 ? FlutterFlowTheme.of(context).primaryText : Color(0xFF6C767E),
                                                size: 20.0,
                                              ),
                                            ),
                                            Text(
                                              'Profile',
                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight: FontWeight.w500,
                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                    ),
                                                    color: _model.pageNumber == 0 ? FlutterFlowTheme.of(context).primaryText : FlutterFlowTheme.of(context).secondaryText,
                                                    fontSize: 14.0,
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
                                  Expanded(
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent('HOME_PAGE_Column_8qzq1p1f_ON_TAP');
                                        logFirebaseEvent('Column_update_page_state');
                                        _model.pageNumber = 1;
                                        safeSetState(() {});
                                        logFirebaseEvent('Column_page_view');
                                        await _model.pageViewController?.animateToPage(
                                          1,
                                          duration: Duration(milliseconds: 500),
                                          curve: Curves.ease,
                                        );
                                      },
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Stack(
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(0.0, -1.0),
                                                child: Container(
                                                  width: 80.0,
                                                  height: 80.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFF272A32),
                                                    borderRadius: BorderRadius.only(
                                                      bottomLeft: Radius.circular(0.0),
                                                      bottomRight: Radius.circular(0.0),
                                                      topLeft: Radius.circular(50.0),
                                                      topRight: Radius.circular(50.0),
                                                    ),
                                                  ),
                                                  alignment: AlignmentDirectional(0.0, -1.0),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(0.0, -1.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                  child: Container(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme.of(context).primary,
                                                      borderRadius: BorderRadius.circular(50.0),
                                                      border: Border.all(
                                                        color: _model.pageNumber == 1 ? FlutterFlowTheme.of(context).primaryBackground : Color(0xC292A6E3),
                                                        width: 3.0,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                      child: FlutterFlowIconButton(
                                                        borderColor: Colors.transparent,
                                                        borderRadius: 25.0,
                                                        borderWidth: 1.0,
                                                        buttonSize: 50.0,
                                                        fillColor: Colors.transparent,
                                                        icon: Icon(
                                                          Icons.bar_chart,
                                                          color: Colors.white,
                                                          size: 30.0,
                                                        ),
                                                        onPressed: () async {
                                                          logFirebaseEvent('HOME_PAGE_MiddleButton_ON_TAP');
                                                          logFirebaseEvent('MiddleButton_update_page_state');
                                                          _model.pageNumber = 1;
                                                          safeSetState(() {});
                                                          logFirebaseEvent('MiddleButton_page_view');
                                                          await _model.pageViewController?.animateToPage(
                                                            1,
                                                            duration: Duration(milliseconds: 500),
                                                            curve: Curves.ease,
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 52.0, 0.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent('HOME_PAGE_Column_7y5r4r36_ON_TAP');
                                          logFirebaseEvent('Column_page_view');
                                          await _model.pageViewController?.animateToPage(
                                            2,
                                            duration: Duration(milliseconds: 500),
                                            curve: Curves.ease,
                                          );
                                          logFirebaseEvent('Column_update_page_state');
                                          _model.pageNumber = 2;
                                          safeSetState(() {});
                                        },
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                              child: Icon(
                                                Icons.subscriptions_outlined,
                                                color: _model.pageNumber == 2 ? Colors.white : Color(0xFF6C767E),
                                                size: 20.0,
                                              ),
                                            ),
                                            Text(
                                              'Subscriptions',
                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight: FontWeight.w500,
                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                    ),
                                                    color: _model.pageNumber == 2 ? Colors.white : FlutterFlowTheme.of(context).secondaryText,
                                                    fontSize: 14.0,
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
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
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
