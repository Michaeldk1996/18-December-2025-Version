import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  bool hasRole() => _role != null;

  // "membership" field.
  String? _membership;
  String get membership => _membership ?? '';
  bool hasMembership() => _membership != null;
  void setMembership(String val) => _membership = val;

  // "billingAddress" field.
  String? _billingAddress;
  String get billingAddress => _billingAddress ?? '';
  bool hasBillingAddress() => _billingAddress != null;

  // "username" field.
  String? _username;
  String get username => _username ?? '';
  bool hasUsername() => _username != null;

  // "bankroll" field.
  String? _bankroll;
  String get bankroll => _bankroll ?? '';
  bool hasBankroll() => _bankroll != null;

  // "stakingStrategy" field
  String? _stakingStrategy;
  String get stakingStrategy => _stakingStrategy ?? '';
  bool hasStakingStrategy() => _stakingStrategy != null;

  // "subscriptionDate" field.
  DateTime? _subscriptionDate;
  DateTime? get subscriptionDate => _subscriptionDate;
  bool hasSubscriptionDate() => _subscriptionDate != null;

  // "wp_user_id" field.
  String? _wpUserId;
  String get wpUserId => _wpUserId ?? '';
  bool hasWpUserId() => _wpUserId != null;

  // "expire_date" field.
  DateTime? _expireDate;
  DateTime? get expireDate => _expireDate;
  bool hasExpireDate() => _expireDate != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _role = snapshotData['role'] as String?;
    _membership = snapshotData['membership'] as String?;
    _billingAddress = snapshotData['billingAddress'] as String?;
    _username = snapshotData['username'] as String?;
    _bankroll = snapshotData['bankroll'] as String?;
    _stakingStrategy = snapshotData['stakingStrategy'] as String?;
    _subscriptionDate = snapshotData['subscriptionDate'] as DateTime?;
    _wpUserId = snapshotData['wp_user_id'] as String?;
    _expireDate = snapshotData['expire_date'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? role,
  String? membership,
  String? billingAddress,
  String? username,
  String? bankroll,
  String? stakingStrategy,
  DateTime? subscriptionDate,
  String? wpUserId,
  DateTime? expireDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'role': role,
      'membership': membership,
      'billingAddress': billingAddress,
      'username': username,
      'bankroll': bankroll,
      'stakingStrategy': stakingStrategy,
      'subscriptionDate': subscriptionDate,
      'wp_user_id': wpUserId,
      'expire_date': expireDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.role == e2?.role &&
        e1?.membership == e2?.membership &&
        e1?.billingAddress == e2?.billingAddress &&
        e1?.username == e2?.username &&
        e1?.bankroll == e2?.bankroll &&
        e1?.stakingStrategy == e2?.stakingStrategy &&
        e1?.subscriptionDate == e2?.subscriptionDate &&
        e1?.wpUserId == e2?.wpUserId &&
        e1?.expireDate == e2?.expireDate;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.role,
        e?.membership,
        e?.billingAddress,
        e?.username,
        e?.bankroll,
        e?.stakingStrategy,
        e?.subscriptionDate,
        e?.wpUserId,
        e?.expireDate
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
