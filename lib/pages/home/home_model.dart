import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/tip_item/tip_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  Local state fields for this page.

  int? pageNumber = 1;

  int? tipMode = 1;

  bool floatingAction = false;

  int? subscriptionMode = 1;

  bool passwordVisible = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Home widget.
  List<UsersRecord>? userList;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  SettingsRecord? settingsResponse;
  // Stores action output result for [Backend Call - API (createCheckoutSession)] action in Button widget.
  ApiCallResponse? apiResultd8s;
  // Stores action output result for [RevenueCat - Purchase] action in Button widget.
  bool? didPurchaseUpgrade;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Container widget.
  String? bankrollResult;
  // Models for TipItem dynamic component.
  late FlutterFlowDynamicModels<TipItemModel> tipItemModels1;
  // Stores action output result for [Bottom Sheet - ActionSelector] action in TipItem widget.
  String? selectedAction;
  // Models for TipItem dynamic component.
  late FlutterFlowDynamicModels<TipItemModel> tipItemModels2;
  // Stores action output result for [Bottom Sheet - ActionSelector] action in TipItem widget.
  String? selectedAction2;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  SettingsRecord? settings;
  // Stores action output result for [Backend Call - API (createCheckoutSession)] action in Button widget.
  ApiCallResponse? apiResult3fa;
  // Stores action output result for [RevenueCat - Purchase] action in Button widget.
  bool? didPurchaseSilver;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  SettingsRecord? approveState;
  // Stores action output result for [Backend Call - API (createCheckoutSession)] action in Button widget.
  ApiCallResponse? apiResultr4n;
  // Stores action output result for [RevenueCat - Purchase] action in Button widget.
  bool? didPurchaseGold;

  @override
  void initState(BuildContext context) {
    tipItemModels1 = FlutterFlowDynamicModels(() => TipItemModel());
    tipItemModels2 = FlutterFlowDynamicModels(() => TipItemModel());
  }

  @override
  void dispose() {
    tipItemModels1.dispose();
    tipItemModels2.dispose();
  }
}
