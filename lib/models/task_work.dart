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
    required DateTime createdAt,
    DateTime? startedAt,
    DateTime? endedAt,
    required TaskWorkType type,
    required DateTime updatedAt,
    @Default(false) bool isDone,
  }) = _TaskWork;

  factory TaskWork.fromJson(Map<String, dynamic> json) =>
      _$TaskWorkFromJson(json);

  factory TaskWork.fromFirestore(Map<String, dynamic> docData) {
    return TaskWork(
      id: docData['id'] as String?,
      taskId: docData['taskId'] as String,
      createdAt: (docData['createdAt'] as Timestamp).toDate(),
      startedAt: (docData['startedAt'] as Timestamp?)?.toDate(),
      endedAt: (docData['endedAt'] as Timestamp?)?.toDate(),
      type: TaskWorkType.values.firstWhere(
        (e) =>
            e.name.toLowerCase() == (docData['type'] as String).toLowerCase(),
        orElse: () => TaskWorkType.concentrate,
      ),
      updatedAt: (docData['updatedAt'] as Timestamp).toDate(),
      isDone: docData['isDone'] as bool? ?? false,
    );
  }
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
