import 'package:b_s_p_consult/widgets/consts.dart';

import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'signup_model.dart';
export 'signup_model.dart';

class SignupWidget extends StatefulWidget {
  const SignupWidget({super.key});

  static String routeName = 'Signup';
  static String routePath = '/signup';

  @override
  State<SignupWidget> createState() => _SignupWidgetState();
}

class _SignupWidgetState extends State<SignupWidget> {
  late SignupModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SignupModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Signup'});
    _model.nameTextController ??= TextEditingController();
    _model.nameFocusNode ??= FocusNode();

    _model.emailTextController ??= TextEditingController();
    _model.emailFocusNode ??= FocusNode();

    _model.passwordTextController ??= TextEditingController();
    _model.passwordFocusNode ??= FocusNode();

    _model.confirmpasswordTextController ??= TextEditingController();
    _model.confirmpasswordFocusNode ??= FocusNode();

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
        backgroundColor: FlutterFlowTheme.of(context).primary,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Color.fromRGBO(9, 11, 21, 1),// FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              // color: FlutterFlowTheme.of(context).secondaryBackground,
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
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(),
                    child: Form(
                      key: _model.formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Center(
                        child: Container(
                          constraints: BoxConstraints(
                            maxWidth: 600
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 9,
                              children: [
                                SizedBox(height: MediaQuery.of(context).size.height * .12),
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
                                SizedBox(height: MediaQuery.of(context).size.height * (MediaQuery.of(context).size.width <= 600 ? .1 : .22)),
                                Center(
                                  child: Text(
                                    'Sign Up',
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
                                    'Username',
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
                                  padding: EdgeInsets.symmetric(horizontal: 6),
                                  child: TextFormField(
                                    controller: _model.nameTextController,
                                    focusNode: _model.nameFocusNode,
                                    autofocus: true,
                                    obscureText: false,
                                    decoration: context.textfieldDecoration('John Doe'),
                                    style: context.textFieldStyle,
                                    keyboardType: TextInputType.emailAddress,
                                    validator: _model.nameTextControllerValidator.asValidator(context),
                                  ),
                                ),
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
                                  padding: EdgeInsets.symmetric(horizontal: 6),
                                  child: TextFormField(
                                    controller: _model.emailTextController,
                                    focusNode: _model.emailFocusNode,
                                    autofocus: true,
                                    obscureText: false,
                                    decoration: context.textfieldDecoration('Example@gmail.com'),
                                    style: context.textFieldStyle,
                                    keyboardType: TextInputType.emailAddress,
                                    validator: _model.emailTextControllerValidator.asValidator(context),
                                  ),
                                ),
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
                                  padding: EdgeInsets.symmetric(horizontal: 6),
                                  child: TextFormField(
                                    controller: _model.passwordTextController,
                                    focusNode: _model.passwordFocusNode,
                                    autofocus: true,
                                    obscureText: !_model.passwordVisibility,
                                    decoration: context.textfieldDecoration('********************'),
                                    style: context.passtextFieldStyle,
                                    validator: _model.passwordTextControllerValidator.asValidator(context),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                  child: Text(
                                    'Confirm Password',
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
                                    controller: _model.confirmpasswordTextController,
                                    focusNode: _model.confirmpasswordFocusNode,
                                    autofocus: true,
                                    obscureText: !_model.confirmpasswordVisibility,
                                    decoration: context.textfieldDecoration('********************'),
                                    style: context.passtextFieldStyle,
                                    validator: _model.confirmpasswordTextControllerValidator.asValidator(context),
                                  ),
                                ),
                                SizedBox(height: 12),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                  width: double.infinity,
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      logFirebaseEvent('SIGNUP_PAGE_CREATE_ACCOUNT_BTN_ON_TAP');
                                      if (_model.passwordTextController.text == _model.confirmpasswordTextController.text) {
                                        logFirebaseEvent('Button_validate_form');
                                        if (_model.formKey.currentState == null || !_model.formKey.currentState!.validate()) {
                                          return;
                                        }
                                        logFirebaseEvent('Button_auth');
                                        GoRouter.of(context).prepareAuthEvent();
                                        if (_model.passwordTextController.text != _model.confirmpasswordTextController.text) {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Passwords don\'t match!',
                                              ),
                                            ),
                                          );
                                          return;
                                        }
                                  
                                        //!temporary disabled
                                        // final _verified = await EmailVerification.verifyEmail(context, _model.emailTextController.text);
                                        // if (!_verified) return;
                                  
                                        final user = await authManager.createAccountWithEmail(
                                          context,
                                          _model.emailTextController.text,
                                          _model.passwordTextController.text,
                                        );
                                        if (user == null) {
                                          return;
                                        }
                                  
                                        logFirebaseEvent('Button_backend_call');
                                  
                                        await currentUserReference!.update(
                                          createUsersRecordData(
                                            username: _model.nameTextController.text,
                                            role: 'subscriber',
                                            membership: '1',
                                            displayName: _model.nameTextController.text,
                                          )
                                        );
                                        logFirebaseEvent('Button_navigate_to');
                                  
                                        context.pushNamedAuth(
                                          HomeWidget.routeName,
                                          context.mounted,
                                          extra: <String, dynamic>{
                                            kTransitionInfoKey: TransitionInfo(
                                              hasTransition: true,
                                              transitionType: PageTransitionType.rightToLeft,
                                              duration: Duration(milliseconds: 300),
                                            ),
                                          },
                                        );
                                      } else {
                                        logFirebaseEvent('Button_show_snack_bar');
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Mismatched Password',
                                              style: TextStyle(color: Colors.white),
                                            ),
                                            duration: Duration(milliseconds: 4000),
                                            backgroundColor: Colors.black,
                                          ),
                                        );
                                        return;
                                      }
                                    },
                                    text: 'Sign Up',
                                    options: context.buttonOptions
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 20.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Theme(
                                        data: ThemeData(
                                          checkboxTheme: CheckboxThemeData(
                                            visualDensity: VisualDensity.compact,
                                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(4.0),
                                            ),
                                          ),
                                          unselectedWidgetColor: FlutterFlowTheme.of(context).secondaryText,
                                        ),
                                        child: Checkbox(
                                          value: _model.checkboxValue ??= true,
                                          onChanged: (newValue) async {
                                            safeSetState(() => _model.checkboxValue = newValue!);
                                          },
                                          side: BorderSide(
                                            width: 2,
                                            color: FlutterFlowTheme.of(context).secondaryText,
                                          ),
                                          activeColor: FlutterFlowTheme.of(context).primary,
                                          checkColor: FlutterFlowTheme.of(context).info,
                                        ),
                                      ),
                                      Expanded(
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'SIGNUP_PAGE_RichText_d8udlg03_ON_TAP');
                                            logFirebaseEvent('RichText_navigate_to');
                            
                                            context.pushNamed(
                                                TermsAndServiceWidget.routeName);
                                          },
                                          child: RichText(
                                            textScaler:
                                                MediaQuery.of(context).textScaler,
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: 'I have reviewed and agreed to the ',
                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight: FontWeight.normal,
                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                    ),
                                                    color: Color.fromRGBO(185, 189, 199, 1),// FlutterFlowTheme.of(context).primaryText,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.normal,
                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: 'terms and conditions',
                                                  style: TextStyle(
                                                    color: Color.fromRGBO(0, 122, 255, 1),
                                                    fontWeight: FontWeight.bold,
                                                    decoration:
                                                        TextDecoration.underline,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: ' & ',
                                                  style: TextStyle(),
                                                ),
                                                TextSpan(
                                                  text: 'privacy policy',
                                                  style: TextStyle(
                                                    color: Color.fromRGBO(0, 122, 255, 1),
                                                    fontWeight: FontWeight.bold,
                                                    decoration: TextDecoration.underline,
                                                  ),
                                                  mouseCursor: SystemMouseCursors.click,
                                                  recognizer: TapGestureRecognizer()
                                                    ..onTap = () async {
                                                      logFirebaseEvent(
                                                          'SIGNUP_PAGE_RichTextSpan_qk283rf3_ON_TAP');
                                                      logFirebaseEvent(
                                                          'RichTextSpan_navigate_to');
                            
                                                      context.pushNamed(
                                                          PrivacypolicyWidget
                                                              .routeName);
                                                    },
                                                )
                                              ],
                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                              ),
                                            ),
                                            textAlign: TextAlign.start,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  spacing: 6,
                                  children: [
                                    Text('Already have an account?', style: TextStyle(color: Color.fromRGBO(133, 141, 157, 1))),
                                    GestureDetector(
                                      onTap: ()=>context.pop(),
                                      child: Text('Sign in', style: TextStyle(color: Color.fromRGBO(0, 122, 255, 1)))
                                    ),
                                  ],
                                ),
                                SizedBox(height: 22)
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
    );
  }
}
