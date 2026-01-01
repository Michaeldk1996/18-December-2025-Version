import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MasterclassZoneRecord extends FirestoreRecord {
  MasterclassZoneRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "imageUrl" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  bool hasImageUrl() => _imageUrl != null;

  // "userId" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _message = snapshotData['message'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _imageUrl = snapshotData['imageUrl'] as String?;
    _userId = snapshotData['userId'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('masterclass_zone');

  static Stream<MasterclassZoneRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MasterclassZoneRecord.fromSnapshot(s));

  static Future<MasterclassZoneRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MasterclassZoneRecord.fromSnapshot(s));

  static MasterclassZoneRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MasterclassZoneRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MasterclassZoneRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MasterclassZoneRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MasterclassZoneRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MasterclassZoneRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMasterclassZoneRecordData({
  String? title,
  String? message,
  DateTime? date,
  String? imageUrl,
  DocumentReference? userId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'message': message,
      'date': date,
      'imageUrl': imageUrl,
      'userId': userId,
    }.withoutNulls,
  );

  return firestoreData;
}

class MasterclassZoneRecordDocumentEquality
    implements Equality<MasterclassZoneRecord> {
  const MasterclassZoneRecordDocumentEquality();

  @override
  bool equals(MasterclassZoneRecord? e1, MasterclassZoneRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.message == e2?.message &&
        e1?.date == e2?.date &&
        e1?.imageUrl == e2?.imageUrl &&
        e1?.userId == e2?.userId;
  }

  @override
  int hash(MasterclassZoneRecord? e) => const ListEquality()
      .hash([e?.title, e?.message, e?.date, e?.imageUrl, e?.userId]);

  @override
  bool isValidKey(Object? o) => o is MasterclassZoneRecord;
}
