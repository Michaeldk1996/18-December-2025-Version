import 'package:b_s_p_consult/backend/api_requests/api_calls.dart';
import 'package:b_s_p_consult/backend/backend.dart';
import 'package:b_s_p_consult/flutter_flow/custom_functions.dart' as functions;
import 'package:b_s_p_consult/flutter_flow/flutter_flow_util.dart';
import 'package:b_s_p_consult/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:b_s_p_consult/pages/home/home_model.dart';
import 'package:b_s_p_consult/widgets/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../auth/firebase_auth/auth_util.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_widgets.dart';

class Subscriptions extends StatefulWidget {
  final HomeModel model;
  final VoidCallback logOut;
  const Subscriptions(this.model, this.logOut, {super.key});

  @override
  State<Subscriptions> createState() => _SubscriptionsState();
}

class _SubscriptionsState extends State<Subscriptions> {
  
  Widget subscriptionMenu(int value, String title) {
    return FFButtonWidget(
      text: title, 
      onPressed: (){
        safeSetState(() {
          widget.model.subscriptionMode = value;
        });
      }, 
      options: widget.model.subscriptionMode == value 
        ? context.cusbuttonOptions(fontSize: 12, fontWeight: FontWeight.normal)
        : context.greybuttonOptions(fontSize: 12, fontWeight: FontWeight.normal)
    );
    // return InkWell(
    //   splashColor: Colors.transparent,
    //   focusColor: Colors.transparent,
    //   hoverColor: Colors.transparent,
    //   highlightColor: Colors.transparent,
    //   onTap: () async {
    //     safeSetState(() {
    //       widget.model.subscriptionMode = value;
    //     });
    //   },
    //   child: Column(
    //     mainAxisSize: MainAxisSize.max,
    //     children: [
    //       Padding(
    //         padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
    //         child: Text(
    //           title,
    //           style: FlutterFlowTheme.of(context).bodyMedium.override(
    //                 font: GoogleFonts.montserrat(
    //                   fontWeight: FontWeight.w600,
    //                   fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
    //                 ),
    //                 color: Colors.white,
    //                 letterSpacing: 0.0,
    //                 fontWeight: FontWeight.w600,
    //                 fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
    //               ),
    //         ),
    //       ),
    //       if (widget.model.subscriptionMode == value)
    //         Divider(
    //           thickness: 2.0,
    //           color: Colors.white,
    //         ),
    //     ],
    //   ),
    // );
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

  Widget subscriptionDetails({required int id, required String title1, required String note, required int price, required String title2, required List<String> validFeatures, required List<String> notvalidFeatuted, required VoidCallback onPressed, required bool onetimefee}) {
    return Container(
      margin: EdgeInsets.only(top: 22, left: 9, right: 9, bottom: 50),
      // padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 0.03),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 8.91),
            blurRadius: 14.3,
            spreadRadius: 0,
            color: Colors.black.withValues(alpha: 0.25),
          ),
        ]
      ),
      child: Stack(
        children: [
          if (id != 9)
            Positioned(
              top: 0,
              left: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(16)),
                child: Image.asset('assets/images/greycircle.png')
              )
            )
          else
            ...[
              Positioned(
                top: 0,
                left: 0,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
                  child: Image.asset('assets/images/bluemask2.png', width: MediaQuery.of(context).size.width - 15, fit: BoxFit.cover,)
                )
              ),
              Positioned(
                top: 0,
                left: 0,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(16)),
                  child: Image.asset('assets/images/bluemask3.png')
                )
              ),
              Positioned(
                top: 0,
                left: 0,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(16)),
                  child: Image.asset('assets/images/bluemask1.png')
                )
              ),
            ],
          Positioned(
            bottom: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(16)),
              child: Image.asset('assets/images/bluecircle2.png')
            )
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 9,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(26, 26, 26, 12),
                width: double.infinity,
                margin: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(0, 0, 0, 0.3),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.white.withValues(alpha: 0.15))
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 9,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('$title1 Program', style: TextStyle(color: Colors.white, fontSize: 20)),
                        if (id == 9) 
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 9, vertical: 3),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(52, 138, 247, 0.2),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: Color.fromRGBO(52, 138, 247, 1))
                            ),
                            child: Text('Best Value', style: TextStyle(color: Color.fromRGBO(240, 241, 243, 1), fontSize: 12)),
                          )
                      ],
                    ),
                    Text(note, style: TextStyle(color: Color.fromRGBO(240, 241, 243, 1), height: 1.5, fontSize: 14)),
                    SizedBox(height: 0),
                    Row(
                      spacing: 2,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('€$price', style: TextStyle(color: Colors.white, fontSize: 28)),
                        Container(
                          margin: EdgeInsets.only(bottom: 2),
                          child: Text('${onetimefee ? ' one time fee' : '/year'} ', style: TextStyle(color: Colors.white, fontSize: 15))
                        ),
                      ],
                    ),
                    Text(title2, style: TextStyle(color: Color.fromRGBO(240, 241, 243, 1), fontSize: 13)),
                    Container(
                      margin: EdgeInsets.only(top: 6, bottom: 9),
                      width: double.infinity,
                      child: int.tryParse('${currentUserDocument?.membership ?? '0'}') == id 
                        ? FFButtonWidget(
                            text: 'Current Plan', 
                            onPressed: (){},
                            options: context.greybuttonOptions(background: Color.fromRGBO(43, 47, 56, 1), fontColor: Color.fromRGBO(102, 112, 133, 1))
                          )
                        : FFButtonWidget(
                            text: 'Get ${title1} Program', 
                            onPressed: onPressed, 
                            options: context.buttonOptions
                          ),
                    )
                  ],
                ),
              ),
              // SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text('$title1 Includes', style: TextStyle(color: Color.fromRGBO(240, 241, 243, 1), fontSize: 16, fontWeight: FontWeight.bold)),
              ),
              ... validFeatures.map((itm)=>Container(
                margin: EdgeInsets.only(bottom: 3),
                child: Row(
                  spacing: 6,
                  children: [
                    SizedBox(width: 12),
                    SvgPicture.asset('assets/images/checkbox.svg', height: 18),
                    SizedBox(width: 1),
                    Text(itm, style: TextStyle(color: Color.fromRGBO(240, 241, 243, 1), fontWeight: FontWeight.w600))
                  ],
                ),
              )).toList(),
              ... notvalidFeatuted.map((itm)=>Opacity(
                opacity: 0.5,
                child: Container(
                  margin: EdgeInsets.only(bottom: 6),
                  child: Row(
                    spacing: 6,
                    children: [
                      SizedBox(width: 12),
                      SvgPicture.asset('assets/images/checkbox.svg', height: 18),
                      SizedBox(width: 1),
                      Text(itm, style: TextStyle(color: Color.fromRGBO(240, 241, 243, 1), decoration: TextDecoration.lineThrough, fontWeight: FontWeight.w600))
                    ],
                  ),
                ),
              )).toList(),
              SizedBox(height: 19)
              // if (1==2)
              // Container(
              //   width: 200.0,
              //   height: 90.0,
              //   decoration: BoxDecoration(
              //     gradient: LinearGradient(
              //       colors: [Color(0xFF0867EF), Color(0xFF0D1117)],
              //       stops: [0.0, 1.0],
              //       begin: AlignmentDirectional(0.0, -1.0),
              //       end: AlignmentDirectional(0, 1.0),
              //     ),
              //     borderRadius: BorderRadius.only(
              //       bottomLeft: Radius.circular(0.0),
              //       bottomRight: Radius.circular(0.0),
              //       topLeft: Radius.circular(20.0),
              //       topRight: Radius.circular(20.0),
              //     ),
              //   ),
              //   child: Padding(
              //     padding: EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 2.0, 0.0),
              //     child: Container(
              //       width: 200.0,
              //       height: 90.0,
              //       decoration: BoxDecoration(
              //         color: FlutterFlowTheme.of(context).secondaryBackground,
              //         borderRadius: BorderRadius.only(
              //           bottomLeft: Radius.circular(0.0),
              //           bottomRight: Radius.circular(0.0),
              //           topLeft: Radius.circular(20.0),
              //           topRight: Radius.circular(20.0),
              //         ),
              //       ),
              //       child: Column(
              //         mainAxisSize: MainAxisSize.max,
              //         children: [
              //           Text(
              //             '€$price1',
              //             style: FlutterFlowTheme.of(context).bodyMedium.override(
              //                   font: GoogleFonts.inter(
              //                     fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
              //                     fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
              //                   ),
              //                   color: Color(0xFF627083),
              //                   fontSize: 28.0,
              //                   letterSpacing: 0.0,
              //                   fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
              //                   fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
              //                   decoration: TextDecoration.lineThrough,
              //                 ),
              //           ),
              //           Text(
              //             '€$price2',
              //             style: FlutterFlowTheme.of(context).bodyMedium.override(
              //                   font: GoogleFonts.inter(
              //                     fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
              //                     fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
              //                   ),
              //                   color: Color(0xFFF9FAFB),
              //                   fontSize: 50.0,
              //                   letterSpacing: 0.0,
              //                   fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
              //                   fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
              //                   lineHeight: 1.0,
              //                 ),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              // if (1==2)
              // Padding(
              //   padding: EdgeInsetsDirectional.fromSTEB(valueOrDefault<double>(MediaQuery.sizeOf(context).width < 500.0 ? 12.0 : 100.0, 0.0), 0.0, valueOrDefault<double>(MediaQuery.sizeOf(context).width < 500.0 ? 12.0 : 100.0, 0.0), 20.0),
              //   child: Container(
              //     decoration: BoxDecoration(
              //       boxShadow: [
              //         BoxShadow(
              //           blurRadius: 70.0,
              //           color: Color(0x300986FB),
              //           offset: Offset(0.0, 0.0),
              //         )
              //       ],
              //       gradient: LinearGradient(
              //         colors: [Color(0xFF076AF4), Color(0xFF0D1117), Color(0xFF086AF5)],
              //         stops: [0.0, 0.5, 1.0],
              //         begin: AlignmentDirectional(-0.93, -1.0),
              //         end: AlignmentDirectional(0.93, 1.0),
              //       ),
              //       borderRadius: BorderRadius.circular(24.0),
              //     ),
              //     child: Padding(
              //       padding: EdgeInsets.all(2.0),
              //       child: Container(
              //         width: double.infinity,
              //         decoration: BoxDecoration(
              //           color: FlutterFlowTheme.of(context).secondaryBackground,
              //           boxShadow: [
              //             BoxShadow(
              //               blurRadius: 7.0,
              //               color: Color(0x0F14142B),
              //               offset: Offset(
              //                 0.0,
              //                 2.0,
              //               ),
              //             )
              //           ],
              //           borderRadius: BorderRadius.circular(24.0),
              //           border: Border.all(
              //             color: Color(0x14EFF0F6),
              //             width: 1.0,
              //           ),
              //         ),
              //         child: Column(
              //           mainAxisSize: MainAxisSize.max,
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Padding(
              //               padding: EdgeInsetsDirectional.fromSTEB(0.0, 14.0, 14.0, 0.0),
              //               child: Row(
              //                 mainAxisSize: MainAxisSize.max,
              //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Padding(
              //                     padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 0.0, 12.0),
              //                     child: Image.asset(
              //                       'assets/images/$img',
              //                       width: 100.0,
              //                       height: 100.0,
              //                       fit: BoxFit.cover,
              //                     ),
              //                   ),
              //                   Container(
              //                     width: 110.0,
              //                     height: 33.0,
              //                     decoration: BoxDecoration(
              //                       color: FlutterFlowTheme.of(context).secondaryBackground,
              //                       borderRadius: BorderRadius.circular(40.0),
              //                       border: Border.all(
              //                         color: Color(0xFF0867EF),
              //                         width: 2.0,
              //                       ),
              //                     ),
              //                     alignment: AlignmentDirectional(0.0, 0.0),
              //                     child: Text(
              //                       '€33/month',
              //                       style: FlutterFlowTheme.of(context).bodyMedium.override(
              //                             font: GoogleFonts.inter(
              //                               fontWeight: FontWeight.w600,
              //                               fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
              //                             ),
              //                             letterSpacing: 0.0,
              //                             fontWeight: FontWeight.w600,
              //                             fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
              //                           ),
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             ),
              //             Padding(
              //               padding: EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 0.0, 0.0),
              //               child: Text(
              //                 '$title1 Program',
              //                 textAlign: TextAlign.center,
              //                 style: FlutterFlowTheme.of(context).bodyMedium.override(
              //                       font: GoogleFonts.inter(
              //                         fontWeight: FontWeight.w600,
              //                         fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
              //                       ),
              //                       color: Colors.white,
              //                       fontSize: 34.0,
              //                       letterSpacing: 0.0,
              //                       fontWeight: FontWeight.w600,
              //                       fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
              //                     ),
              //               ),
              //             ),
              //             Padding(
              //               padding: EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 0.0, 0.0),
              //               child: Text(
              //                 title2,
              //                 textAlign: TextAlign.center,
              //                 style: FlutterFlowTheme.of(context).bodyMedium.override(
              //                       font: GoogleFonts.inter(
              //                         fontWeight: FontWeight.w600,
              //                         fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
              //                       ),
              //                       color: Colors.white,
              //                       fontSize: 22.0,
              //                       letterSpacing: 0.0,
              //                       fontWeight: FontWeight.w600,
              //                       fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
              //                     ),
              //               ),
              //             ),
              //             Padding(
              //               padding: EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 30.0),
              //               child: Text(
              //                 note,
              //                 textAlign: TextAlign.start,
              //                 style: FlutterFlowTheme.of(context).bodyMedium.override(
              //                       font: GoogleFonts.inter(
              //                         fontWeight: FontWeight.w500,
              //                         fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
              //                       ),
              //                       color: Color(0xFF9A9A9A),
              //                       fontSize: 16.0,
              //                       letterSpacing: 0.0,
              //                       fontWeight: FontWeight.w500,
              //                       fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
              //                     ),
              //               ),
              //             ),
              //             for (var i in validFeatures) subscriptionitemFeature(i, true),
              //             for (var i in notvalidFeatuted) subscriptionitemFeature(i, false),
              //             Row(
              //               mainAxisSize: MainAxisSize.max,
              //               children: [
              //                 Expanded(
              //                   child: Padding(
              //                     padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 20.0),
              //                     child: FFButtonWidget(
              //                       onPressed: onPresses,
              //                       text: 'Get $title1',
              //                       options: FFButtonOptions(
              //                         height: 50.0,
              //                         padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
              //                         iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              //                         color: FlutterFlowTheme.of(context).primary,
              //                         textStyle: FlutterFlowTheme.of(context).titleSmall.override(
              //                               font: GoogleFonts.inter(
              //                                 fontWeight: FontWeight.bold,
              //                                 fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
              //                               ),
              //                               color: Colors.white,
              //                               letterSpacing: 0.0,
              //                               fontWeight: FontWeight.bold,
              //                               fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
              //                             ),
              //                         elevation: 3.0,
              //                         borderSide: BorderSide(
              //                           color: Colors.transparent,
              //                           width: 1.0,
              //                         ),
              //                         borderRadius: BorderRadius.circular(100.0),
              //                       ),
              //                     ),
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints(
          maxWidth: 600
        ),      
        decoration: BoxDecoration(
          // color: FlutterFlowTheme.of(context).secondaryBackground,
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
                      // Align(
                      //   alignment: AlignmentDirectional(-1.0, 0.0),
                      //   child: Padding(
                      //     padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                      //     child: ClipRRect(
                      //       borderRadius: BorderRadius.circular(0.0),
                      //       child: Image.asset(
                      //         'assets/images/Logo.png',
                      //         width: 30.0,
                      //         height: 30.8,
                      //         fit: BoxFit.cover,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          'PROGRAMS',
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
                            onTap: widget.logOut,
                            // onTap: () async {
                            //   logFirebaseEvent('HOME_PAGE_Icon_p2m6c1lq_ON_TAP');
                            //   logFirebaseEvent('Icon_navigate_to');
                            //   await authManager.signOut();
                            //   context.goNamed(LoginWidget.routeName);
                            // },
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
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  height: 30,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 9,
                    children: [
                      Expanded(child: subscriptionMenu(1, 'Silver')),
                      Expanded(child: subscriptionMenu(2, 'Advanced')),
                      Expanded(child: subscriptionMenu(3, 'Gold')),
                    ],
                  ),
                ),
                if (widget.model.subscriptionMode == 1)
                  subscriptionDetails(
                    id: 8,
                    title1: 'Silver',
                    price: 397,
                    // img: 'silver_large.png',
                    title2: 'Best for starting with structure.',
                    note: 'For bettors who want a simple, disciplined foundation built on structured bets, clear analysis and repeatable execution. Designed to replace emotional decisions and bad habits with consistency.',
                    validFeatures: [
                      'Structured Bets',
                      'Detailed Bet Analysis',
                      'Tournament Previews',
                      'Live Betting Opportunities',
                    ],
                    notvalidFeatuted: [
                      'Advanced Data Insights (BSP App)',
                      'BSP Tennis Betting Model',
                      'Essential Video Content',
                      'High-Stakes Betting Frameworks',
                      'BSP Masterclass (20+ Hours of Video)',
                      'Real Time Study Cases'
                    ],
                    onetimefee: false,
                    onPressed: () async {
                      logFirebaseEvent('HOME_PAGE_START_NOW_BTN_ON_TAP');
                      logFirebaseEvent('Button_firestore_query');
                      widget.model.settings = await querySettingsRecordOnce(singleRecord: true).then((s) => s.firstOrNull);
                      if (widget.model.settings!.approve) {
                        logFirebaseEvent('Button_backend_call');
                        widget.model.apiResult3fa = await CreateCheckoutSessionCall.call(
                          priceId: Setting.silver_priceId,
                          customerEmail: currentUserEmail,
                          platform: 'mobile',
                        );
      
                        if ((widget.model.apiResult3fa?.succeeded ?? true)) {
                          logFirebaseEvent('Button_launch_u_r_l');
                          await launchURL(
                            getJsonField(
                              (widget.model.apiResult3fa?.jsonBody ?? ''),
                              r'''$.redirectUrl''',
                            ).toString()
                          );
                        }
                      } else {
                        logFirebaseEvent('Button_revenue_cat');
                        widget.model.didPurchaseSilver = await revenue_cat.purchasePackage(revenue_cat.offerings!.current!.getPackage('silver')!.storeProduct.identifier);
                        if (widget.model.didPurchaseSilver!) {
                          logFirebaseEvent('Button_backend_call');
      
                          await currentUserReference!.update(createUsersRecordData(
                            membership: '8',
                            expireDate: functions.getNextYearDate(getCurrentTimestamp),
                          ));
                        }
                        logFirebaseEvent('Button_page_view');
                        await widget.model.pageViewController?.animateToPage(
                          0,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      }
      
                      safeSetState(() {});
                    },
                  ),
                if (widget.model.subscriptionMode == 2)
                  subscriptionDetails(
                    id: 9,
                    title1: 'Advanced',
                    price: 597,
                    title2: 'Lock in pricing before the next platform update.',
                    note: 'For bettors who want structured bets backed by game-changing data and access to the BSP Betting Model to consistently identify mispriced odds. From year two, maintain full access for just €397 annually.',
                    validFeatures: [
                      'Structured Bets',
                      'Detailed Bet Analysis',
                      'Tournament Previews',
                      'Live Betting Opportunities',
                      'Advanced Data Insights (BSP App)',
                      'BSP Tennis Betting Model',
                      'Essential Video Content',
                    ],
                    notvalidFeatuted: [
                      'High-Stakes Betting Frameworks',
                      'BSP Masterclass (20+ Hours of Video)',
                      'Real Time Study Cases'
                    ],
                    onetimefee: true,
                    onPressed: () async {
                      logFirebaseEvent('HOME_PAGE_START_NOW_BTN_ON_TAP');
                      logFirebaseEvent('Button_firestore_query');
                      widget.model.approveState = await querySettingsRecordOnce(
                        singleRecord: true,
                      ).then((s) => s.firstOrNull);
                      if (widget.model.approveState!.approve) {
                        logFirebaseEvent('Button_backend_call');
      
                        // String priceId = Setting.Advanced_priceId;
                        // if ((int.tryParse(currentUserDocument?.membership ?? '0') ?? 0) == 8){
                        //   priceId = Setting.silver_Advance_priceId;
                        // }
      
                        widget.model.apiResultr4n = await CreateCheckoutSessionCall.call(
                          priceId: Setting.Advanced_priceId,
                          customerEmail: currentUserEmail,
                          platform: 'mobile',
                        );
      
                        if ((widget.model.apiResultr4n?.succeeded ?? true)) {
                          logFirebaseEvent('Button_launch_u_r_l');
                          await launchURL(getJsonField(
                            (widget.model.apiResultr4n?.jsonBody ?? ''),
                            r'''$.redirectUrl''',
                          ).toString());
                        }
                      } else {
                        logFirebaseEvent('Button_revenue_cat');
                        widget.model.didPurchaseGold = await revenue_cat.purchasePackage(revenue_cat.offerings!.current!.getPackage('gold')!.storeProduct.identifier);
                        if (widget.model.didPurchaseGold!) {
                          logFirebaseEvent('Button_backend_call');
      
                          await currentUserReference!.update(createUsersRecordData(
                            membership: '10',
                            expireDate: functions.getNextYearDate(getCurrentTimestamp),
                          ));
                          logFirebaseEvent('Button_page_view');
                          await widget.model.pageViewController?.animateToPage(
                            0,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        }
                      }
                      safeSetState(() {});
                    },
                  ),
                if (widget.model.subscriptionMode == 3)
                  subscriptionDetails(
                    id: 10,
                    title1: 'Gold',
                    price: 997,
                    title2: 'Secure current Gold pricing.',
                    note: 'For bettors who want to master high-level decision-making, advanced strategies and real-world study cases to operate at their highest potential. From year two, maintain full access for just €397 annually.',
                    validFeatures: [
                      'Structured Bets',
                      'Detailed Bet Analysis',
                      'Tournament Previews',
                      'Live Betting Opportunities',
                      'Advanced Data Insights (BSP App)',
                      'BSP Tennis Betting Model',
                      'Essential Video Content',
                      'High-Stakes Betting Frameworks',
                      'BSP Masterclass (20+ Hours of Video)',
                      'Real Time Study Cases'
                    ],
                    notvalidFeatuted: [],
                    onetimefee: true,
                    onPressed: () async {
                      logFirebaseEvent('HOME_PAGE_START_NOW_BTN_ON_TAP');
                      logFirebaseEvent('Button_firestore_query');
                      widget.model.approveState = await querySettingsRecordOnce(
                        singleRecord: true,
                      ).then((s) => s.firstOrNull);
                      if (widget.model.approveState!.approve) {
                        logFirebaseEvent('Button_backend_call');
      
                        // String priceId = Setting.Gold_priceId;
                        // if ((int.tryParse(currentUserDocument?.membership ?? '0') ?? 0) == 8){
                        //   priceId = Setting.silver_Gold_priceId;
                        // }
                        // else if ((int.tryParse(currentUserDocument?.membership ?? '0') ?? 0) == 9){
                        //   priceId = Setting.Advanced_gold_priceId;
                        // }
      
                        widget.model.apiResultr4n = await CreateCheckoutSessionCall.call(
                          priceId: Setting.Gold_priceId,
                          customerEmail: currentUserEmail,
                          platform: 'mobile',
                        );
      
                        if ((widget.model.apiResultr4n?.succeeded ?? true)) {
                          logFirebaseEvent('Button_launch_u_r_l');
                          await launchURL(getJsonField(
                            (widget.model.apiResultr4n?.jsonBody ?? ''),
                            r'''$.redirectUrl''',
                          ).toString());
                        }
                      } else {
                        logFirebaseEvent('Button_revenue_cat');
                        widget.model.didPurchaseGold = await revenue_cat.purchasePackage(revenue_cat.offerings!.current!.getPackage('gold')!.storeProduct.identifier);
                        if (widget.model.didPurchaseGold!) {
                          logFirebaseEvent('Button_backend_call');
      
                          await currentUserReference!.update(createUsersRecordData(
                            membership: '10',
                            expireDate: functions.getNextYearDate(getCurrentTimestamp),
                          ));
                          logFirebaseEvent('Button_page_view');
                          await widget.model.pageViewController?.animateToPage(
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
    );
  }
}