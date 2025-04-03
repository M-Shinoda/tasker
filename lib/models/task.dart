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

  // @override
  // // TODO: implement description
  // String? get description => throw UnimplementedError();

  // @override
  // // TODO: implement id
  // int? get id => throw UnimplementedError();

  // @override
  // // TODO: implement isDone
  // bool get isDone => throw UnimplementedError();

  // @override
  // // TODO: implement title
  // String get title => throw UnimplementedError();

  // @override
  // Map<String, dynamic> toJson() {
  //   // TODO: implement toJson
  //   throw UnimplementedError();
  // }

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
