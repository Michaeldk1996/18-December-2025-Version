import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangeStakingStrategylWidget extends StatefulWidget {
  final String? strategy;
  const ChangeStakingStrategylWidget(this.strategy, {super.key});

  @override
  State<ChangeStakingStrategylWidget> createState() => _ChangeStakingStrategylWidgetState();
}

class _ChangeStakingStrategylWidgetState extends State<ChangeStakingStrategylWidget> {
  String strategy = '';

  @override
  void initState() {
    super.initState();
    strategy = widget.strategy ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 120.0),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding( padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 0.0, 0.0),
                                  child: Text(
                                    'Staking Strategy',
                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                      font: GoogleFonts.inter(
                                        fontWeight:FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                      ),
                                      fontSize: 20.0,
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
                            padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                            child: Row(
                              spacing: 12,
                              children: [
                                Switch(
                                  value: strategy == 'Conservative', 
                                  inactiveTrackColor: Colors.grey,
                                  onChanged: (val)=>setState(()=>strategy='Conservative')
                                ),
                                Text('Conservative',
                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight:FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                    ),
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  ),
                                )
                              ],
                            ) 
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                            child: Row(
                              spacing: 12,
                              children: [
                                Switch(
                                  value: strategy == 'Balanced', 
                                  inactiveTrackColor: Colors.grey,
                                  onChanged: (val)=>setState(()=>strategy='Balanced')
                                ),
                                Text('Balanced',
                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight:FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                    ),
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  ),
                                )
                              ],
                            ) 
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 20.0),
                            child: Row(
                              spacing: 12,
                              children: [
                                Switch(
                                  value: strategy == 'Aggressive', 
                                  inactiveTrackColor: Colors.grey,
                                  onChanged: (val)=>setState(()=>strategy='Aggressive')
                                ),
                                Text('Aggressive',
                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight:FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                    ),
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  ),
                                )
                              ],
                            ) 
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 24.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              spacing: 12,
                              children: [
                                FFButtonWidget(
                                  onPressed: () async {
                                    Navigator.pop(context, '');
                                  },
                                  text: 'Cancel',
                                  options: FFButtonOptions(
                                    height: 50.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primaryText,
                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context).primary,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                    ),
                                    elevation: 0.0,
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).primaryText,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                FFButtonWidget(
                                  onPressed: () async {
                                    Navigator.pop(context, strategy);
                                  },
                                  text: 'Confirm',
                                  options: FFButtonOptions(
                                    height: 50.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context).primaryText,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                    ),
                                    elevation: 0.0,
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).primary,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                SizedBox(width: 9)
                              ],
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
    );
  }
}
