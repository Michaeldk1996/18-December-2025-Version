import 'package:b_s_p_consult/pages/home/upgrade_membership.dart';
import 'package:b_s_p_consult/widgets/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../auth/firebase_auth/auth_util.dart';
import '../../components/confirm_delete_account_dialog/confirm_delete_account_dialog_widget.dart';
import '../../components/confirm_reset_password/confirm_reset_password_widget.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import '../../flutter_flow/flutter_flow_widgets.dart';
import '../privacypolicy/privacypolicy_widget.dart';
import '../terms_and_service/terms_and_service_widget.dart';
import 'home_model.dart';

class ProfileScreen extends StatefulWidget {
  final HomeModel model;
  final Widget riskManagment;  
  final VoidCallback logOut;
  const ProfileScreen(this.model, this.riskManagment, this.logOut, {super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
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
                      'Profile'.toUpperCase(),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.montserrat(
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
                        //   logFirebaseEvent('HOME_PAGE_Icon_dwi1qizi_ON_TAP');
                        //   logFirebaseEvent('Icon_auth');
                        //   GoRouter.of(context).prepareAuthEvent();
                        //   await authManager.signOut();
                        //   GoRouter.of(context).clearRedirectLocation();
            
                        //   logFirebaseEvent('Icon_navigate_to');
            
                        //   context.goNamedAuth(LoginWidget.routeName, context.mounted);
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
              padding: EdgeInsetsDirectional.fromSTEB(
                  valueOrDefault<double>(
                    MediaQuery.sizeOf(context).width < 500.0 ? 12.0 : 150.0,
                    0.0,
                  ),
                  20.0,
                  valueOrDefault<double>(
                    MediaQuery.sizeOf(context).width < 500.0 ? 12.0 : 150.0,
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
                        color: Setting.panelColor,//, r, g, b) FlutterFlowTheme.of(context).primaryText,
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
                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 9.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Personal Information',
                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context).primaryText,
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            context.divider,
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
                                          color: FlutterFlowTheme.of(context).primaryText,
                                          fontSize: 14.0,
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
                                        color: FlutterFlowTheme.of(context).primaryText,
                                        fontSize: 14.0,
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
                                      color: FlutterFlowTheme.of(context).primaryText,
                                      fontSize: 14.0,
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
                                      color: FlutterFlowTheme.of(context).primaryText,
                                      fontSize: 14.0,
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
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                // Text(
                                //   'Password',
                                //   style: FlutterFlowTheme.of(context).bodyMedium.override(
                                //     font: GoogleFonts.inter(
                                //       fontWeight: FontWeight.w500,
                                //       fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                //     ),
                                //     color: FlutterFlowTheme.of(context).primaryText,
                                //     fontSize: 16.0,
                                //     letterSpacing: 0.0,
                                //     fontWeight: FontWeight.w500,
                                //     fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                //   ),
                                // ),
                                InkWell(
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
                                  child: Row(
                                    spacing: 9,
                                    children: [
                                      Text(
                                        'Reset Password',
                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                          font: GoogleFonts.inter(
                                            fontWeight: FontWeight.w500,
                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context).primaryText,
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                        ),
                                      ),
                                      Image.asset(
                                        'assets/images/reset2.png',
                                        height: 24.0,
                                      )
                                    ],
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
                    MediaQuery.sizeOf(context).width < 500.0 ? 12.0 : 150.0,
                    0.0,
                  ),
                  12.0,
                  valueOrDefault<double>(
                    MediaQuery.sizeOf(context).width < 500.0 ? 12.0 : 150.0,
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
                        color: Setting.panelColor,// FlutterFlowTheme.of(context).primaryText,
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
                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 9.0),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, -1.0),
                                    child: Text(
                                      'Subscription',
                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.w600,
                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context).primaryText,
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            context.divider,
                            // if ((((currentUserDocument?.expireDate != null) && (currentUserDocument!.expireDate! >= getCurrentTimestamp)) && (valueOrDefault(currentUserDocument?.membership, '') == '10')) ||
                            //     ((valueOrDefault(currentUserDocument?.membership, '') == '8') && ((currentUserDocument?.expireDate != null) && (currentUserDocument!.expireDate! >= getCurrentTimestamp))))
                            if ((int.tryParse(currentUserDocument?.membership ?? '0') ?? 0) >= 8)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                                child: AuthUserStreamWidget(
                                  builder: (context) => Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        valueOrDefault(currentUserDocument?.membership, '') == '8'
                                            ? 'Silver Program'
                                            : valueOrDefault(currentUserDocument?.membership, '') == '9'
                                                ? 'Advanced Program'
                                                : valueOrDefault(currentUserDocument?.membership, '') == '10'
                                                    ? 'Gold Program'
                                                    : '',
                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.bold,
                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                              ),
                                              color: FlutterFlowTheme.of(context).primaryText,
                                              fontSize: 16.0,
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
                              Container(
                                width: double.infinity,
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent('HOME_RENEW_MY_SUBSCRIPTION_BTN_ON_TAP');
                                    if ((int.tryParse(currentUserDocument?.membership ?? '0') ?? 0) >= 8) {
                                      context.showAsModal(UpgradeMembershipUI(widget.model));
                                      return;
                                    }
                                    else{
                                      await widget.model.pageViewController?.animateToPage(
                                        2,
                                        duration: Duration(milliseconds: 500),
                                        curve: Curves.ease,
                                      );
                                      return;
                                    }
                                    // if (valueOrDefault(currentUserDocument?.membership, '') == '8') {
                                    //   if (currentUserDocument!.expireDate! < getCurrentTimestamp) {
                                    //     logFirebaseEvent('Button_show_snack_bar');
                                    //     ScaffoldMessenger.of(context).showSnackBar(
                                    //       SnackBar(
                                    //         content: Text(
                                    //           'Please use the same email address as your account for subscription payment',
                                    //           style: TextStyle(color: FlutterFlowTheme.of(context).primaryText),
                                    //         ),
                                    //         duration: Duration(milliseconds: 4000),
                                    //         backgroundColor: FlutterFlowTheme.of(context).secondary,
                                    //       ),
                                    //     );
                                    //     logFirebaseEvent('Button_backend_call');
            
                                    //     await currentUserReference!.update(createUsersRecordData(
                                    //       membership: '1',
                                    //     ));
                                    //     logFirebaseEvent('Button_page_view');
                                    //     await widget.model.pageViewController?.animateToPage(
                                    //       2,
                                    //       duration: Duration(milliseconds: 500),
                                    //       curve: Curves.ease,
                                    //     );
                                    //     // if (_shouldSetState) safeSetState(() {});
                                    //     return;
                                    //   }
                                    //   logFirebaseEvent('Button_firestore_query');
                                    //   widget.model.settingsResponse = await querySettingsRecordOnce(
                                    //     singleRecord: true,
                                    //   ).then((s) => s.firstOrNull);
                                    //   _shouldSetState = true;
                                    //   if (widget.model.settingsResponse!.approve) {
                                    //     logFirebaseEvent('Button_backend_call');
                                    //     widget.model.apiResultd8s = await CreateCheckoutSessionCall.call(
                                    //       priceId: 'price_1OgVtOCf4YXq1rsy99bw9IHr',
                                    //       customerEmail: currentUserEmail,
                                    //       platform: 'mobile',
                                    //     );
            
                                    //     _shouldSetState = true;
                                    //     if ((widget.model.apiResultd8s?.succeeded ?? true)) {
                                    //       logFirebaseEvent('Button_launch_u_r_l');
                                    //       await launchURL(getJsonField(
                                    //         (widget.model.apiResultd8s?.jsonBody ?? ''),
                                    //         r'''$.redirectUrl''',
                                    //       ).toString());
                                    //     }
                                    //   } else {
                                    //     logFirebaseEvent('Button_revenue_cat');
                                    //     widget.model.didPurchaseUpgrade = await revenue_cat.purchasePackage(revenue_cat.offerings!.current!.getPackage('bspconsult_upgrade_gold_masterclass')!.identifier);
                                    //     _shouldSetState = true;
                                    //     if (widget.model.didPurchaseUpgrade!) {
                                    //       logFirebaseEvent('Button_backend_call');
            
                                    //       await currentUserReference!.update(createUsersRecordData(
                                    //         membership: '10',
                                    //         expireDate: functions.getNextYearDate(getCurrentTimestamp),
                                    //       ));
                                    //     }
                                    //   }
                                    // } else {
                                    //   logFirebaseEvent('Button_page_view');
                                    //   await widget.model.pageViewController?.animateToPage(
                                    //     2,
                                    //     duration: Duration(milliseconds: 500),
                                    //     curve: Curves.ease,
                                    //   );
                                    // }
            
                                    // if (_shouldSetState) safeSetState(() {});
                                  },
                                  text: (int.tryParse(currentUserDocument?.membership ?? '0') ?? 0) < 8
                                    ? 'Choose Membership'
                                    : 'Upgrade Membership',
                                    // : (int.tryParse(currentUserDocument?.membership ?? '0') ?? 0) == 9
                                    //   ? 'Upgrade to Gold'
                                    //   : 'Upgrade to Gold Masterclass', //(valueOrDefault(currentUserDocument?.membership, '') == '8') && ((currentUserDocument?.expireDate != null) && (currentUserDocument!.expireDate! >= getCurrentTimestamp)) ? 'Upgrade to Gold Masterclass' : 'Choose my subscription',
                                  options: context.buttonOptions,
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
            Container(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).width < 500.0 ? 0 : 50),
              child: widget.riskManagment
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                  valueOrDefault<double>(
                    MediaQuery.sizeOf(context).width < 500.0 ? 12.0 : 150.0,
                    0.0,
                  ),
                  12.0,
                  valueOrDefault<double>(
                    MediaQuery.sizeOf(context).width < 500.0 ? 12.0 : 150.0,
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
                        color: Setting.panelColor,
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
                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 9.0),
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
                                          color: FlutterFlowTheme.of(context).primaryText,
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            context.divider,
                            Container(
                              padding: EdgeInsets.all(6),
                              margin: EdgeInsets.symmetric(horizontal: 9),
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(33, 37, 50, 1),
                                borderRadius: BorderRadius.circular(6)
                              ),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent('HOME_PAGE_Row_ksq6k8v6_ON_TAP');
                                  logFirebaseEvent('Row_launch_u_r_l');
                                  await launchURL('https://www.bspconsult.app/bspmodels');
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                      child: Image.asset('assets/images/logo_blue.png'),
                                    ),
                                    Text(
                                      'Strategy Models',
                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.w500,
                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context).primaryText,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                            lineHeight: 1.0,
                                          ),
                                    ),
                                    Spacer(),
                                    Image.asset('assets/images/reset2.png'),
                                    SizedBox(width: 6)
                                  ],
                                ),
                              ),
                            ),
                            // SizedBox(height: 12),
                            // Container(
                            //   padding: EdgeInsets.all(6),
                            //   margin: EdgeInsets.symmetric(horizontal: 9),
                            //   decoration: BoxDecoration(
                            //     color: Color.fromRGBO(33, 37, 50, 1),
                            //     borderRadius: BorderRadius.circular(6)
                            //   ),
                            //   child: InkWell(
                            //     splashColor: Colors.transparent,
                            //     focusColor: Colors.transparent,
                            //     hoverColor: Colors.transparent,
                            //     highlightColor: Colors.transparent,
                            //     onTap: () async {
                            //       logFirebaseEvent('HOME_PAGE_Row_by92kxnw_ON_TAP');
                            //       logFirebaseEvent('Row_launch_u_r_l');
                            //       await launchURL('https://www.bspconsult.app/bspsystem');
                            //     },
                            //     child: Row(
                            //       mainAxisSize: MainAxisSize.max,
                            //       children: [
                            //         Container(
                            //           padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            //           child: Image.asset('assets/images/logo_gold.png'),
                            //         ),
                            //         Text(
                            //           'Strategy Masterclass',
                            //           style: FlutterFlowTheme.of(context).bodyMedium.override(
                            //                 font: GoogleFonts.inter(
                            //                   fontWeight: FontWeight.w500,
                            //                   fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                            //                 ),
                            //                 color: FlutterFlowTheme.of(context).primaryText,
                            //                 fontSize: 14.0,
                            //                 letterSpacing: 0.0,
                            //                 fontWeight: FontWeight.w500,
                            //                 fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                            //                 lineHeight: 1.0,
                            //               ),
                            //         ),
                            //         Spacer(),
                            //         Image.asset('assets/images/reset2.png'),
                            //         SizedBox(width: 6)
                            //       ],
                            //     ),
                            //   ),
                            // ),
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
                    MediaQuery.sizeOf(context).width < 500.0 ? 12.0 : 150.0,
                    0.0,
                  ),
                  12.0,
                  valueOrDefault<double>(
                    MediaQuery.sizeOf(context).width < 500.0 ? 12.0 : 150.0,
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
                        color: Setting.panelColor,
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
                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 9.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Contact us',
                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                          font: GoogleFonts.inter(fontWeight: FontWeight.w600, fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle),
                                          color: FlutterFlowTheme.of(context).primaryText,
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            context.divider,
                            Row(
                              spacing: 12,
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(33, 37, 50, 1),
                                      borderRadius: BorderRadius.circular(12)
                                    ),
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
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        spacing: 6,
                                        children: [
                                          Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                            child: SvgPicture.asset(
                                              'assets/images/insta.svg',
                                              width: 24.0,
                                              height: 24.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Text(
                                            'Instagram',
                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                              font: GoogleFonts.inter(fontWeight: FontWeight.w500, fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle),
                                              color: FlutterFlowTheme.of(context).primaryText,
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
                                  child: Container(
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(33, 37, 50, 1),
                                      borderRadius: BorderRadius.circular(12)
                                    ),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent('HOME_PAGE_Row_l2skxv1m_ON_TAP');
                                        logFirebaseEvent('Row_launch_u_r_l');
                                        await launchURL('https://snapchat.com/t/SClUoxVp');
                                      },
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        spacing: 6,
                                        children: [
                                          Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                            child: SvgPicture.asset(
                                              'assets/images/snap.svg',
                                              width: 24.0,
                                              height: 24.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Text(
                                            'Snapchat',
                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                              font: GoogleFonts.inter(fontWeight: FontWeight.w500, fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle),
                                              color: FlutterFlowTheme.of(context).primaryText,
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
                              ]
                            )
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
                    MediaQuery.sizeOf(context).width < 500.0 ? 12.0 : 150.0,
                    0.0,
                  ),
                  12.0,
                  valueOrDefault<double>(
                    MediaQuery.sizeOf(context).width < 500.0 ? 12.0 : 150.0,
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
                        color: Setting.panelColor,
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
                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 9.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Account Settings',
                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context).primaryText,
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            context.divider,
                            Container(
                              padding: EdgeInsets.all(9),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Color.fromRGBO(33, 37, 50, 1)
                              ),
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
                                      child: Image.asset(
                                        'assets/images/setting.png',
                                        color: FlutterFlowTheme.of(context).secondaryText,
                                        height: 28.0,
                                      ),
                                    ),
                                    Text(
                                      'Terms of Service',
                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context).primaryText,
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
                            SizedBox(height: 12),
                            Container(
                              padding: EdgeInsets.all(9),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Color.fromRGBO(33, 37, 50, 1)
                              ),
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
                                      child: Image.asset(
                                        'assets/images/note.png',
                                        color: FlutterFlowTheme.of(context).secondaryText,
                                        height: 28.0,
                                      ),
                                    ),
                                    Text(
                                      'Privacy Policy',
                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context).primaryText,
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
                            SizedBox(height: 22),
                            Container(
                              width: double.infinity,
                              child: FFButtonWidget(
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
                                options: context.redbuttonOptions,
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
    );
  }
}