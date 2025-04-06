// ignore_for_file: invalid_annotation_target

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_basic_info.freezed.dart';
part 'task_basic_info.g.dart';

enum TaskSourceType {
  appleReminder("Appleリマインダー"),
  task("タスク");

  const TaskSourceType(this.displayName);
  final String displayName;
}

@freezed
class TaskBasicInfo with _$TaskBasicInfo {
  const factory TaskBasicInfo({
    String? id,
    required String taskId,
    @JsonKey(fromJson: _datetimeFromFirestore, toJson: _datetimeToFirestore)
    required DateTime createdAt,
    @JsonKey(fromJson: _datetimeFromFirestore, toJson: _datetimeToFirestore)
    required DateTime updatedAt,
    required int targetDue,
    @JsonKey(fromJson: _datetimeFromFirestore, toJson: _datetimeToFirestore)
    required DateTime targetStartAt,
    required int concentrateDue,
    required int distractDue,
    required TaskSourceType taskSourceType,
    @Default(false) bool isDone,
  }) = _TaskBasicInfo;

  factory TaskBasicInfo.fromJson(Map<String, dynamic> json) =>
      _$TaskBasicInfoFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

DateTime _datetimeFromFirestore(dynamic value) {
  if (value is Timestamp) {
    return value.toDate();
  } else if (value is DateTime) {
    return value;
  } else {
    throw Exception("Invalid type");
  }
}

Timestamp _datetimeToFirestore(dynamic value) {
  if (value is DateTime) {
    return Timestamp.fromDate(value);
  } else if (value is Timestamp) {
    return value;
  } else {
    throw Exception("Invalid type");
  }
}
