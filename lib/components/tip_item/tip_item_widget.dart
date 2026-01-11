import 'package:flutter/cupertino.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';

import '../widgets/pdf_viewer.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'tip_item_model.dart';
export 'tip_item_model.dart';

class TipItemWidget extends StatefulWidget {
  const TipItemWidget({
    super.key,
    this.title,
    this.message,
    this.group,
    this.tipType,
    this.date,
    this.type,
    this.analyses,
    this.reliability,
    this.minimumodd,
    this.imageUrl,
    this.pdfUrl,
  });

  final String? title;
  final String? message;
  final String? group;
  final String? tipType;
  final DateTime? date;
  final String? type;
  final List<String>? analyses;
  final double? reliability;
  final double? minimumodd;
  final String? imageUrl;
  final String? pdfUrl;

  @override
  State<TipItemWidget> createState() => _TipItemWidgetState();
}

class _TipItemWidgetState extends State<TipItemWidget> {
  late TipItemModel _model;

  Widget analysisPanel() {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 26.0),
      child: Builder(
        builder: (context) {
          final analysis = widget.analyses?.toList() ?? [];

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(analysis.length, (analysisIndex) {
              final analysisItem = analysis[analysisIndex];
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            functions.getAnalysisTitle(analysisItem),
                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  ),
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: MarkdownBody(
                          data: functions.getAnalysisBody(analysisItem),
                          styleSheet: MarkdownStyleSheet(
                              p: FlutterFlowTheme.of(context).bodyMedium.override(
                                font: GoogleFonts.inter(
                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                ),
                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                fontSize: 14.0,
                                letterSpacing: 0.5,
                                lineHeight: 1.5,
                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                              ),
                              strong: FlutterFlowTheme.of(context).bodyMedium.override(
                                font: GoogleFonts.inter(
                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                ),
                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                fontSize: 14.0,
                                letterSpacing: 0.5,
                                lineHeight: 1.5,
                                fontWeight: FontWeight.w700,
                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                              )),
                        ),
                      )
                      // Expanded(
                      //   child: Text(
                      //     functions.getAnalysisBody(analysisItem),
                      //     style: FlutterFlowTheme.of(context).bodyMedium.override(
                      //       font: GoogleFonts.inter(
                      //         fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      //         fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      //       ),
                      //       color: FlutterFlowTheme.of(context).secondaryBackground,
                      //       fontSize: 14.0,
                      //       letterSpacing: 0.0,
                      //       fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      //       fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ],
              );
            }).divide(SizedBox(height: 12.0)),
          );
        },
      ),
    );
  }

  void previewPdf() async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => PdfPreviewScreen(url: widget.pdfUrl!),
      ),
    );
  }

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TipItemModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (widget.type == 'Tip')
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: EdgeInsets.all(2.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryText,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    width: 0.0,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primary,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(0.0),
                          topLeft: Radius.circular(6.0),
                          topRight: Radius.circular(6.0),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                            child: Text(
                              dateTimeFormat("E, d MMM, y H:mm", widget.date),
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
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                            child: Text(
                              widget.title!,
                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                font: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                ),
                                color: Colors.white,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if ((widget.imageUrl ?? '').isNotEmpty)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(12.0, 24.0, 12.0, 0.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            widget.imageUrl!,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Stake'.toUpperCase(),
                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  ),
                                  color: Colors.black,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (valueOrDefault(currentUserDocument?.bankroll, '') != '')
                                AuthUserStreamWidget(
                                  builder: (context) => Text(
                                    '${functions.calculateReliability(widget.reliability!.toString(), valueOrDefault(currentUserDocument?.stakingStrategy, '')).toStringAsFixed(2)}  %',
                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.w700,
                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                      ),
                                      color: Colors.black,
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 12.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Stake Amount'.toUpperCase(),
                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.w700,
                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                      ),
                                      color: Colors.black,
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                    ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (valueOrDefault(currentUserDocument?.bankroll, '') != '')
                                AuthUserStreamWidget(
                                  builder: (context) => Text(
                                    '${functions.calculateBetPrice(valueOrDefault(currentUserDocument?.bankroll, ''), widget.reliability!.toString(), valueOrDefault(currentUserDocument?.stakingStrategy, '')).toStringAsFixed(2)}  €',
                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                          font: GoogleFonts.inter(
                                            fontWeight: FontWeight.w700,
                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                          ),
                                          color: Colors.black,
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w700,
                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                        ),
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 2.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Minimum Odd'.toUpperCase(),
                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  ),
                                  color: Colors.black,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (valueOrDefault(currentUserDocument?.bankroll, '') != '')
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      '${widget.minimumodd!.toStringAsFixed(2)} ',
                                      // '${functions.getBetPercent(widget.reliability!.toString())} % (€ ${functions.calculateBetPrice(valueOrDefault(currentUserDocument?.bankroll, ''), widget.reliability!.toString(), false).toString()})',
                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.w700,
                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                        ),
                                        color: Colors.black,
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w700,
                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                      ),
                                    ),
                                    Icon(Icons.info_outline_rounded, size: 13, fontWeight: FontWeight.w700)
                                  ],
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Divider(),
                    ),
                    analysisPanel(),
                  ],
                ),
              ),
            ),
          ),
        if (widget.type != 'Tip')
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: EdgeInsets.all(2.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryText,
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(
                    width: 1.0,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primary,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(0.0),
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                            child: Text(
                              dateTimeFormat("E, d MMM, y H:mm", widget.date),
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
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Text(
                                    widget.title!,
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                          font: GoogleFonts.inter(
                                            fontWeight: FontWeight.w500,
                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context).primaryText,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    if ((widget.imageUrl ?? '').isNotEmpty)
                      Container(
                        padding: EdgeInsetsDirectional.fromSTEB(12.0, 24.0, 12.0, 0.0),
                        margin: EdgeInsets.only(bottom: 12),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            widget.imageUrl!,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    if ((widget.pdfUrl ?? '').isNotEmpty)
                      GestureDetector(
                          onTap: previewPdf,
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(12.0, 24.0, 12.0, 0.0),
                            child: Container(
                              height: 125,
                              width: 100,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.black12)),
                              child: FutureBuilder(
                                  future: PdfPreviewScreen.buildPdfThumbnail(widget.pdfUrl!),
                                  builder: (_, snap) {
                                    if (snap.hasData) {
                                      return snap.data!;
                                    }
                                    return Center(child: CupertinoActivityIndicator());
                                  }),
                            ),
                          )),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12.0, 24.0, 12.0, 24.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: MarkdownBody(
                              data: widget.message!,
                              styleSheet: MarkdownStyleSheet(
                                  p: FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                    fontSize: 14.0,
                                    letterSpacing: 0.5,
                                    lineHeight: 1.5,
                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                    ),
                                  strong: FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                    ),
                                    color: Colors.black,
                                    fontSize: 14.0,
                                    letterSpacing: 0.5,
                                    lineHeight: 1.5,
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  )),
                            ),
                          )
                          // Expanded(
                          //   child: Text(
                          //     widget.message!,
                          //     style: FlutterFlowTheme.of(context).bodyMedium.override(
                          //       font: GoogleFonts.inter(
                          //         fontWeight: FontWeight.w500,
                          //         fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                          //       ),
                          //       color: Colors.black,
                          //       fontSize: 15.0,
                          //       letterSpacing: 0.0,
                          //       fontWeight: FontWeight.w500,
                          //       fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    analysisPanel(),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}
