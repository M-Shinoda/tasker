import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@freezed
class Task with _$Task {
  const factory Task({
    int? id,
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
