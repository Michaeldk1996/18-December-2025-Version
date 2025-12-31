import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

dynamic getMemberShipLevel(dynamic userInfo) {
  String membershipLevel = "1";
  if (userInfo != null) {
    String membershipId = userInfo['membership_id'];
    String membershipStatus = userInfo['status'];
    if (membershipStatus == 'active') {
      membershipLevel = membershipId;
    }
  }
  return membershipLevel;
}

dynamic getUserInfo(List<dynamic> userList) {
  if (userList.length > 0) {
    return userList[userList.length - 1];
  }
  return null;
}

List<dynamic> convertStringToJSONList(List<String> input) {
  List<dynamic> result = [];
  for (final obj in input) {
    dynamic temp = json.decode(obj);
    result.add(temp);
  }
  return result;
}

dynamic getAnalyses(
  String title,
  String body,
) {
  return {"title": title, "body": body};
}

String getAnalysisTitle(String analysis) {
  final obj = json.decode(analysis);
  return obj["title"];
}

String getAnalysisBody(String analysis) {
  final obj = json.decode(analysis);
  return obj["body"];
}

List<String> convertJSONToStringList(List<dynamic> input) {
  List<String> result = [];
  for (final obj in input) {
    String temp = json.encode(obj);
    result.add(temp);
  }
  return result;
}

double calculateBetPrice(
  String bankroll,
  String reliability,
  bool baseMethod,
) {
  if (baseMethod) {
    double result = double.parse(bankroll) * double.parse(reliability) / 100.00;
    return result;
  } else {
    double result =
        double.parse(bankroll) * double.parse(reliability) * 1.5 / 100.00;
    return result;
  }
}

String getBetPercent(String originalPercent) {
  double betPercent = double.parse(originalPercent) * 1.5;
  // return betPercent.toString();

  String formattedBetPercent =
      betPercent.toStringAsFixed(10); // Use a large number for safety
  double trimmedBetPercent = double.parse(formattedBetPercent);
  return trimmedBetPercent.toString();
}

DateTime getNextYearDate(DateTime currentTime) {
  DateTime futureTime = currentTime.add(Duration(days: 365));
  return futureTime;
}

bool checkSignupResult(dynamic responseData) {
  if (responseData['user'] is bool && responseData['user'] == false) {
    return true;
  } else {
    return false;
  }
}
