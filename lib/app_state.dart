import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<dynamic> _analyses = [];
  List<dynamic> get analyses => _analyses;
  set analyses(List<dynamic> value) {
    _analyses = value;
  }

  void addToAnalyses(dynamic value) {
    analyses.add(value);
  }

  void removeFromAnalyses(dynamic value) {
    analyses.remove(value);
  }

  void removeAtIndexFromAnalyses(int index) {
    analyses.removeAt(index);
  }

  void updateAnalysesAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    analyses[index] = updateFn(_analyses[index]);
  }

  void insertAtIndexInAnalyses(int index, dynamic value) {
    analyses.insert(index, value);
  }

  List<DocumentReference> _allUsers = [];
  List<DocumentReference> get allUsers => _allUsers;
  set allUsers(List<DocumentReference> value) {
    _allUsers = value;
  }

  void addToAllUsers(DocumentReference value) {
    allUsers.add(value);
  }

  void removeFromAllUsers(DocumentReference value) {
    allUsers.remove(value);
  }

  void removeAtIndexFromAllUsers(int index) {
    allUsers.removeAt(index);
  }

  void updateAllUsersAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    allUsers[index] = updateFn(_allUsers[index]);
  }

  void insertAtIndexInAllUsers(int index, DocumentReference value) {
    allUsers.insert(index, value);
  }
}
