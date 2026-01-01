import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommunicationRecord extends FirestoreRecord {
  CommunicationRecord._(
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

  // "group" field.
  String? _group;
  String get group => _group ?? '';
  bool hasGroup() => _group != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "tipType" field.
  String? _tipType;
  String get tipType => _tipType ?? '';
  bool hasTipType() => _tipType != null;

  // "imageUrl" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  bool hasImageUrl() => _imageUrl != null;

  // "imageUrl" field.
  String? _pdfUrl;
  String get pdfUrl => _pdfUrl ?? '';
  bool hasPdfUrl() => _pdfUrl != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "analyses" field.
  List<String>? _analyses;
  List<String> get analyses => _analyses ?? const [];
  bool hasAnalyses() => _analyses != null;

  // "reliability" field.
  double? _reliability;
  double get reliability => _reliability ?? 0.0;
  bool hasReliability() => _reliability != null;

  // "minimumodd" field
  double? _minimumodd;
  double get minimumodd => _minimumodd ?? 0.0;
  bool hasMinimumOdd() => _minimumodd != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _message = snapshotData['message'] as String?;
    _group = snapshotData['group'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _tipType = snapshotData['tipType'] as String?;
    _imageUrl = snapshotData['imageUrl'] as String?;
    _pdfUrl = snapshotData['pdfUrl'] as String?;
    _type = snapshotData['type'] as String?;
    _analyses = getDataList(snapshotData['analyses']);
    _reliability = castToType<double>(snapshotData['reliability']);
    _minimumodd = castToType<double>(snapshotData['minimumodd']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('communication');

  static Stream<CommunicationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CommunicationRecord.fromSnapshot(s));

  static Future<CommunicationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CommunicationRecord.fromSnapshot(s));

  static CommunicationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CommunicationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommunicationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommunicationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CommunicationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CommunicationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCommunicationRecordData({
  String? title,
  String? message,
  String? group,
  DateTime? date,
  String? tipType,
  String? imageUrl,
  String? pdfUrl,
  String? type,
  double? reliability,
  double? minimumodd
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'message': message,
      'group': group,
      'date': date,
      'tipType': tipType,
      'imageUrl': imageUrl,
      'pdfUrl': pdfUrl,
      'type': type,
      'reliability': reliability,
      'minimumodd': minimumodd
    }.withoutNulls,
  );

  return firestoreData;
}

class CommunicationRecordDocumentEquality
    implements Equality<CommunicationRecord> {
  const CommunicationRecordDocumentEquality();

  @override
  bool equals(CommunicationRecord? e1, CommunicationRecord? e2) {
    const listEquality = ListEquality();
    return e1?.title == e2?.title &&
        e1?.message == e2?.message &&
        e1?.group == e2?.group &&
        e1?.date == e2?.date &&
        e1?.tipType == e2?.tipType &&
        e1?.imageUrl == e2?.imageUrl &&
        e1?.type == e2?.type &&
        listEquality.equals(e1?.analyses, e2?.analyses) &&
        e1?.reliability == e2?.reliability &&
        e1?.minimumodd == e2?.minimumodd;
  }

  @override
  int hash(CommunicationRecord? e) => const ListEquality().hash([
        e?.title,
        e?.message,
        e?.group,
        e?.date,
        e?.tipType,
        e?.imageUrl,
        e?.type,
        e?.analyses,
        e?.reliability,
        e?.minimumodd
      ]);

  @override
  bool isValidKey(Object? o) => o is CommunicationRecord;
}
