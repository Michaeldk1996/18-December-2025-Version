import 'package:b_s_p_consult/pages/home/upgrade_membership.dart';
import 'package:b_s_p_consult/widgets/consts.dart';
import 'package:flutter/cupertino.dart';

import '../../auth/firebase_auth/app_version_service.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/action_selector/action_selector_widget.dart';
import '/components/tip_item/tip_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'force_update_screen.dart';
import 'home_model.dart';
import 'profile_screen.dart';
import 'subscriptions.dart';
export 'home_model.dart';

bool askStg = false;
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

  Widget askBankroll(int bankrol){
    return Container(
      padding: EdgeInsets.all(12),
      constraints: BoxConstraints(
        maxWidth: 600
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(16, 17, 23, 1),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
        ),
        child: Container(
          padding: EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 2.0, 2.0),
          decoration: BoxDecoration(
            color: Color.fromRGBO(16, 17, 23, 1),// hint ? null : FlutterFlowTheme.of(context).primaryText,
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: Color(0x14EFF0F6),
              width: 1.0,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 19),
              Image.asset('assets/images/bankroll.png'),
              SizedBox(height: 22),
              Text(
                'Bankroll',
                style: TextStyle(
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700
                ),
              ),
              SizedBox(height: 12),
              Text(
                'Enter your total bankroll. This will be used to',
                style: TextStyle(
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 14.0,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                'create your personalized staking plan.',
                style: TextStyle(
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 14.0,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 36),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: TextFormField(
                  initialValue: '$bankrol',
                  decoration: context.textfieldDecoration('Enter Bankroll'),
                  style: context.textFieldStyle,
                  onChanged: (val)=>bankrol = int.tryParse(val) ?? 0,
                ),
              ),
              SizedBox(height: 43),
              Divider(height: 1, color: FlutterFlowTheme.of(context).primaryText.withValues(alpha: .25)),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 22),
                color: Color.fromRGBO(255, 255, 255, 0.02),
                child: Row(
                  spacing: 9,
                  children: [
                    Expanded(
                      child: FFButtonWidget(
                        text: 'Cancel', 
                        onPressed: ()=>context.pop(), 
                        options: context.greybuttonOptions()
                      ),
                    ),
                    Expanded(
                      child: FFButtonWidget(
                        text: 'Confirm', 
                        onPressed: (){
                          context.pop(bankrol);
                        },
                        options: context.buttonOptions
                      ),
                    ),
                  ],
                ),
              ),
            ]
          )
        )
      )
    );
  }
  
  Widget askStrategy(String strategy){
    final stg = ValueNotifier<String>(strategy);
    
    return ValueListenableBuilder(
      valueListenable: stg,
      builder: (context, stgValue, child) {
        return Container(
          padding: EdgeInsets.all(12),
          constraints: BoxConstraints(
            maxWidth: 600
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(16, 17, 23, 1),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
            ),
            child: Container(
              padding: EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 2.0, 2.0),
              decoration: BoxDecoration(
                color: Color.fromRGBO(16, 17, 23, 1),// hint ? null : FlutterFlowTheme.of(context).primaryText,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: Color(0x14EFF0F6),
                  width: 1.0,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 19),
                  Image.asset('assets/images/strategy.png'),
                  SizedBox(height: 22),
                  Text(
                    'Staking System',
                    style: TextStyle(
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                  SizedBox(height: 12),
                  Container(
                    child: Text(
                      'Choose your staking system',
                      style: TextStyle(
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontSize: 14.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    child: Text(
                      'to define your risk level.',
                      style: TextStyle(
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontSize: 14.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 36),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Conservative',
                          style: TextStyle(
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700
                          ),
                        ),
                        CupertinoSwitch(
                          value: stgValue == 'Conservative', 
                          onChanged: (val)=>stg.value = 'Conservative',
                          activeTrackColor: Colors.blue,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Balanced',
                          style: TextStyle(
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700
                          ),
                        ),
                        CupertinoSwitch(
                          value: stgValue == 'Balanced', 
                          onChanged: (val)=>stg.value = 'Balanced',
                          activeTrackColor: Colors.blue,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Aggressive',
                          style: TextStyle(
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700
                          ),
                        ),
                        CupertinoSwitch(
                          value: stgValue == 'Aggressive', 
                          onChanged: (val)=>stg.value = 'Aggressive',
                          activeTrackColor: Colors.blue,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 43),
                  Divider(height: 1, color: FlutterFlowTheme.of(context).primaryText.withValues(alpha: .25)),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 22),
                    color: Color.fromRGBO(255, 255, 255, 0.02),
                    child: Row(
                      spacing: 9,
                      children: [
                        Expanded(
                          child: FFButtonWidget(
                            text: 'Cancel', 
                            onPressed: ()=>context.pop(), 
                            options: context.greybuttonOptions()
                          ),
                        ),
                        Expanded(
                          child: FFButtonWidget(
                            text: 'Confirm', 
                            onPressed: (){
                              context.pop(stgValue);
                            },
                            options: context.buttonOptions
                          ),
                        ),
                      ],
                    ),
                  ),
                ]
              )
            )
          )
        );
      }
    );
  }

  Widget riskManagmentDialog(){
    int bankrol = int.tryParse(currentUserDocument?.bankroll ?? '0') ?? 0;
    String strategy = currentUserDocument?.stakingStrategy ?? '';
    final refresher = ValueNotifier<int>(1);

    return Container(
      padding: EdgeInsets.all(12),
      constraints: BoxConstraints(
        maxWidth: 600
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(16, 17, 23, 1),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
        ),
        child: ValueListenableBuilder(
          valueListenable: refresher,
          builder: (context, value, _) => Container(
            padding: EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 2.0, 2.0),
            decoration: BoxDecoration(
              color: Color.fromRGBO(16, 17, 23, 1),// hint ? null : FlutterFlowTheme.of(context).primaryText,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: Color(0x14EFF0F6),
                width: 1.0,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 19),
                Image.asset('assets/images/risk1.png'),
                SizedBox(height: 22),
                Text(
                  'Build your staking plan',
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w700
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'Add your bankroll and select a staking',
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontSize: 14.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'system to continue.',
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontSize: 14.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 36),
                GestureDetector(
                  onTap: ()async{
                    final res = await context.showAsModal(askBankroll(bankrol));
                    if (res is int) bankrol = res;
                    refresher.value++;
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Row(
                      spacing: 6,
                      children: [
                        SizedBox(width: 12),
                        Text(
                          'Bankroll',
                          style: TextStyle(
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 16.0,
                          ),
                        ),
                        Spacer(),
                        Text(
                          '$bankrol',
                          style: TextStyle(
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 16.0,
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios_rounded, size: 18, color: FlutterFlowTheme.of(context).primaryText)
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30),
                GestureDetector(
                  onTap: ()async{
                    final res = await context.showAsModal(askStrategy(strategy));
                    if (res is String) strategy = res;
                    refresher.value++;
                  },
                  child: Container(
                    color: Colors.transparent,
                    child:  Row(
                        spacing: 6,
                        children: [
                          SizedBox(width: 12),
                          Text(
                            'Staking Strategy',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 16.0,
                            ),
                          ),
                          Spacer(),
                          Text(
                            '$strategy',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 16.0,
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios_rounded, size: 18, color: FlutterFlowTheme.of(context).primaryText)
                        ],
                      ),
                  )
                ),
                SizedBox(height: 43),
                Divider(height: 1, color: FlutterFlowTheme.of(context).primaryText.withValues(alpha: .25)),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 22),
                  color: Color.fromRGBO(255, 255, 255, 0.02),
                  child: Row(
                    spacing: 9,
                    children: [
                      Expanded(
                        child: FFButtonWidget(
                          text: 'Cancel', 
                          onPressed: ()=>context.pop(), 
                          options: context.greybuttonOptions()
                        ),
                      ),
                      Expanded(
                        child: FFButtonWidget(
                          text: 'Done', 
                          onPressed: ()async{
                            safeSetState((){
                              _model.stakingStrategy = strategy;
                              _model.bankrollResult = '$bankrol';
                            });
                            logFirebaseEvent('Container_backend_call');
                            await currentUserReference!.update(createUsersRecordData(
                              stakingStrategy: _model.stakingStrategy,
                              bankroll: _model.bankrollResult
                            ));
                            context.pop();
                          },
                          options: context.buttonOptions
                        ),
                      ),
                    ],
                  ),
                ),
              ]
            )
          )
        )
      )
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
              color: Setting.panelColor,// hint ? null : FlutterFlowTheme.of(context).primaryText,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: Color(0x14EFF0F6),
                width: 1.0,
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: 12),
                Container(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 9.0),
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
                        color: hint ? FlutterFlowTheme.of(context).primaryText : FlutterFlowTheme.of(context).primaryText,
                        fontSize: 18.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                    ),
                  ),
                ),
                context.divider,
                if (hint)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center, 
                    children: [
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
                            color: hint ? FlutterFlowTheme.of(context).primaryText : FlutterFlowTheme.of(context).primaryText,
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
                            color: hint ? FlutterFlowTheme.of(context).primaryText : FlutterFlowTheme.of(context).primaryText,
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                          ),
                        ),
                      ),
                      SizedBox(height: 35),
                    ]
                  ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent('HOME_PAGE_Container_f28twcc9_ON_TAP');
                    logFirebaseEvent('Container_alert_dialog');
                    final res = await context.showAsModal(askBankroll(int.tryParse(currentUserDocument?.bankroll ?? '0') ?? 0));
                    if (res is int){
                      safeSetState(() => _model.bankrollResult = '$res');
                      logFirebaseEvent('Container_backend_call');
                      await currentUserReference!.update(createUsersRecordData(
                        bankroll: _model.bankrollResult,
                      ));

                      safeSetState(() {});
                    }
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
                                      color: hint ? FlutterFlowTheme.of(context).primaryText : FlutterFlowTheme.of(context).primaryText,
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
                                        color: hint ? FlutterFlowTheme.of(context).primaryText : FlutterFlowTheme.of(context).primaryText,
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
                                  color: hint ? FlutterFlowTheme.of(context).primaryText : FlutterFlowTheme.of(context).primaryText,
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
                                    color: hint ? FlutterFlowTheme.of(context).primaryText : FlutterFlowTheme.of(context).primaryText,
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
                    options: context.buttonOptions,
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

  Widget accessDenied(bool insight) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        color: Color.fromRGBO(255, 255, 255, 0.05)
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 6,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: SvgPicture.asset('assets/images/lock.svg')
          ),
          SizedBox(height: 9),
          Text(insight ? 'Insights Locked' : 'Premium Content Locked',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
              font: GoogleFonts.inter(fontWeight: FontWeight.w500, fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle),
              color: FlutterFlowTheme.of(context).primaryText,
              fontSize: 18.0,
              letterSpacing: 0.0,
              fontWeight: FontWeight.w500,
              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle
            )
          ),
          Text('One click away from full access',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
              font: GoogleFonts.inter(fontWeight: FontWeight.w500, fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle),
              color: FlutterFlowTheme.of(context).primaryText,
              fontSize: 12.0,
              letterSpacing: 0.0,
              fontWeight: FontWeight.w500,
              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle
            )
          ),
          SizedBox(height: 9),
          FFButtonWidget(
            onPressed: () async {
              logFirebaseEvent('HOME_CHOOSE_YOUR_MEMBERSHIP_BTN_ON_TAP');
              logFirebaseEvent('Button_page_view');
              if (insight){
                context.showAsModal(UpgradeMembershipUI(_model));
              }
              else{
                await _model.pageViewController?.animateToPage(
                  2,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
                logFirebaseEvent('Button_update_page_state');
                _model.pageNumber = 2;
                safeSetState(() {});
              }
            },
            text: insight ? 'Upgrade now' : 'View Programs',
            // text: (int.tryParse('${currentUserDocument?.membership ?? '0'}') ?? 0) < 8
            //   ? 'Choose your membership'
            //   : 'Upgrade Membership',
            options: FFButtonOptions(
              height: 40.0,
              padding: EdgeInsetsDirectional.fromSTEB(40.0, 0.0, 40.0, 0.0),
              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: Color(0x33348AF7),
              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                  font: GoogleFonts.inter(
                    fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                    fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                  ),
                  fontSize: 14,
                  color: Colors.white,
                  letterSpacing: 0.0,
                  fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle),
              elevation: 3.0,
              borderSide: BorderSide(
                color: Color(0xFF348AF7),
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
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
      decoration: BoxDecoration(
      ),
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

  Widget logOutDialog(){
    return Container(
      constraints: BoxConstraints(
        maxWidth: 600
      ),
      decoration: BoxDecoration(
        color: Color.fromRGBO(16, 17, 23, 1),
        borderRadius: BorderRadius.circular(16)
      ),
      margin: EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 22),
          Image.asset('assets/images/logout.png'),
          SizedBox(height: 22),
          Text('Logout',
            style: TextStyle(color: FlutterFlowTheme.of(context).primaryText, fontSize: 18),
          ),
          SizedBox(height: 12),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 22),
            child: Text('Are you sure you want to log out',
            textAlign: TextAlign.center,style: TextStyle(color: FlutterFlowTheme.of(context).primaryText, fontSize: 14),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 22),
            child: Text('of your account?',
            textAlign: TextAlign.center,style: TextStyle(color: FlutterFlowTheme.of(context).primaryText, fontSize: 14),
            ),
          ),
          SizedBox(height: 22),
          Divider(color: Colors.white12, height: 1),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 22),
            color: Color.fromRGBO(255, 255, 255, 0.02),
            child: Row(
              spacing: 9,
              children: [
                Expanded(
                  child: FFButtonWidget(
                    text: 'Cancel', 
                    onPressed: ()=>context.pop(), 
                    options: context.greybuttonOptions()
                  ),
                ),
                Expanded(
                  child: FFButtonWidget(
                    text: 'Logout', 
                    onPressed: ()=>context.pop(true), 
                    options: context.redbuttonOptionsWhiteText
                  ),
                ),
              ],
            ),
          )          
        ],
      ),
    );
  }

  void checkAppVersion() async {
    final updateResult = await AppVersionService.checkUpdate();
    if (updateResult.force && updateResult.needUpdate){
      context.showAsModal(ForceUpdateScreen(updateResult), dismissible: false);
    }
  }

  void askStakingStrategy()async{
    if (askStg || !mounted) return;
    askStg = true;
    await Future.delayed(Duration(milliseconds: 900));

    if ((currentUserDocument?.stakingStrategy.isEmpty ?? true) || (valueOrDefault(currentUserDocument?.bankroll, '') == '')) {
      if (mounted) context.showAsModal(riskManagmentDialog());
    }
    // showModalBottomSheet(
    //   isScrollControlled: false, 
    //   backgroundColor: FlutterFlowTheme.of(context).secondaryBackground, 
    //   enableDrag: false, 
    //   context: context, 
    //   builder: (context) => Container(
    //     color: FlutterFlowTheme.of(context).secondaryBackground, 
    //     child: riskManagment(hint: true)
    //   )
    // );
  }

  void logOut()async{
    final res = await context.showAsModal(logOutDialog());
    if (res is bool && res){
      logFirebaseEvent('HOME_PAGE_Icon_h3pxq1c5_ON_TAP');
      logFirebaseEvent('Icon_navigate_to');
      await authManager.signOut();
      context.goNamed(LoginWidget.routeName);
    }
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Home'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('HOME_PAGE_Home_ON_INIT_STATE');

      // if (valueOrDefault(currentUserDocument?.bankroll, '') == '') {
      //   logFirebaseEvent('Home_backend_call');

      //   await currentUserReference!.update(createUsersRecordData(
      //     bankroll: '0',
      //   ));
      // }
      logFirebaseEvent('Home_firestore_query');
      _model.userList = await queryUsersRecordOnce();
      logFirebaseEvent('Home_update_app_state');
      FFAppState().allUsers = _model.userList!.map((e) => e.reference).toList().toList().cast<DocumentReference>();
      checkAppVersion();
      safeSetState(() {});
    });
  }

  @override
  void dispose() {
    askStg = false;
    _model.dispose();

    super.dispose();
  }

  void changeStakingStrategy() async {
    logFirebaseEvent('HOME_PAGE_Container_f28twcc9_ON_TAP');
    logFirebaseEvent('Container_alert_dialog');
    // await showAlignedDialog(
    //   context: context,
    //   isGlobal: false,
    //   avoidOverflow: false,
    //   builder: (dialogContext) {
    //     return Material(
    //       color: Colors.transparent,
    //       child: GestureDetector(
    //         onTap: () {
    //           FocusScope.of(dialogContext).unfocus();
    //           FocusManager.instance.primaryFocus?.unfocus();
    //         },
    //         child: ChangeStakingStrategylWidget(currentUserDocument?.stakingStrategy),
    //       ),
    //     );
    //   },
    // ).then((value) => safeSetState(() {
    //       if (value is String && value.isNotEmpty) {
    //         _model.stakingStrategy = value;
    //       }
    //     }));

    final res = await context.showAsModal(askStrategy(currentUserDocument?.stakingStrategy ?? ''));
    if (res is String){
      safeSetState(() => _model.stakingStrategy = '$res');
      logFirebaseEvent('Container_STakingStrategy_call');
      await currentUserReference!.update(createUsersRecordData(stakingStrategy: _model.stakingStrategy));
      safeSetState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    if ((currentUserDocument?.stakingStrategy.isEmpty ?? true) || (valueOrDefault(currentUserDocument?.bankroll, '') == '')) {
      askStakingStrategy();
    }

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Image.asset('assets/images/bluecircle.png')
              ),
              // ClipRRect(
              //   borderRadius: BorderRadius.circular(8.0),
              //   child: Image.asset(
              //     'assets/images/home_bg.png',
              //     width: MediaQuery.of(context).size.width,
              //     height: MediaQuery.of(context).size.height,
              //     fit: BoxFit.cover,
              //   ),
              // ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, MediaQuery.of(context).padding.top, 0.0, 55.0),
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
                        ProfileScreen(_model, riskManagment(), logOut),
                        Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(),
                          child: Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              // color: FlutterFlowTheme.of(context).secondaryBackground,
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
                                        alignment: Alignment.topCenter,
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                'assets/images/Logo.png',
                                                width: 30.0,
                                                height: 30.8,
                                                fit: BoxFit.cover,
                                              ),
                                              SizedBox(width: 9),
                                              Text(
                                                'BSP ',
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
                                              Text(
                                                'Consult'.toUpperCase(),
                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                  font: GoogleFonts.figtree(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                  ),
                                                  color: Colors.white,
                                                  fontSize: 20.0,
                                                  letterSpacing: 0.0,
                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      // Align(
                                      //   alignment: AlignmentDirectional(0.0, 0.0),
                                      //   child: Text(
                                      //     'BSP Consult',
                                      //     style: FlutterFlowTheme.of(context).bodyMedium.override(
                                      //       font: GoogleFonts.inter(
                                      //         fontWeight: FontWeight.w500,
                                      //         fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                      //       ),
                                      //       color: Colors.white,
                                      //       fontSize: 22.0,
                                      //       letterSpacing: 0.0,
                                      //       fontWeight: FontWeight.w500,
                                      //       fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                      //     ),
                                      //   ),
                                      // ),
                                      Align(
                                        alignment: AlignmentDirectional(1.0, 0.0),
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 24.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: logOut,
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
                                Text(
                                  'BSP Consult - We build high-level bettors',
                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                    ),
                                    color: Colors.white,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  ),
                                ),
                                SizedBox(height: 22),
                                Container(
                                  constraints: BoxConstraints(
                                    maxWidth: 600
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    spacing: 12,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  logFirebaseEvent('HOME_PAGE_Column_afftpejl_ON_TAP');
                                                  logFirebaseEvent('Column_update_page_state');
                                                  _model.tipMode = 1;
                                                  safeSetState(() {});
                                                },
                                                text: 'Insights',
                                                options: FFButtonOptions(
                                                  width: double.infinity,
                                                  height: 40.0,
                                                  padding: EdgeInsetsDirectional.fromSTEB(57.0, 0.0, 57.0, 0.0),
                                                  iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                  color: _model.tipMode == 1
                                                    ? Color(0x33348AF7)
                                                    : Color(0x1AFFFFFF),
                                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                    font: GoogleFonts.figtree(
                                                      fontWeight: FontWeight .normal,
                                                      fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                    ),
                                                    color: Colors.white,
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.normal,
                                                    fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                  ),
                                                  elevation: 0.0,
                                                  borderSide: BorderSide(
                                                    color: _model.tipMode == 1
                                                      ? Color(0xFF348AF7)
                                                      : Color(0x32FFFFFF),
                                                  ),
                                                  borderRadius: BorderRadius.circular(8.0),
                                                ),
                                              ),
                                            ),
                                            // if (_model.tipMode == 1)
                                            //   Divider(
                                            //     thickness: 2.0,
                                            //     color: Colors.white,
                                            //   ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  logFirebaseEvent('HOME_PAGE_Column_afftpejl_ON_TAP');
                                                  logFirebaseEvent('Column_update_page_state');
                                                  _model.tipMode = 2;
                                                  safeSetState(() {});
                                                },
                                                text: 'Bets',
                                                options: FFButtonOptions(
                                                  width: double.infinity,
                                                  height: 40.0,
                                                  padding: EdgeInsetsDirectional.fromSTEB(57.0, 0.0, 57.0, 0.0),
                                                  iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                  color: _model.tipMode == 2
                                                    ? Color(0x33348AF7)
                                                    : Color(0x1AFFFFFF),
                                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                    font: GoogleFonts.figtree(
                                                      fontWeight: FontWeight .normal,
                                                      fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                    ),
                                                    color: Colors.white,
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.normal,
                                                    fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                  ),
                                                  elevation: 0.0,
                                                  borderSide: BorderSide(
                                                    color: _model.tipMode == 2
                                                      ? Color(0xFF348AF7)
                                                      : Color(0x32FFFFFF),
                                                  ),
                                                  borderRadius: BorderRadius.circular(8.0),
                                                ),
                                              ),
                                            ),
                                            // if (_model.tipMode == 2)
                                            //   Divider(
                                            //     thickness: 2.0,
                                            //     color: Colors.white,
                                            //   ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
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
                                            accessDenied(true)
                                          else 
                                            communicationItems('Exp_Insights'),
                                        if (_model.tipMode == 2) 
                                          if ((int.tryParse('${currentUserDocument?.membership ?? '0'}') ?? 0) < 8 || 
                                              (int.tryParse('${currentUserDocument?.membership ?? '0'}') ?? 0) > 10 || 
                                              (currentUserDocument?.expireDate == null) || 
                                              (currentUserDocument!.expireDate! < getCurrentTimestamp)
                                          ) 
                                            accessDenied(false)
                                          else 
                                            communicationItems('Bets'),
                                        Align(
                                          alignment: AlignmentDirectional(1.0, 1.0),
                                          child: Container(
                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                if (_model.floatingAction)
                                                  Container(
                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize: MainAxisSize.max,
                                                      children: [
                                                        Container(
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
                                                                  width: 50.0,
                                                                  height: 50.0,
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
                                                                    child: Image.asset('assets/images/addnotif.png'),
                                                                    // child: Icon(
                                                                    //   Icons.mail_rounded,
                                                                    //   color: Colors.white,
                                                                    //   size: 24.0,
                                                                    // ),
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
                                                                    width: 50.0,
                                                                    height: 50.0,
                                                                    decoration: BoxDecoration(
                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                      shape: BoxShape.circle,
                                                                    ),
                                                                    child: Align(
                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                      child: Image.asset('assets/images/addmessage.png'),
                                                                      // child: FaIcon(
                                                                      //   FontAwesomeIcons.solidComment,
                                                                      //   color: Colors.white,
                                                                      //   size: 24.0,
                                                                      // ),
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
                                                                    width: 50.0,
                                                                    height: 50.0,
                                                                    decoration: BoxDecoration(
                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                      shape: BoxShape.circle,
                                                                    ),
                                                                    child: Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                      child: Image.asset('assets/images/addtip.png'),
                                                                      // child: Icon(
                                                                      //   Icons.bar_chart,
                                                                      //   color: Colors.white,
                                                                      //   size: 24.0,
                                                                      // ),
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
                        Subscriptions(_model, logOut),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Container(
                  height: 85.0,
                  // color: Color(0xFF171B26),
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 80.0,
                        decoration: BoxDecoration(
                          color: Color(0xFF171B26),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(24.0),
                            topRight: Radius.circular(24.0),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'HOME_PAGE_Column_0zqfbywe_ON_TAP');
                                  logFirebaseEvent('Column_page_view');
                                  await _model.pageViewController
                                      ?.animateToPage(
                                    0,
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.ease,
                                  );
                                  logFirebaseEvent(
                                      'Column_update_page_state');
                                  _model.pageNumber = 0;
                                  safeSetState(() {});
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Builder(
                                      builder: (context) {
                                        if (_model.pageNumber == 0) {
                                          return ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.asset(
                                              'assets/images/person1.png',
                                              width: 18.0,
                                              height: 19.0,
                                              fit: BoxFit.cover,
                                            ),
                                          );
                                        } else {
                                          return ClipRRect(
                                            borderRadius: BorderRadius.circular(8.0),
                                            child: Image.asset(
                                              'assets/images/Person.png',
                                              width: 18.0,
                                              height: 19.0,
                                              fit: BoxFit.cover,
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                      child: Text(
                                        'Profile',
                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                          font: GoogleFonts.inter(
                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                          ),
                                          color: _model.pageViewCurrentIndex == 0
                                            ? Color(0xFF007AFF)
                                            : Color(0xFFB9BDC7),
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.person_outlined,
                                      color: Color(0xFFB8BCC7),
                                      size: 26.0,
                                    ),
                                    Text(
                                      'Setups',
                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                        ),
                                        color: _model.pageViewCurrentIndex == 1
                                          ? Color(0xFF007AFF)
                                          : Color(0xFFB9BDC7),
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent('HOME_PAGE_Column_9hu7coc3_ON_TAP');
                                  logFirebaseEvent('Column_page_view');
                                  await _model.pageViewController?.animateToPage(
                                    2,
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.ease,
                                  );
                                  logFirebaseEvent(
                                      'Column_update_page_state');
                                  _model.pageNumber = 2;
                                  safeSetState(() {});
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Builder(
                                      builder: (context) {
                                        if (_model.pageNumber == 2) {
                                          return ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.asset(
                                              'assets/images/Program.png',
                                              width: 18.0,
                                              height: 19.7,
                                              fit: BoxFit.cover,
                                            ),
                                          );
                                        } else {
                                          return ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.asset(
                                              'assets/images/programIcon.png',
                                              width: 18.0,
                                              height: 19.7,
                                              fit: BoxFit.cover,
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                      child: Text(
                                        'Programs',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight:
                                                    FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  _model.pageViewCurrentIndex ==
                                                          2
                                                      ? Color(0xFF007AFF)
                                                      : Color(0xFFB9BDC7),
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
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
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, -7.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'HOME_PAGE_Container_pqbmispo_ON_TAP');
                            logFirebaseEvent('Container_page_view');
                            await _model.pageViewController?.animateToPage(
                              1,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                            logFirebaseEvent('Container_update_page_state');
                            _model.pageNumber = 1;
                            safeSetState(() {});
                          },
                          child: Container(
                            width: 75.0,
                            height: 75.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              shape: BoxShape.circle,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Container(
                                width: 64.0,
                                height: 64.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFF007AFF),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Color(0xFF151C26),
                                    width: 4.0,
                                  ),
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Image.asset(
                                    'assets/images/Icon.png',
                                    width: 17.0,
                                    height: 20.0,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-0.33, -1.2),
                        child: Container(
                          width: 45.0,
                          height: 27.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).secondaryBackground,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(0.0),
                              topRight: Radius.circular(0.0),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-0.35, -1.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width <= 600 ? 50 : 85.0,
                          height: 25.0,
                          decoration: BoxDecoration(
                            color: Color(0xFF171B26),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(0.0),
                              topRight: Radius.circular(70.0),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.33, -1.2),
                        child: Container(
                          width: 45.0,
                          height: 27.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).secondaryBackground,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(0.0),
                              topRight: Radius.circular(0.0),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.35, -1.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width <= 600 ? 50 : 85.0,
                          height: 25.0,
                          decoration: BoxDecoration(
                            color: Color(0xFF171B26),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(70.0),
                              topRight: Radius.circular(0.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
              // Align(
              //   alignment: AlignmentDirectional(0.0, 1.0),
              //   child: Row(
              //     mainAxisSize: MainAxisSize.max,
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     children: [
              //       Expanded(
              //         child: Container(
              //           width: double.infinity,
              //           height: 100.0,
              //           decoration: BoxDecoration(
              //             color: Colors.transparent,
              //           ),
              //           child: Stack(
              //             children: [
              //               Column(
              //                 mainAxisSize: MainAxisSize.max,
              //                 mainAxisAlignment: MainAxisAlignment.end,
              //                 children: [
              //                   Material(
              //                     color: Colors.transparent,
              //                     elevation: 0.0,
              //                     shape: RoundedRectangleBorder(
              //                       borderRadius: BorderRadius.only(
              //                         bottomLeft: Radius.circular(0.0),
              //                         bottomRight: Radius.circular(0.0),
              //                         topLeft: Radius.circular(20.0),
              //                         topRight: Radius.circular(20.0),
              //                       ),
              //                     ),
              //                     child: Container(
              //                       width: double.infinity,
              //                       height: 60.0,
              //                       decoration: BoxDecoration(
              //                         color: Color(0xFF272A32),
              //                         borderRadius: BorderRadius.only(
              //                           bottomLeft: Radius.circular(0.0),
              //                           bottomRight: Radius.circular(0.0),
              //                           topLeft: Radius.circular(20.0),
              //                           topRight: Radius.circular(20.0),
              //                         ),
              //                       ),
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //               Row(
              //                 mainAxisSize: MainAxisSize.max,
              //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //                 crossAxisAlignment: CrossAxisAlignment.center,
              //                 children: [
              //                   Expanded(
              //                     child: Padding(
              //                       padding: EdgeInsetsDirectional.fromSTEB(0.0, 52.0, 0.0, 0.0),
              //                       child: InkWell(
              //                         splashColor: Colors.transparent,
              //                         focusColor: Colors.transparent,
              //                         hoverColor: Colors.transparent,
              //                         highlightColor: Colors.transparent,
              //                         onTap: () async {
              //                           logFirebaseEvent('HOME_PAGE_Column_4aemalkp_ON_TAP');
              //                           logFirebaseEvent('Column_update_page_state');
              //                           _model.pageNumber = 0;
              //                           safeSetState(() {});
              //                           logFirebaseEvent('Column_page_view');
              //                           await _model.pageViewController?.animateToPage(
              //                             0,
              //                             duration: Duration(milliseconds: 500),
              //                             curve: Curves.ease,
              //                           );
              //                         },
              //                         child: Column(
              //                           mainAxisSize: MainAxisSize.min,
              //                           mainAxisAlignment: MainAxisAlignment.center,
              //                           children: [
              //                             Padding(
              //                               padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
              //                               child: FaIcon(
              //                                 FontAwesomeIcons.user,
              //                                 color: _model.pageNumber == 0 ? FlutterFlowTheme.of(context).primaryText : Color(0xFF6C767E),
              //                                 size: 20.0,
              //                               ),
              //                             ),
              //                             Text(
              //                               'Profile',
              //                               style: FlutterFlowTheme.of(context).bodyMedium.override(
              //                                     font: GoogleFonts.inter(
              //                                       fontWeight: FontWeight.w500,
              //                                       fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
              //                                     ),
              //                                     color: _model.pageNumber == 0 ? FlutterFlowTheme.of(context).primaryText : FlutterFlowTheme.of(context).secondaryText,
              //                                     fontSize: 14.0,
              //                                     letterSpacing: 0.0,
              //                                     fontWeight: FontWeight.w500,
              //                                     fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
              //                                   ),
              //                             ),
              //                           ],
              //                         ),
              //                       ),
              //                     ),
              //                   ),
              //                   Expanded(
              //                     child: InkWell(
              //                       splashColor: Colors.transparent,
              //                       focusColor: Colors.transparent,
              //                       hoverColor: Colors.transparent,
              //                       highlightColor: Colors.transparent,
              //                       onTap: () async {
              //                         logFirebaseEvent('HOME_PAGE_Column_8qzq1p1f_ON_TAP');
              //                         logFirebaseEvent('Column_update_page_state');
              //                         _model.pageNumber = 1;
              //                         safeSetState(() {});
              //                         logFirebaseEvent('Column_page_view');
              //                         await _model.pageViewController?.animateToPage(
              //                           1,
              //                           duration: Duration(milliseconds: 500),
              //                           curve: Curves.ease,
              //                         );
              //                       },
              //                       child: Column(
              //                         mainAxisSize: MainAxisSize.min,
              //                         mainAxisAlignment: MainAxisAlignment.start,
              //                         children: [
              //                           Stack(
              //                             children: [
              //                               Align(
              //                                 alignment: AlignmentDirectional(0.0, -1.0),
              //                                 child: Container(
              //                                   width: 80.0,
              //                                   height: 80.0,
              //                                   decoration: BoxDecoration(
              //                                     color: Color(0xFF272A32),
              //                                     borderRadius: BorderRadius.only(
              //                                       bottomLeft: Radius.circular(0.0),
              //                                       bottomRight: Radius.circular(0.0),
              //                                       topLeft: Radius.circular(50.0),
              //                                       topRight: Radius.circular(50.0),
              //                                     ),
              //                                   ),
              //                                   alignment: AlignmentDirectional(0.0, -1.0),
              //                                 ),
              //                               ),
              //                               Align(
              //                                 alignment: AlignmentDirectional(0.0, -1.0),
              //                                 child: Padding(
              //                                   padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
              //                                   child: Container(
              //                                     width: 50.0,
              //                                     height: 50.0,
              //                                     decoration: BoxDecoration(
              //                                       color: FlutterFlowTheme.of(context).primary,
              //                                       borderRadius: BorderRadius.circular(50.0),
              //                                       border: Border.all(
              //                                         color: _model.pageNumber == 1 ? FlutterFlowTheme.of(context).primaryBackground : Color(0xC292A6E3),
              //                                         width: 3.0,
              //                                       ),
              //                                     ),
              //                                     child: Padding(
              //                                       padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
              //                                       child: FlutterFlowIconButton(
              //                                         borderColor: Colors.transparent,
              //                                         borderRadius: 25.0,
              //                                         borderWidth: 1.0,
              //                                         buttonSize: 50.0,
              //                                         fillColor: Colors.transparent,
              //                                         icon: Icon(
              //                                           Icons.bar_chart,
              //                                           color: Colors.white,
              //                                           size: 30.0,
              //                                         ),
              //                                         onPressed: () async {
              //                                           logFirebaseEvent('HOME_PAGE_MiddleButton_ON_TAP');
              //                                           logFirebaseEvent('MiddleButton_update_page_state');
              //                                           _model.pageNumber = 1;
              //                                           safeSetState(() {});
              //                                           logFirebaseEvent('MiddleButton_page_view');
              //                                           await _model.pageViewController?.animateToPage(
              //                                             1,
              //                                             duration: Duration(milliseconds: 500),
              //                                             curve: Curves.ease,
              //                                           );
              //                                         },
              //                                       ),
              //                                     ),
              //                                   ),
              //                                 ),
              //                               ),
              //                             ],
              //                           ),
              //                         ],
              //                       ),
              //                     ),
              //                   ),
              //                   Expanded(
              //                     child: Padding(
              //                       padding: EdgeInsetsDirectional.fromSTEB(0.0, 52.0, 0.0, 0.0),
              //                       child: InkWell(
              //                         splashColor: Colors.transparent,
              //                         focusColor: Colors.transparent,
              //                         hoverColor: Colors.transparent,
              //                         highlightColor: Colors.transparent,
              //                         onTap: () async {
              //                           logFirebaseEvent('HOME_PAGE_Column_7y5r4r36_ON_TAP');
              //                           logFirebaseEvent('Column_page_view');
              //                           await _model.pageViewController?.animateToPage(
              //                             2,
              //                             duration: Duration(milliseconds: 500),
              //                             curve: Curves.ease,
              //                           );
              //                           logFirebaseEvent('Column_update_page_state');
              //                           _model.pageNumber = 2;
              //                           safeSetState(() {});
              //                         },
              //                         child: Column(
              //                           mainAxisSize: MainAxisSize.min,
              //                           mainAxisAlignment: MainAxisAlignment.center,
              //                           children: [
              //                             Padding(
              //                               padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
              //                               child: Icon(
              //                                 Icons.subscriptions_outlined,
              //                                 color: _model.pageNumber == 2 ? Colors.white : Color(0xFF6C767E),
              //                                 size: 20.0,
              //                               ),
              //                             ),
              //                             Text(
              //                               'Subscriptions',
              //                               style: FlutterFlowTheme.of(context).bodyMedium.override(
              //                                     font: GoogleFonts.inter(
              //                                       fontWeight: FontWeight.w500,
              //                                       fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
              //                                     ),
              //                                     color: _model.pageNumber == 2 ? Colors.white : FlutterFlowTheme.of(context).secondaryText,
              //                                     fontSize: 14.0,
              //                                     letterSpacing: 0.0,
              //                                     fontWeight: FontWeight.w500,
              //                                     fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
              //                                   ),
              //                             ),
              //                           ],
              //                         ),
              //                       ),
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
