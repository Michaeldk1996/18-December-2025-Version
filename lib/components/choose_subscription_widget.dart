import 'dart:developer';

import 'package:b_s_p_consult/auth/firebase_auth/auth_util.dart';
import 'package:b_s_p_consult/backend/api_requests/api_calls.dart';
import 'package:b_s_p_consult/backend/backend.dart';
import 'package:b_s_p_consult/flutter_flow/custom_functions.dart' as functions;
import 'package:b_s_p_consult/flutter_flow/revenue_cat_util.dart'
    as revenue_cat;
import 'package:b_s_p_consult/pages/home/home_model.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'choose_subscription_model.dart';
export 'choose_subscription_model.dart';

class ChooseSubscriptionWidget extends StatefulWidget {
  final HomeModel homeModel;
  ChooseSubscriptionWidget({super.key, required this.homeModel});

  @override
  State<ChooseSubscriptionWidget> createState() =>
      _ChooseSubscriptionWidgetState();
}

class _ChooseSubscriptionWidgetState extends State<ChooseSubscriptionWidget> {
  late ChooseSubscriptionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChooseSubscriptionModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 6.0),
                        child: Text(
                          'Upgrade Membership',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.figtree(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            47.0, 0.0, 47.0, 24.0),
                        child: Text(
                          'Upgrade to unlock advanced features and full access.',
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.figtree(
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: Color(0xFFB9BDC7),
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'CHOOSE_SUBSCRIPTION_ADVANCED_BTN_ON_TAP');
                                logFirebaseEvent(
                                    'Button_update_component_state');
                                _model.membershipType = 0;
                                safeSetState(() {});
                                logFirebaseEvent('Button_rebuild_component');
                                safeSetState(() {});
                              },
                              text: 'Advanced',
                              options: FFButtonOptions(
                                height: 32.0,
                                width: MediaQuery.of(context).size.width / 2.4,
                                color: _model.membershipType == 0
                                    ? Color(0x34348AF7)
                                    : Color(0x19FFFFFF),
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
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color: _model.membershipType == 0
                                      ? Color(0xFF348AF7)
                                      : Color(0x36FFFFFF),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            SizedBox(width: 12.0),
                            FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'CHOOSE_SUBSCRIPTION_COMP_GOLD_BTN_ON_TAP');
                                logFirebaseEvent(
                                    'Button_update_component_state');
                                _model.membershipType = 1;
                                safeSetState(() {});
                                logFirebaseEvent('Button_update_app_state');

                                safeSetState(() {});
                              },
                              text: 'Gold',
                              options: FFButtonOptions(
                                width: MediaQuery.of(context).size.width / 2.4,
                                height: 32.0,
                                color: _model.membershipType == 1
                                    ? Color(0x34348AF7)
                                    : Color(0x19FFFFFF),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      font: GoogleFonts.figtree(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                      color: Colors.white,
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color: _model.membershipType == 1
                                      ? Color(0xFF348AF7)
                                      : Color(0x36FFFFFF),
                                  width: 0.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (_model.membershipType == 0)
                        Container(
                            margin: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 20.0),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            // color: Colors.amber,
                            borderRadius: BorderRadius.circular(14.0),
                            image: DecorationImage(
                              image: AssetImage('assets/images/Advanced_spark.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            10.0, 10.0, 10.0, 10.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0x4C000000),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        border: Border.all(
                                          color: Color(0x19FFFFFF),
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional
                                            .fromSTEB(
                                                12.0, 0.0, 12.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(0.0, 12.0,
                                                          0.0, 20.0),
                                              child: Row(
                                                mainAxisSize:
                                                    MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Advanced Program',
                                                    style: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .figtree(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500,
                                                            fontStyle: FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                          ),
                                                          fontSize: 18.0,
                                                          letterSpacing:
                                                              0.0,
                                                          fontWeight:
                                                              FontWeight
                                                                  .w500,
                                                          fontStyle: FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                        ),
                                                  ),
                                                  FFButtonWidget(
                                                    onPressed: () {
                                                      print(
                                                          'Button pressed ...');
                                                    },
                                                    text: 'Best Value',
                                                    options:
                                                        FFButtonOptions(
                                                      height: 40.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  16.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color: Color(
                                                          0x12348AF7),
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                font: GoogleFonts
                                                                    .figtree(
                                                                  fontWeight:
                                                                      FontWeight.normal,
                                                                  fontStyle: FlutterFlowTheme.of(context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                                color: Colors
                                                                    .white,
                                                                fontSize:
                                                                    10.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                              ),
                                                      elevation: 0.0,
                                                      borderSide:
                                                          BorderSide(
                                                        color: Color(
                                                            0xFF348AF7),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                                  20.0),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            RichText(
                                              textScaler:
                                                  MediaQuery.of(context)
                                                      .textScaler,
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: '€200 ',
                                                    style: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .figtree(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500,
                                                            fontStyle: FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                          ),
                                                          fontSize: 24.0,
                                                          letterSpacing:
                                                              0.0,
                                                          fontWeight:
                                                              FontWeight
                                                                  .w500,
                                                          fontStyle: FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                        ),
                                                  ),
                                                  TextSpan(
                                                    text: ' one time fee',
                                                    style: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .figtree(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500,
                                                            fontStyle: FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                          ),
                                                          color: Color(
                                                              0xFFD0D3D9),
                                                          fontSize: 12.0,
                                                          letterSpacing:
                                                              0.0,
                                                          fontWeight:
                                                              FontWeight
                                                                  .w500,
                                                          fontStyle: FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                        ),
                                                  )
                                                ],
                                                style:
                                                    FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts
                                                                  .inter(
                                                            fontWeight: FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                            fontStyle: FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                          ),
                                                          letterSpacing:
                                                              0.0,
                                                          fontWeight: FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontWeight,
                                                          fontStyle: FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                        ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(0.0, 5.0,
                                                          0.0, 0.0),
                                              child: Text(
                                                'Lock in current pricing before next update.',
                                                style: FlutterFlowTheme
                                                        .of(context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts
                                                          .figtree(
                                                        fontWeight:
                                                            FontWeight
                                                                .w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color: Color(
                                                          0xFFD0D3D9),
                                                      fontSize: 12.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(0.0, 25.0,
                                                          0.0, 16.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  print(
                                                      'Button pressed ...');
                                                  logFirebaseEvent(
                                                      'Button_firestore_query');
                                                  widget.homeModel
                                                          .approveState =
                                                      await querySettingsRecordOnce(
                                                    singleRecord: true,
                                                  ).then((s) =>
                                                          s.firstOrNull);
                                                  if (widget
                                                      .homeModel
                                                      .approveState!
                                                      .approve) {
                                                    logFirebaseEvent(
                                                        'Button_backend_call');
                                                    widget.homeModel
                                                            .apiResultr4n =
                                                        await CreateCheckoutSessionCall
                                                            .call(
                                                      priceId:
                                                      'price_1Sh1flCf4YXq1rsy94ex1p16',
                                                          // 'price_1NqWtkCf4YXq1rsyDvmsIWtF',
                                                      customerEmail:
                                                          currentUserEmail,
                                                      platform: 'mobile',
                                                    );
                              
                                                    if ((widget.homeModel.apiResultr4n?.succeeded ??
                                                        true)) {
                                                      logFirebaseEvent(
                                                          'Button_launch_u_r_l');
                                                      await launchURL(
                                                          getJsonField(
                                                        (widget
                                                                .homeModel
                                                                .apiResultr4n
                                                                ?.jsonBody ??
                                                            ''),
                                                        r'''$.redirectUrl''',
                                                      ).toString());
                                                    }
                                                  } else {
                                                    logFirebaseEvent(
                                                        'Button_revenue_cat');
                                                    widget.homeModel
                                                            .didPurchaseGold =
                                                        await revenue_cat
                                                            .purchasePackage(revenue_cat
                                                                .offerings!
                                                                .current!
                                                                .getPackage(
                                                                    'gold')!
                                                                .storeProduct
                                                                .identifier);
                                                    if (widget.homeModel
                                                        .didPurchaseGold!) {
                                                      logFirebaseEvent(
                                                          'Button_backend_call');
                              
                                                      await currentUserReference!
                                                          .update(
                                                              createUsersRecordData(
                                                        membership: '10',
                                                        expireDate: functions
                                                            .getNextYearDate(
                                                                getCurrentTimestamp),
                                                      ));
                                                      logFirebaseEvent(
                                                          'Button_page_view');
                                                      await widget
                                                          .homeModel
                                                          .pageViewController
                                                          ?.animateToPage(
                                                        0,
                                                        duration: Duration(
                                                            milliseconds:
                                                                500),
                                                        curve:
                                                            Curves.ease,
                                                      );
                                                    }
                                                  }
                                                  safeSetState(() {});
                                                },
                                                text:
                                                    'Get Advanced Program',
                                                options: FFButtonOptions(
                                                  width: double.infinity,
                                                  height: 50.0,
                                                  padding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(
                                                              16.0,
                                                              10.0,
                                                              16.0,
                                                              10.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(
                                                              0.0,
                                                              0.0,
                                                              0.0,
                                                              0.0),
                                                  color:
                                                      Color(0x2B348AF7),
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .override(
                                                            font: GoogleFonts
                                                                .figtree(
                                                              fontWeight: FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontWeight,
                                                              fontStyle: FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontStyle,
                                                            ),
                                                            color: Colors
                                                                .white,
                                                            letterSpacing:
                                                                0.0,
                                                            fontWeight: FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontWeight,
                                                            fontStyle: FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontStyle,
                                                          ),
                                                  elevation: 0.0,
                                                  borderSide: BorderSide(
                                                    color:
                                                        Color(0xFF348AF7),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius
                                                          .circular(8.0),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            20.0, 12.0, 20.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Extra benefits with Advanced',
                                          style:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLarge
                                                  .override(
                                                    font:
                                                        GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLarge
                                                              .fontStyle,
                                                    ),
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLarge
                                                            .fontStyle,
                                                  ),
                                        ),
                                        Padding(
                                          padding: EdgeInsetsDirectional
                                              .fromSTEB(
                                                  0.0, 15.0, 0.0, 7.0),
                                          child: Row(
                                            mainAxisSize:
                                                MainAxisSize.max,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        8.0),
                                                child: Image.asset(
                                                  'assets/images/Vector.png',
                                                  width: 20.0,
                                                  height: 20.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            8.0,
                                                            0.0,
                                                            0.0,
                                                            0.0),
                                                child: Text(
                                                  'Advanced Data Insights (BSP App)',
                                                  style: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .inter(
                                                          fontWeight:
                                                              FontWeight
                                                                  .w300,
                                                          fontStyle: FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                        ),
                                                        color: Color(
                                                            0xFFF0F1F3),
                                                        fontSize: 13.0,
                                                        letterSpacing:
                                                            0.0,
                                                        fontWeight:
                                                            FontWeight
                                                                .w300,
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
                                        Padding(
                                          padding: EdgeInsetsDirectional
                                              .fromSTEB(
                                                  0.0, 10.0, 0.0, 7.0),
                                          child: Row(
                                            mainAxisSize:
                                                MainAxisSize.max,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        8.0),
                                                child: Image.asset(
                                                  'assets/images/Vector.png',
                                                  width: 20.0,
                                                  height: 20.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            8.0,
                                                            0.0,
                                                            0.0,
                                                            0.0),
                                                child: Text(
                                                  'BSP Tennis Betting Model',
                                                  style: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .inter(
                                                          fontWeight:
                                                              FontWeight
                                                                  .w300,
                                                          fontStyle: FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                        ),
                                                        color: Color(
                                                            0xFFF0F1F3),
                                                        fontSize: 13.0,
                                                        letterSpacing:
                                                            0.0,
                                                        fontWeight:
                                                            FontWeight
                                                                .w300,
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
                                        Padding(
                                          padding: EdgeInsetsDirectional
                                              .fromSTEB(
                                                  0.0, 10.0, 0.0, 12.0),
                                          child: Row(
                                            mainAxisSize:
                                                MainAxisSize.max,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        8.0),
                                                child: Image.asset(
                                                  'assets/images/Vector.png',
                                                  width: 20.0,
                                                  height: 20.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            8.0,
                                                            0.0,
                                                            0.0,
                                                            0.0),
                                                child: Text(
                                                  'Essential Video Content',
                                                  style: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .inter(
                                                          fontWeight:
                                                              FontWeight
                                                                  .w300,
                                                          fontStyle: FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                        ),
                                                        color: Color(
                                                            0xFFF0F1F3),
                                                        fontSize: 13.0,
                                                        letterSpacing:
                                                            0.0,
                                                        fontWeight:
                                                            FontWeight
                                                                .w300,
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
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      if (_model.membershipType == 1)
                        Container(
                                          margin: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 20.0),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            // color: FlutterFlowTheme.of(context)
                            //     .secondaryBackground,
                            borderRadius: BorderRadius.circular(14.0),
                            image: DecorationImage(
                                              image: AssetImage('assets/images/Spark_Img.png'),
                                              fit: BoxFit.cover,
                                              
                                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            10.0, 10.0, 10.0, 10.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0x4C000000),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        border: Border.all(
                                          color: Color(0x19FFFFFF),
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional
                                            .fromSTEB(
                                                12.0, 0.0, 12.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(0.0, 12.0,
                                                          0.0, 20.0),
                                              child: Row(
                                                mainAxisSize:
                                                    MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Gold Program',
                                                    style: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .figtree(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500,
                                                            fontStyle: FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                          ),
                                                          fontSize: 18.0,
                                                          letterSpacing:
                                                              0.0,
                                                          fontWeight:
                                                              FontWeight
                                                                  .w500,
                                                          fontStyle: FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            RichText(
                                              textScaler:
                                                  MediaQuery.of(context)
                                                      .textScaler,
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: '€600 ',
                                                    style: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .figtree(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500,
                                                            fontStyle: FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                          ),
                                                          fontSize: 24.0,
                                                          letterSpacing:
                                                              0.0,
                                                          fontWeight:
                                                              FontWeight
                                                                  .w500,
                                                          fontStyle: FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                        ),
                                                  ),
                                                  TextSpan(
                                                    text: ' one time fee',
                                                    style: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .figtree(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500,
                                                            fontStyle: FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                          ),
                                                          color: Color(
                                                              0xFFD0D3D9),
                                                          fontSize: 12.0,
                                                          letterSpacing:
                                                              0.0,
                                                          fontWeight:
                                                              FontWeight
                                                                  .w500,
                                                          fontStyle: FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                        ),
                                                  )
                                                ],
                                                style:
                                                    FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts
                                                                  .inter(
                                                            fontWeight: FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                            fontStyle: FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                          ),
                                                          letterSpacing:
                                                              0.0,
                                                          fontWeight: FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontWeight,
                                                          fontStyle: FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                        ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(0.0, 5.0,
                                                          0.0, 0.0),
                                              child: Text(
                                                'Lock in current pricing before next update.',
                                                style: FlutterFlowTheme
                                                        .of(context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts
                                                          .figtree(
                                                        fontWeight:
                                                            FontWeight
                                                                .w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color: Color(
                                                          0xFFD0D3D9),
                                                      fontSize: 12.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(0.0, 25.0,
                                                          0.0, 16.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  print(
                                                      'Button pressed ...');
                                                  var _shouldSetState =
                                                      false;
                                                  logFirebaseEvent(
                                                      'Button_firestore_query');
                                                  widget.homeModel
                                                          .settingsResponse =
                                                      await querySettingsRecordOnce(
                                                    singleRecord: true,
                                                  ).then((s) =>
                                                          s.firstOrNull);
                                                  _shouldSetState = true;
                                                  if (widget
                                                      .homeModel
                                                      .settingsResponse!
                                                      .approve) {
                                                    logFirebaseEvent(
                                                        'Button_backend_call');
                                                    widget.homeModel
                                                            .apiResultd8s =
                                                        await CreateCheckoutSessionCall
                                                            .call(
                                                      priceId: 'price_1OgVtOCf4YXq1rsy99bw9IHr',
                                                          // 'price_1OgVtOCf4YXq1rsy99bw9IHr',
                                                      customerEmail:
                                                          currentUserEmail,
                                                      platform: 'mobile',
                                                    );
                              
                                                    _shouldSetState =
                                                        true;
                                                    if ((widget
                                                            .homeModel
                                                            .apiResultd8s
                                                            ?.succeeded ??
                                                        true)) {
                                                      logFirebaseEvent(
                                                          'Button_launch_u_r_l');
                                                      await launchURL(
                                                          getJsonField(
                                                        (widget
                                                                .homeModel
                                                                .apiResultd8s
                                                                ?.jsonBody ??
                                                            ''),
                                                        r'''$.redirectUrl''',
                                                      ).toString());
                                                    }
                                                  } else {
                                                    log("upgrade membership");
                                                    logFirebaseEvent(
                                                        'Button_revenue_cat');
                                                    widget.homeModel
                                                            .didPurchaseUpgrade =
                                                        await revenue_cat
                                                            .purchasePackage(revenue_cat
                                                                .offerings!
                                                                .current!
                                                                .getPackage(
                                                                    'bspconsult_upgrade_gold_masterclass')!
                                                                .identifier);
                                                    _shouldSetState =
                                                        true;
                                                    if (widget.homeModel
                                                        .didPurchaseUpgrade!) {
                                                      logFirebaseEvent(
                                                          'Button_backend_call');
                              
                                                      await currentUserReference!
                                                          .update(
                                                              createUsersRecordData(
                                                        membership: '10',
                                                        expireDate: functions
                                                            .getNextYearDate(
                                                                getCurrentTimestamp),
                                                      ));
                                                    }
                                                  }
                                                },
                                                text: 'Get Gold Program',
                                                options: FFButtonOptions(
                                                  width: double.infinity,
                                                  height: 50.0,
                                                  padding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(
                                                              16.0,
                                                              10.0,
                                                              16.0,
                                                              10.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(
                                                              0.0,
                                                              0.0,
                                                              0.0,
                                                              0.0),
                                                  color:
                                                      Color(0x33FFCB2B),
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .override(
                                                            font: GoogleFonts
                                                                .figtree(
                                                              fontWeight: FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontWeight,
                                                              fontStyle: FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontStyle,
                                                            ),
                                                            color: Colors
                                                                .white,
                                                            letterSpacing:
                                                                0.0,
                                                            fontWeight: FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontWeight,
                                                            fontStyle: FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontStyle,
                                                          ),
                                                  elevation: 0.0,
                                                  borderSide: BorderSide(
                                                    color:
                                                        Color(0xFFFFCB2B),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius
                                                          .circular(8.0),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            20.0, 12.0, 20.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Extra benefits with Gold',
                                          style:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLarge
                                                  .override(
                                                    font:
                                                        GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLarge
                                                              .fontStyle,
                                                    ),
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLarge
                                                            .fontStyle,
                                                  ),
                                        ),
                                        Padding(
                                          padding: EdgeInsetsDirectional
                                              .fromSTEB(
                                                  0.0, 15.0, 0.0, 7.0),
                                          child: Row(
                                            mainAxisSize:
                                                MainAxisSize.max,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        8.0),
                                                child: Image.asset(
                                                  'assets/images/Vector_(2).png',
                                                  width: 20.0,
                                                  height: 20.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            8.0,
                                                            0.0,
                                                            0.0,
                                                            0.0),
                                                child: Text(
                                                  'Advanced Data Insights (BSP App)',
                                                  style: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .inter(
                                                          fontWeight:
                                                              FontWeight
                                                                  .w300,
                                                          fontStyle: FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                        ),
                                                        color: Color(
                                                            0xFFF0F1F3),
                                                        fontSize: 13.0,
                                                        letterSpacing:
                                                            0.0,
                                                        fontWeight:
                                                            FontWeight
                                                                .w300,
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
                                        Padding(
                                          padding: EdgeInsetsDirectional
                                              .fromSTEB(
                                                  0.0, 10.0, 0.0, 7.0),
                                          child: Row(
                                            mainAxisSize:
                                                MainAxisSize.max,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        8.0),
                                                child: Image.asset(
                                                  'assets/images/Vector_(2).png',
                                                  width: 20.0,
                                                  height: 20.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            8.0,
                                                            0.0,
                                                            0.0,
                                                            0.0),
                                                child: Text(
                                                  'BSP Tennis Betting Model',
                                                  style: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .inter(
                                                          fontWeight:
                                                              FontWeight
                                                                  .w300,
                                                          fontStyle: FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                        ),
                                                        color: Color(
                                                            0xFFF0F1F3),
                                                        fontSize: 13.0,
                                                        letterSpacing:
                                                            0.0,
                                                        fontWeight:
                                                            FontWeight
                                                                .w300,
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
                                        Padding(
                                          padding: EdgeInsetsDirectional
                                              .fromSTEB(
                                                  0.0, 10.0, 0.0, 12.0),
                                          child: Row(
                                            mainAxisSize:
                                                MainAxisSize.max,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        8.0),
                                                child: Image.asset(
                                                  'assets/images/Vector_(2).png',
                                                  width: 20.0,
                                                  height: 20.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            8.0,
                                                            0.0,
                                                            0.0,
                                                            0.0),
                                                child: Text(
                                                  'Essential Video Content',
                                                  style: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .inter(
                                                          fontWeight:
                                                              FontWeight
                                                                  .w300,
                                                          fontStyle: FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                        ),
                                                        color: Color(
                                                            0xFFF0F1F3),
                                                        fontSize: 13.0,
                                                        letterSpacing:
                                                            0.0,
                                                        fontWeight:
                                                            FontWeight
                                                                .w300,
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
                                        Padding(
                                          padding: EdgeInsetsDirectional
                                              .fromSTEB(
                                                  0.0, 10.0, 0.0, 12.0),
                                          child: Row(
                                            mainAxisSize:
                                                MainAxisSize.max,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        8.0),
                                                child: Image.asset(
                                                  'assets/images/Vector_(2).png',
                                                  width: 20.0,
                                                  height: 20.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            8.0,
                                                            0.0,
                                                            0.0,
                                                            0.0),
                                                child: Text(
                                                  'High-Stakes Betting Frameworks',
                                                  style: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .inter(
                                                          fontWeight:
                                                              FontWeight
                                                                  .w300,
                                                          fontStyle: FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                        ),
                                                        color: Color(
                                                            0xFFF0F1F3),
                                                        fontSize: 13.0,
                                                        letterSpacing:
                                                            0.0,
                                                        fontWeight:
                                                            FontWeight
                                                                .w300,
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
                                        Padding(
                                          padding: EdgeInsetsDirectional
                                              .fromSTEB(
                                                  0.0, 10.0, 0.0, 12.0),
                                          child: Row(
                                            mainAxisSize:
                                                MainAxisSize.max,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        8.0),
                                                child: Image.asset(
                                                  'assets/images/Vector_(2).png',
                                                  width: 20.0,
                                                  height: 20.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            8.0,
                                                            0.0,
                                                            0.0,
                                                            0.0),
                                                child: Text(
                                                  'BSP Masterclass (20+ Hours of Video)',
                                                  style: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .inter(
                                                          fontWeight:
                                                              FontWeight
                                                                  .w300,
                                                          fontStyle: FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                        ),
                                                        color: Color(
                                                            0xFFF0F1F3),
                                                        fontSize: 13.0,
                                                        letterSpacing:
                                                            0.0,
                                                        fontWeight:
                                                            FontWeight
                                                                .w300,
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
                                        Padding(
                                          padding: EdgeInsetsDirectional
                                              .fromSTEB(
                                                  0.0, 6.0, 0.0, 15.0),
                                          child: Row(
                                            mainAxisSize:
                                                MainAxisSize.max,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        8.0),
                                                child: Image.asset(
                                                  'assets/images/Vector_(2).png',
                                                  width: 20.0,
                                                  height: 20.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            8.0,
                                                            0.0,
                                                            0.0,
                                                            0.0),
                                                child: Text(
                                                  'Real Time Study Cases',
                                                  style: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .inter(
                                                          fontWeight:
                                                              FontWeight
                                                                  .w300,
                                                          fontStyle: FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                        ),
                                                        color: Color(
                                                            0xFFF0F1F3),
                                                        fontSize: 13.0,
                                                        letterSpacing:
                                                            0.0,
                                                        fontWeight:
                                                            FontWeight
                                                                .w300,
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
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
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
    );
  }
}
