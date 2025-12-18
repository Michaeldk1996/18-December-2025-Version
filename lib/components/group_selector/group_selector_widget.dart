import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'group_selector_model.dart';
export 'group_selector_model.dart';

class GroupSelectorWidget extends StatefulWidget {
  const GroupSelectorWidget({
    super.key,
    required this.currentGroup,
  });

  final String? currentGroup;

  @override
  State<GroupSelectorWidget> createState() => _GroupSelectorWidgetState();
}

class _GroupSelectorWidgetState extends State<GroupSelectorWidget> {
  late GroupSelectorModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GroupSelectorModel());

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
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 40.0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'GROUP_SELECTOR_Container_5e3r71f8_ON_TAP');
                        logFirebaseEvent('Container_bottom_sheet');
                        Navigator.pop(context, 'Public');
                      },
                      child: Container(
                        width: double.infinity,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: valueOrDefault<Color>(
                            widget.currentGroup == 'Public'
                                ? Color(0x14919EAB)
                                : FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                            Color(0x14919EAB),
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          'Public',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                font: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                                color: widget.currentGroup == 'Public'
                                    ? Colors.white
                                    : FlutterFlowTheme.of(context).primaryText,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 1.0,
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'GROUP_SELECTOR_Container_swrjfd95_ON_TAP');
                      logFirebaseEvent('Container_bottom_sheet');
                      Navigator.pop(context, 'Premium');
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: widget.currentGroup == 'Premium'
                            ? Color(0x14919EAB)
                            : FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        'Premium',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color: widget.currentGroup == 'Premium'
                                  ? Colors.white
                                  : FlutterFlowTheme.of(context).primaryText,
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 1.0,
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'GROUP_SELECTOR_Container_cejg16u9_ON_TAP');
                        logFirebaseEvent('Container_bottom_sheet');
                        Navigator.pop(context, 'Both');
                      },
                      child: Container(
                        width: double.infinity,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: widget.currentGroup == 'Both'
                              ? Color(0x14919EAB)
                              : FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          'Both',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                font: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                                color: widget.currentGroup == 'Both'
                                    ? Colors.white
                                    : FlutterFlowTheme.of(context).primaryText,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
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
      ],
    );
  }
}
