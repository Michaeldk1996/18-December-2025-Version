import 'dart:ui';

import 'package:b_s_p_consult/backend/backend.dart';
import 'package:b_s_p_consult/widgets/consts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../auth/firebase_auth/auth_util.dart';
import '../../backend/api_requests/api_calls.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import '../../flutter_flow/flutter_flow_widgets.dart';
import 'home_model.dart';

class UpgradeMembershipUI extends StatefulWidget {
  final HomeModel model;
  const UpgradeMembershipUI(this.model, {super.key});

  @override
  State<UpgradeMembershipUI> createState() => _UpgradeMembershipUIState();
}

class _UpgradeMembershipUIState extends State<UpgradeMembershipUI> {
  void callPayment(String priceId)async{
    widget.model.settingsResponse = await querySettingsRecordOnce(singleRecord: true).then((s) => s.firstOrNull);
    if (widget.model.settingsResponse!.approve) {
      logFirebaseEvent('Button_backend_call');

      widget.model.apiResultd8s = await CreateCheckoutSessionCall.call(
        priceId: priceId,// 'price_1OgVtOCf4YXq1rsy99bw9IHr',
        customerEmail: currentUserEmail,
        platform: 'mobile',
      );
      
      if ((widget.model.apiResultd8s?.succeeded ?? true)) {
        logFirebaseEvent('Button_launch_u_r_l');
        await launchURL(getJsonField(
          (widget.model.apiResultd8s?.jsonBody ?? ''),
          r'''$.redirectUrl''',
        ).toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final plan = ValueNotifier<int>(int.tryParse(currentUserDocument?.membership ?? '0') == 9 ? 2 : 1);
    final userPlan = int.tryParse(currentUserDocument?.membership ?? '0') ?? 1;
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
      child: Container(
        width: MediaQuery.of(context).size.width * .95,
        constraints: BoxConstraints(
          maxWidth: 600
        ),
        margin: EdgeInsets.all(12),
        padding: EdgeInsets.all(9),
        decoration: BoxDecoration(
          color: Color.fromRGBO(16, 17, 23, 1),
          borderRadius: BorderRadius.circular(16)
        ),
        child: ValueListenableBuilder(
          valueListenable: plan,
          builder: (context, planSelected, child) {
            final price_advanced = 200;
            final price_gold = userPlan == 8
              ? 600 
              : 400;
            return Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 3,
              children: [
                SizedBox(height: 9),
                Text('Upgrade Membership', 
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
                SizedBox(height: 9),
                Container(
                  child: Text('Upgrade to unlock advanced',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.montserrat(
                        fontWeight: FontWeight.normal,
                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      color: Colors.white,
                      fontSize: 14.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.normal,
                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,                
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  child: Text('features and full access.',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.montserrat(
                        fontWeight: FontWeight.normal,
                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      color: Colors.white,
                      fontSize: 14.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.normal,
                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,                
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 18),
                Row(
                  spacing: 19,
                  children: [
                    if ((int.tryParse(currentUserDocument?.membership ?? '0') ?? 0) < 9)
                      Expanded(
                        child: FFButtonWidget(
                          text: 'Advanced',
                          options: planSelected == 1 ? context.buttonOptions : context.greybuttonOptions(),
                          onPressed: ()=>plan.value = 1,
                        ),
                      ),
                    Expanded(
                      child: FFButtonWidget(
                        text: 'Gold',
                        options: planSelected == 2 ? context.goldbuttonOptions : context.greybuttonOptions(),
                        onPressed: ()=>plan.value = 2,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 9),
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(16),
                  child: Container(
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Image.asset('assets/images/${planSelected == 1 ? 'bluemask1' : 'goldmask1'}.png', width: MediaQuery.of(context).size.width - 18, fit: BoxFit.cover)
                        ),
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Image.asset('assets/images/${planSelected == 1 ? 'bluemask2' : 'goldmask2'}.png', width: MediaQuery.of(context).size.width - 18, fit: BoxFit.cover)
                        ),
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Image.asset('assets/images/bluemask1.png')
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 9,
                          children: [
                            Container(
                              width: double.infinity,
                              margin: EdgeInsets.all(12),
                              padding: EdgeInsets.all(9),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Color.fromRGBO(0, 0, 0, 0.3)
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: 9,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('${planSelected == 1 ? 'Advanced' : 'Gold'} Program', style: TextStyle(color: Colors.white, fontSize: 18)),
                                      if (planSelected == 1)
                                        Container(
                                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                          decoration: BoxDecoration(
                                            color: Color.fromRGBO(52, 138, 247, 0.2),
                                            borderRadius: BorderRadius.circular(16),
                                            border: Border.all(color: Color.fromRGBO(52, 138, 247, 1))
                                          ),
                                          child: Text('Best Value', style: TextStyle(color: Colors.white, fontSize: 10),),
                                        )
                                    ],
                                  ),
                                  SizedBox(height: 12),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text('€${planSelected == 1 ? price_advanced : price_gold}', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                                      Container(
                                        margin: EdgeInsets.only(bottom: 3),
                                        child: Text(' one time fee', style: TextStyle(color: Colors.white, fontSize: 12))
                                      )
                                    ],
                                  ),
                                  Text('Lock in current pricing before next update.', style: TextStyle(color: Colors.white, fontSize: 12)),
                                  // SizedBox(height: 2),
                                  if (planSelected == 1)
                                    Container(
                                      width: double.infinity,
                                      child: FFButtonWidget(
                                        text: 'Get Advanced Program', 
                                        onPressed: ()async{
                                          String priceId = Setting.Advanced_priceId;
                                          if ((int.tryParse(currentUserDocument?.membership ?? '0') ?? 0) == 8){
                                            priceId = Setting.silver_Advance_priceId;
                                          }
                                          callPayment(priceId);
                                        }, 
                                        options: context.buttonOptions
                                      ),
                                    )
                                  else
                                    Container(
                                      width: double.infinity,
                                      child: FFButtonWidget(
                                        text: 'Get Gold Program', 
                                        onPressed: (){
                                          String priceId = Setting.Gold_priceId;
                                          if ((int.tryParse(currentUserDocument?.membership ?? '0') ?? 0) == 8){
                                            priceId = Setting.silver_Gold_priceId;
                                          }
                                          else if ((int.tryParse(currentUserDocument?.membership ?? '0') ?? 0) == 9){
                                            priceId = Setting.Advanced_gold_priceId;
                                          }
                                          callPayment(priceId);
                                        }, 
                                        options: context.goldbuttonOptions
                                      ),
                                    ),
                                  // SizedBox(height: 9)
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 25),
                              child: Text('Extra benefits with ${planSelected == 1 ? 'Advanced' : 'Gold'}', style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold))
                            ),
                            if (planSelected == 1)
                              ...[
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 19),
                                  child: Row(
                                    spacing: 9,
                                    children: [
                                      SizedBox(width: 3),
                                      Image.asset('assets/images/bluecheck.png', height: 16, fit: BoxFit.cover,),
                                      Text('Advanced Data Insights (BSP App)', style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold))
                                    ],
                                  )
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 19),
                                  child: Row(
                                    spacing: 9,
                                    children: [
                                      SizedBox(width: 3),
                                      Image.asset('assets/images/bluecheck.png', height: 16, fit: BoxFit.cover,),
                                      Text('BSP Tennis Betting Model', style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold))
                                    ],
                                  )
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 19),
                                  child: Row(
                                    spacing: 9,
                                    children: [
                                      SizedBox(width: 3),
                                      Image.asset('assets/images/bluecheck.png', height: 16, fit: BoxFit.cover,),
                                      Text('Essential Video Content', style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold))
                                    ],
                                  )
                                ),
                              ]
                            else
                              ...[
                                if (userPlan == 8)
                                  ...[
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 19),
                                      child: Row(
                                        spacing: 9,
                                        children: [
                                          SizedBox(width: 3),
                                          Image.asset('assets/images/goldcheck.png', height: 16, fit: BoxFit.cover,),
                                          Text('Advanced Data Insights (BSP App)', style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold))
                                        ],
                                      )
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 19),
                                      child: Row(
                                        spacing: 9,
                                        children: [
                                          SizedBox(width: 3),
                                          Image.asset('assets/images/goldcheck.png', height: 16, fit: BoxFit.cover,),
                                          Text('BSP Tennis Betting Model', style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold))
                                        ],
                                      )
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 19),
                                      child: Row(
                                        spacing: 9,
                                        children: [
                                          SizedBox(width: 3),
                                          Image.asset('assets/images/goldcheck.png', height: 16, fit: BoxFit.cover,),
                                          Text('Essential Video Content', style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold))
                                        ],
                                      )
                                    ),
                                  ],
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 19),
                                  child: Row(
                                    spacing: 9,
                                    children: [
                                      SizedBox(width: 3),
                                      Image.asset('assets/images/goldcheck.png', height: 16, fit: BoxFit.cover,),
                                      Text('High-Stakes Betting Frameworks', style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold))
                                    ],
                                  )
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 19),
                                  child: Row(
                                    spacing: 9,
                                    children: [
                                      SizedBox(width: 3),
                                      Image.asset('assets/images/goldcheck.png', height: 16, fit: BoxFit.cover,),
                                      Text('BSP Masterclass (20+ Hours of Video)', style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold))
                                    ],
                                  )
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 19),
                                  child: Row(
                                    spacing: 9,
                                    children: [
                                      SizedBox(width: 3),
                                      Image.asset('assets/images/goldcheck.png', height: 16, fit: BoxFit.cover,),
                                      Text('Real Time Study Cases', style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold))
                                    ],
                                  )
                                ),
                              ],
                              SizedBox(height: 25),
                          ],
                        ),
                      ],                  
                    ),
                  ),
                )
              ],
            );
          }
        ),
      ),
    );
  }
}