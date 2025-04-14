// ignore_for_file: invalid_annotation_target

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_work.freezed.dart';
part 'task_work.g.dart';

enum TaskWorkType {
  concentrate("集中"), // 集中
  distract("休憩"); // 休憩

  const TaskWorkType(this.displayName);
  final String displayName;
}

@freezed
class TaskWork with _$TaskWork {
  const factory TaskWork({
    String? id,
    required String taskId,
    @JsonKey(fromJson: _datetimeFromFirestore, toJson: _datetimeToFirestore)
    required DateTime createdAt,
    @JsonKey(
      fromJson: _nullableDatetimeFromFirestore,
      toJson: _datetimeToFirestore,
    )
    DateTime? startedAt,
    @JsonKey(
      fromJson: _nullableDatetimeFromFirestore,
      toJson: _datetimeToFirestore,
    )
    DateTime? endedAt,
    required TaskWorkType type,
    @JsonKey(fromJson: _datetimeFromFirestore, toJson: _datetimeToFirestore)
    required DateTime updatedAt,
    @Default(false) bool isDone,
  }) = _TaskWork;

  factory TaskWork.fromJson(Map<String, dynamic> json) =>
      _$TaskWorkFromJson(json);

  factory TaskWork.newCreate({
    required String taskId,
    required DateTime createdAt,
    required DateTime? startedAt,
    required DateTime? endedAt,
    required TaskWorkType type,
  }) {
    final createdAt = DateTime.now();
    return TaskWork(
      taskId: taskId,
      createdAt: createdAt,
      startedAt: startedAt,
      endedAt: endedAt,
      type: type,
      updatedAt: createdAt,
    );
  }

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

DateTime? _nullableDatetimeFromFirestore(dynamic value) {
  if (value == null) return null;
  if (value is Timestamp) {
    return value.toDate();
  } else if (value is DateTime) {
    return value;
  } else {
    throw Exception("Invalid type");
  }
}

Timestamp? _datetimeToFirestore(dynamic value) {
  if (value == null) return null;
  if (value is DateTime) {
    return Timestamp.fromDate(value);
  } else if (value is Timestamp) {
    return value;
  } else {
    throw Exception("Invalid type");
  }
}
