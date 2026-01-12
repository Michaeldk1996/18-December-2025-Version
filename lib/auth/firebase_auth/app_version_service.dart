import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppVersionService {
  static Future<ForceUpdateResult> checkUpdate() async {
    final doc = await FirebaseFirestore.instance
        .collection('settings')
        .doc('app_version')
        .get();

    if (!doc.exists) {
      return ForceUpdateResult.none();
    }

    final data = doc.data()!;

    final packageInfo = await PackageInfo.fromPlatform();
    final currentVersion = packageInfo.version;

    final minVersion = Platform.isAndroid
        ? data['min_android']
        : data['min_ios'];

    final force = data['force'] ?? false;

    final needUpdate =
        _isVersionLower(currentVersion, minVersion);

    return ForceUpdateResult(
      needUpdate: needUpdate,
      force: force,
      storeUrl: Platform.isAndroid
          ? data['store_url_android']
          : data['store_url_ios'],
    );
  }

  static bool _isVersionLower(String current, String minimum) {
    final c = current.split('.').map(int.parse).toList();
    final m = minimum.split('.').map(int.parse).toList();

    for (int i = 0; i < m.length; i++) {
      final cv = i < c.length ? c[i] : 0;
      final mv = m[i];

      if (cv < mv) return true;
      if (cv > mv) return false;
    }
    return false;
  }
}

class ForceUpdateResult {
  final bool needUpdate;
  final bool force;
  final String? storeUrl;

  ForceUpdateResult({
    required this.needUpdate,
    required this.force,
    this.storeUrl,
  });

  factory ForceUpdateResult.none() => ForceUpdateResult(
        needUpdate: false,
        force: false,
      );
}