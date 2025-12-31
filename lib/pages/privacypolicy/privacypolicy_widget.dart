import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'privacypolicy_model.dart';
export 'privacypolicy_model.dart';

class PrivacypolicyWidget extends StatefulWidget {
  const PrivacypolicyWidget({super.key});

  static String routeName = 'privacypolicy';
  static String routePath = '/privacypolicy';

  @override
  State<PrivacypolicyWidget> createState() => _PrivacypolicyWidgetState();
}

class _PrivacypolicyWidgetState extends State<PrivacypolicyWidget> {
  late PrivacypolicyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PrivacypolicyModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'privacypolicy'});
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
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 20.0,
                    borderWidth: 1.0,
                    buttonSize: 40.0,
                    icon: Icon(
                      Icons.arrow_back,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      logFirebaseEvent(
                          'PRIVACYPOLICY_PAGE_arrow_back_ICN_ON_TAP');
                      logFirebaseEvent('IconButton_navigate_back');
                      context.safePop();
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    'Privacy Policy\n\nThe Company respects the privacy of its website visitors, in particular their rights regarding the automatic processing of personal data. \n\nWe have therefore formulated and implemented a policy on complete transparency with our customers regarding the processing of personal data, its purpose(s) and the possibilities to exercise your legal rights in the best possible way.\n\nUntil you accept the use of cookies and other tracking devices, we will not place any non-anonymised analytical cookies and / or tracking cookies on your computer, mobile phone or tablet.\n\nWith the continued visit of this Platform you accept these terms of use and you accept the use of cookies and other tracking systems, unless we have provided for another method of accepting cookies on our application.\n\nThe current available version of this privacy policy is the only version that applies while visiting our Platform until a new version replaces the current version.\n\nArticle 1 – Definitions\n\nPlatform (hereinafter: “Platform”) bspconsult\nParty responsible for processing personal data (hereinafter: “the controller”): The Company\n\n\nArticle 2 – Access to the Platform\n\nAccess to and use of the platform are strictly personal. You will refrain from using the data and information of this website for your own commercial, political or advertising purposes, as well as for any commercial offers, in particular unsolicited electronic offers.\n\n\nArticle 3 – Platform content\n\nAll brands, images, texts, comments, illustrations (animated) images, video images, sounds and all the technical applications that can be used to operate this Platform and more generally all the components used on this website, are protected by the laws on intellectual property. \n\nAny reproduction, repetition, use or modification, by any means whatsoever, of all or just part of it, including technical applications, without the prior written permission of the controller, is strictly prohibited. \n\nThe fact that the controller may not take immediate action against any infringement, cannot be considered as a tacit consent, nor of a waiver of any right to prosecute the infringing party.\n\nArticle 4 – Management of the Platform\n\nFor the purpose of proper management of the Platform, the controller may at any time:\n\nsuspend, interrupt, reduce or decline the access to the website for a particular category of visitors delete all information that may disrupt the functioning of the website or conflicts with national or international laws or is contrary to internet etiquette make the Platform temporarily unavailable in order to perform updates\n\n\nArticle 5 – Responsabilities\n\nThe controller is not liable for any failure, disturbances, difficulties or interruptions in the functioning of the Platform, causing the (temporary) inaccessibility of the website or of any of its functionalities. \n\nYou, yourself, are responsible for the way you seek connection to our Platform. You need to take all appropriate steps to protect your equipment and data against hazards such as virus attacks on the Internet. \n\nFurthermore, you are responsible for which Platform you visit and what information you seek.\n\nThe controller is not liable for any legal proceedings taken against you: because of the use of the Platform or services accessible via the Internet for violating the terms of this privacy policy.\n\n The controller is not liable for any damages that incur to you or third parties or your equipment, as a result of your connection to or use of the Platform and you will refrain from any subsequent (legal) action against the controller.\n\nIf the controller is involved in a dispute because of your (ab)use of this Platform, he is entitled to (re)claim all subsequent damages from you.\n\nArticle 6 – Collection of data\n\nYour personal data will be collected by The Company\n\nPersonal data means any information relating to an identified or identifiable natural person (‘data subject’).\n\nAn identifiable natural person is one who can be identified, directly or indirectly, in particular by reference to an identifier such as a name, an identification number, location data, an online identifier or to one or more factors specific to the physical, physiological, genetic, mental, economic, cultural or social identity of that natural person.\n\nThe personal data that are collected on the Platform are used mainly by the collector in order to maintain a (commercial) relationship with you and if applicable in order to process your orders. \n\nThey are recorded in an (electronic) register.\n\nArticle 7 – Your rights regarding information\n\nPursuant to GDPR rules each data subject has the right to information on and access to, and rectification, erasure and restriction of processing of his personal data, as well as the right to object to the processing and the right to data portability.\n\nYou can exercise these rights by contacting us at management@bspconsult.com.\n\nEach request must be accompanied by a copy of a valid ID, on which you put your signature and state the address where we can contact you. \n\nWithin one month of the submitted request, you will receive an answer from us.\n\nDepending on the complexity and the number of the requests this period may be extended to two months.\n\nArticle 8 – Legal obligations\n\nIn case of infringement of any law or regulation, of which a visitor is suspected and for which the authorities require the personal data collected by the collector, they will be provided to them after an explicit and reasoned request of those authorities, after which these personal data do not fall anymore under the protection of the provisions of this Privacy policy.\n\nIf any information is necessary in order to obtain access to certain features of the website, the controller will indicate the mandatory nature of this information when requesting these data.\n\n\nArticle 9 – Collected data and commercial offers\n\nYou may receive commercial offers from the collector. If you do not wish to receive them (anymore), please send us an email to the following address: \n\nmanagement@bspconsult.com.\n\nYour personal data will not be used by our partners for commercial purposes.\n\nIf you encounter any personal data from other data subjects while visiting our Platform, you are to refrain from collection, any unauthorized use or any other act that constitutes an infringement of the privacy of the data subject(s) in question. \n\nThe collector is not responsible in these circumstances.\n\nArticle 10 – Data retention\n\nThe collected data are used and retained for the duration determined by law.\n\nArticle 11 – Imagery and products offered\nYou cannot derive any rights from the imagery that accompanies any offered product on our Platform.\n\n\nArticle 12 – Applicable Law\nThese conditions are governed by the UK law. \n\nThe court in the district where the collector has its place of business has the sole jurisdiction if any dispute regarding these conditions may arise, save when a legal exception applies.\n\n\nArticle 13 – Contact\nFor questions, product information or information about the Platform itself, please contact: Costumer Service, management@bspconsult.com .\n          ',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
