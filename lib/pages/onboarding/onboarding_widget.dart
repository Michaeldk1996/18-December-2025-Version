import 'package:b_s_p_consult/flutter_flow/flutter_flow_widgets.dart';
import 'package:b_s_p_consult/widgets/consts.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'onboarding_model.dart';
export 'onboarding_model.dart';

class OnboardingWidget extends StatefulWidget {
  const OnboardingWidget({super.key});

  static String routeName = 'Onboarding';
  static String routePath = '/onboarding';

  @override
  State<OnboardingWidget> createState() => _OnboardingWidgetState();
}

class _OnboardingWidgetState extends State<OnboardingWidget> {
  late OnboardingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OnboardingModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Onboarding'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset('assets/images/bluecircle.png')
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset('assets/images/bluecircle2.png')
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset('assets/images/cloud.png', fit: BoxFit.cover, width: double.infinity),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * .75,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(10, 12, 22, 0),
                      Color.fromRGBO(10, 12, 22, 1),
                      Color.fromRGBO(10, 12, 22, 1),
                      Color.fromRGBO(10, 12, 22, 1),
                    ]
                  )
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(
                  top: (MediaQuery.of(context).size.height * (MediaQuery.of(context).size.width <= 600 ? .025 : .1)) + MediaQuery.of(context).padding.top
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/Logo.png',
                        width: 32,
                        height: 32,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 9),
                    Text('BSP',
                      style: TextStyle(color: FlutterFlowTheme.of(context).primaryText, fontWeight: FontWeight.bold, fontSize: 18),  
                    ),
                    SizedBox(width: 4),
                    Text('CONSULT',
                      style: TextStyle(color: FlutterFlowTheme.of(context).primaryText, fontSize: 18),  
                    )
                  ],
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    // decoration: BoxDecoration(
                    //   gradient: LinearGradient(
                    //     colors: [
                    //       FlutterFlowTheme.of(context).primary,
                    //       FlutterFlowTheme.of(context).secondaryBackground
                    //     ],
                    //     stops: [0.0, 1.0],
                    //     begin: AlignmentDirectional(0.0, -1.0),
                    //     end: AlignmentDirectional(0, 1.0),
                    //   ),
                    // ),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        // color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Container(
                        width: double.infinity,
                        child: Stack(
                          children: [
                            Container(
                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
                              child: PageView(
                                controller: _model.pageViewController ??= PageController(initialPage: 0),
                                onPageChanged: (_) async {
                                  logFirebaseEvent('ONBOARDING_PageView_md4dsljq_ON_WIDGET_S');
                                  logFirebaseEvent('PageView_update_page_state');
                                  _model.pageState = _model.pageViewCurrentIndex;
                                  safeSetState(() {});
                                },
                                scrollDirection: Axis.horizontal,
                                children: [
                                  Stack(
                                    children: [
                                      Align(
                                        alignment: Alignment.center,
                                        child: Container(
                                          constraints: BoxConstraints(
                                            maxWidth: 600
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              SizedBox(height: MediaQuery.of(context).size.width <= 600 ? 0 : MediaQuery.of(context).size.height * .12),
                                              Image.asset('assets/images/onboarding1.png', height: MediaQuery.of(context).size.width <= 600 ? MediaQuery.of(context).size.height * .4 : MediaQuery.of(context).size.height * .4),
                                              SizedBox(height: MediaQuery.of(context).size.width <= 600 ? 35 : MediaQuery.of(context).size.height * .05),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Row(
                                                    mainAxisSize: MainAxisSize.max,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        'Configure',
                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                          font: GoogleFonts.inter(
                                                            fontWeight: FontWeight.bold,
                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                          ),
                                                          fontSize: 28.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight: FontWeight.bold,
                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsetsDirectional.fromSTEB(
                                                      valueOrDefault<double>(
                                                        MediaQuery.sizeOf(context).width < 500.0
                                                            ? 24.0
                                                            : 100.0,
                                                        0.0,
                                                      ),
                                                      24.0,
                                                      valueOrDefault<double>(
                                                        MediaQuery.sizeOf(context).width < 500.0
                                                          ? 24.0
                                                          : 100.0,
                                                        0.0,
                                                      ),
                                                      0.0),
                                                    child: Text(
                                                      'Add your bankroll and choose a staking system to create a personalized staking plan. This allows the app to automatically calculate optimal stake sizes for every bet, based on your capital and risk profile.',
                                                      textAlign: TextAlign.center,
                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight: FontWeight.w500,
                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                        ),
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight: FontWeight.w500,
                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                        lineHeight: 1.4,
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
                                  Center(
                                    child: Container(
                                      constraints: BoxConstraints(
                                        maxWidth: 600
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(top: MediaQuery.of(context).size.width <= 600 ? 0 : MediaQuery.of(context).size.height * .065),
                                            child: Image.asset('assets/images/onboarding2.png', height: MediaQuery.of(context).size.width <= 600 ? MediaQuery.of(context).size.height * .4 : null),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              // SizedBox(height: MediaQuery.of(context).size.height * .1),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Get Notified',
                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight: FontWeight.bold,
                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                      ),
                                                      fontSize: 28.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight: FontWeight.bold,
                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsetsDirectional.fromSTEB(
                                                        valueOrDefault<double>(
                                                          MediaQuery.sizeOf(context).width < 500.0
                                                            ? 24.0
                                                            : 100.0,
                                                          0.0,
                                                        ),
                                                        24.0,
                                                        valueOrDefault<double>(
                                                          MediaQuery.sizeOf(context).width < 500.0
                                                            ? 24.0
                                                            : 100.0,
                                                          0.0,
                                                        ),
                                                        0.0),
                                                child: Text(
                                                  'Each day, we carefully analyze matches and market odds. When a structured betting opportunity is identified, you receive a notification that takes you directly to a detailed in-app analysis explaining the logic behind the bet.',
                                                  textAlign: TextAlign.center,
                                                  style:
                                                    FlutterFlowTheme.of(context).bodyMedium.override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight: FontWeight.w500,
                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                      ),
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight: FontWeight.w500,
                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                      lineHeight: 1.4,
                                                    ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Container(
                                      constraints: BoxConstraints(
                                        maxWidth: 600
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(top: MediaQuery.of(context).size.width <= 600 ? 0 : MediaQuery.of(context).size.height * .1),
                                                child: Stack(
                                                  children: [
                                                    Center(
                                                      child: Image.asset('assets/images/onboarding3.png', 
                                                      height: MediaQuery.of(context).size.width <= 600 
                                                        ? MediaQuery.of(context).size.height * .4 
                                                        : MediaQuery.of(context).size.height * .45)
                                                    ),
                                                    // Align(
                                                    //   alignment: Alignment.bottomCenter,
                                                    //   child: Container(
                                                    //     height: 50,
                                                    //     decoration: BoxDecoration(
                                                    //       gradient: LinearGradient(
                                                    //         begin: Alignment.topCenter,
                                                    //         end: Alignment.bottomCenter,
                                                    //         colors: [
                                                    //           Color.fromRGBO(10, 12, 22, 0),
                                                    //           Color.fromRGBO(10, 12, 22, 1),
                                                    //         ]
                                                    //       )
                                                    //     ),
                                                    //   ),
                                                    // )
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: MediaQuery.of(context).size.width <= 600 ? 50 : MediaQuery.of(context).size.height * .04),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Execution & Market Insight',
                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight: FontWeight.bold,
                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                      ),
                                                      fontSize: 28.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight: FontWeight.bold,
                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsetsDirectional.fromSTEB(
                                                        valueOrDefault<double>(
                                                          MediaQuery.sizeOf(context)
                                                                      .width <
                                                                  500.0
                                                              ? 24.0
                                                              : 100.0,
                                                          0.0,
                                                        ),
                                                        24.0,
                                                        valueOrDefault<double>(
                                                          MediaQuery.sizeOf(context)
                                                                      .width <
                                                                  500.0
                                                              ? 24.0
                                                              : 100.0,
                                                          0.0,
                                                        ),
                                                        0.0),
                                                child: Text(
                                                  'Receive notifications for structured betting opportunities with full analysis, ready to copy with one click. You’ll also receive advanced data insights explaining price movements, market context and where value has been identified.',
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight: FontWeight.w500,
                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                    ),
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                    lineHeight: 1.4,
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
                            Align(
                              alignment: AlignmentDirectional(0.0, 1.0),
                              child: Container(
                                constraints: BoxConstraints(
                                  maxWidth: 600
                                ),
                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 35.0),
                                child: Column(
                                  spacing: 19,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    smooth_page_indicator.SmoothPageIndicator(
                                      controller: _model.pageViewController ??= PageController(initialPage: 0),
                                      count: 3,
                                      axisDirection: Axis.horizontal,
                                      onDotClicked: (i) async {
                                        await _model.pageViewController!
                                            .animateToPage(
                                          i,
                                          duration: Duration(milliseconds: 500),
                                          curve: Curves.ease,
                                        );
                                        safeSetState(() {});
                                      },
                                      effect: smooth_page_indicator.ExpandingDotsEffect(
                                        expansionFactor: 3.0,
                                        spacing: 8.0,
                                        radius: 16.0,
                                        dotWidth: 16.0,
                                        dotHeight: 8.0,
                                        dotColor: Color.fromRGBO(0, 51, 107, 1),// FlutterFlowTheme.of(context).accent1,
                                        activeDotColor: Color.fromRGBO(0, 122, 255, 1),// FlutterFlowTheme.of(context).primary,
                                        paintStyle: PaintingStyle.fill,
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 12),
                                      width: double.infinity,
                                      child: FFButtonWidget(
                                        text: 'Get Started', 
                                        onPressed: (){
                                          context.pushNamed(
                                            SignupWidget.routeName,
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey: TransitionInfo(
                                                hasTransition: true,
                                                transitionType: PageTransitionType.rightToLeft,
                                                duration: Duration(milliseconds: 200),
                                              ),
                                            },
                                          );
                                        }, 
                                        options: context.buttonOptions
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      spacing: 12,
                                      children: [
                                        Text('Already have an account?', style: TextStyle(color: FlutterFlowTheme.of(context).primaryText, fontSize: 14)),
                                        GestureDetector(
                                          onTap: (){
                                            context.pushNamed(
                                              LoginWidget.routeName,
                                              extra: <String, dynamic>{
                                                kTransitionInfoKey: TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType: PageTransitionType.rightToLeft,
                                                  duration: Duration(milliseconds: 200),
                                                ),
                                              },
                                            );
                                          },
                                          child: Text('Sign In', style: TextStyle(color: Color.fromRGBO(0, 122, 255, 1), fontSize: 14, fontWeight: FontWeight.w700))
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
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
    );
  }
}
