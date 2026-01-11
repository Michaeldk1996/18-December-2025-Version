import 'package:b_s_p_consult/widgets/consts.dart';

import '/components/reset_password/reset_password_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login_model.dart';
export 'login_model.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  static String routeName = 'Login';
  static String routePath = '/login';

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  late LoginModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Login'});
    _model.usernameTextController ??= TextEditingController();
    _model.usernameFocusNode ??= FocusNode();

    _model.passwordTextController ??= TextEditingController();
    _model.passwordFocusNode ??= FocusNode();

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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [FlutterFlowTheme.of(context).primary, Colors.white],
              stops: [0.0, 1.0],
              begin: AlignmentDirectional(0.0, -1.0),
              end: AlignmentDirectional(0, 1.0),
            ),
          ),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Color.fromRGBO(9, 11, 21, 1)//FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Image.asset('assets/images/bluecircle.png'),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Image.asset('assets/images/bluecircle2.png'),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: 600
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * .1),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 9,
                        children: [
                          SizedBox(height: MediaQuery.of(context).size.height * .1),
                          Center(
                            child: Image.asset(
                              'assets/images/Logo-1.png',
                              // width: 75.0,
                              height: 60.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 6,
                            children: [
                              Text('BSP', style: TextStyle(color: FlutterFlowTheme.of(context).primaryText, fontSize: 23, fontWeight: FontWeight.w700)),
                              Text('CONSULT', style: TextStyle(color: FlutterFlowTheme.of(context).primaryText, fontSize: 23)),
                            ],
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * (MediaQuery.of(context).size.width <= 600 ? .17 : .37)),
                          Center(
                            child: Text(
                              'Sign In',
                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                font: GoogleFonts.inter(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                ),
                                fontSize: 24.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                              ),
                            ),
                          ),
                          SizedBox(height: 19),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              'Email',
                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                font: GoogleFonts.inter(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                ),
                                fontSize: 14.0,
                                letterSpacing: 0.0,
                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsGeometry.symmetric(horizontal: 6),
                            child: TextFormField(
                              controller: _model.usernameTextController,
                              focusNode: _model.usernameFocusNode,
                              autofocus: true,
                              obscureText: false,
                              decoration: context.textfieldDecoration('example@gmail.com'),
                              style: context.textFieldStyle,
                            )
                          ),
                          SizedBox(height: 1),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              'Password',
                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                font: GoogleFonts.inter(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                ),
                                fontSize: 14.0,
                                letterSpacing: 0.0,
                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsGeometry.symmetric(horizontal: 6),
                            child: TextFormField(
                              controller: _model.passwordTextController,
                              focusNode: _model.passwordFocusNode,
                              autofocus: true,
                              obscureText: !_model.passwordVisibility,
                              decoration: context.textfieldDecoration('******************').copyWith(
                                suffixIcon: InkWell(
                                  onTap: () => safeSetState(() => _model.passwordVisibility =!_model.passwordVisibility),
                                  focusNode: FocusNode(skipTraversal: true),
                                  child: Icon(
                                    _model.passwordVisibility
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    color: FlutterFlowTheme.of(context).primaryText,
                                    size: 24.0,
                                  ),
                                ),
                              ),
                              style: context.textFieldStyle,
                              validator: _model.passwordTextControllerValidator.asValidator(context),
                            ),
                          ),
                          SizedBox(height: 9),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 20.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent('LOGIN_PAGE_SIGN_IN_BTN_ON_TAP');
                                logFirebaseEvent('Button_custom_action');
                                _model.result = await actions.firebaseEmailAuth(
                                  context,
                                  _model.usernameTextController.text,
                                  _model.passwordTextController.text,
                                );
                                if (_model.result == 0) {
                                  logFirebaseEvent('Button_navigate_to');
                              
                                  context.pushNamed(HomeWidget.routeName);
                                } else {
                                  logFirebaseEvent('Button_show_snack_bar');
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Looks like you have entered the wrong password.',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context).primaryText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).primary,
                                    ),
                                  );
                                }
                              
                                safeSetState(() {});
                              },
                              text: 'Sign In',
                              options: context.buttonOptions
                            ),
                          ),
                          Center(
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent('LOGIN_PAGE_Text_uj4nxste_ON_TAP');
                                logFirebaseEvent('Text_alert_dialog');
                                await showDialog(
                                  context: context,
                                  builder: (dialogContext) {
                                    return Dialog(
                                      elevation: 0,
                                      insetPadding: EdgeInsets.zero,
                                      backgroundColor: Colors.transparent,
                                      alignment: AlignmentDirectional(0.0, 0.0)
                                          .resolve(Directionality.of(context)),
                                      child: GestureDetector(
                                        onTap: () {
                                          FocusScope.of(dialogContext)
                                              .unfocus();
                                          FocusManager.instance.primaryFocus
                                              ?.unfocus();
                                        },
                                        child: ResetPasswordWidget(),
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Text(
                                'Forgot Password?',
                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  ),
                                  color: Color.fromRGBO(0, 122, 255, 1),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 6.0, 0.0),
                                child: Text(
                                  'New here?',
                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                    ),
                                    color: Color.fromRGBO(133, 141, 157, 1),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  ),
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent('LOGIN_PAGE_Text_1thst6o5_ON_TAP');
                                  logFirebaseEvent('Text_navigate_to');
                                  
                                  context.pushNamed(
                                    SignupWidget.routeName,
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType:
                                            PageTransitionType.rightToLeft,
                                        duration: Duration(milliseconds: 300),
                                      ),
                                    },
                                  );
                                },
                                child: Text(
                                  'Create an account',
                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                    ),
                                    color: Color.fromRGBO(0, 122, 255, 1),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
