import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tasker/models/task_chip.dart';
import 'package:uuid/uuid.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@freezed
class Task with _$Task implements TaskChip {
  const factory Task({
    required String id,
    required String title,
    String? description,
    // ignore: invalid_annotation_target
    @JsonKey(
      fromJson: _isDoneFromJson,
      toJson: _isDoneToJson,
      defaultValue: false,
    )
    @Default(false)
    bool isDone,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  factory Task.newCreate({required String title, String? description}) {
    final uuid = Uuid();
    print(Task(id: uuid.v4(), title: title, description: description));
    print(Task(id: "joge", title: title));
    return Task(id: uuid.v4(), title: title, description: description);
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

bool _isDoneFromJson(dynamic value) {
  if (value is bool) {
    return value;
  } else if (value is int) {
    return value == 1;
  } else {
    return false; // デフォルト値
  }
}

int _isDoneToJson(bool value) => value ? 1 : 0;
