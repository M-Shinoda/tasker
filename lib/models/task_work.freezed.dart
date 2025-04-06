// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_work.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TaskWork {

 String? get id; String get taskId; DateTime get createdAt; DateTime? get startedAt; DateTime? get endedAt; TaskWorkType get type; DateTime get updatedAt; bool get isDone;
/// Create a copy of TaskWork
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskWorkCopyWith<TaskWork> get copyWith => _$TaskWorkCopyWithImpl<TaskWork>(this as TaskWork, _$identity);

  /// Serializes this TaskWork to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskWork&&(identical(other.id, id) || other.id == id)&&(identical(other.taskId, taskId) || other.taskId == taskId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.endedAt, endedAt) || other.endedAt == endedAt)&&(identical(other.type, type) || other.type == type)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isDone, isDone) || other.isDone == isDone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,taskId,createdAt,startedAt,endedAt,type,updatedAt,isDone);

@override
String toString() {
  return 'TaskWork(id: $id, taskId: $taskId, createdAt: $createdAt, startedAt: $startedAt, endedAt: $endedAt, type: $type, updatedAt: $updatedAt, isDone: $isDone)';
}


}

/// @nodoc
abstract mixin class $TaskWorkCopyWith<$Res>  {
  factory $TaskWorkCopyWith(TaskWork value, $Res Function(TaskWork) _then) = _$TaskWorkCopyWithImpl;
@useResult
$Res call({
 String? id, String taskId, DateTime createdAt, DateTime? startedAt, DateTime? endedAt, TaskWorkType type, DateTime updatedAt, bool isDone
});




}
/// @nodoc
class _$TaskWorkCopyWithImpl<$Res>
    implements $TaskWorkCopyWith<$Res> {
  _$TaskWorkCopyWithImpl(this._self, this._then);

  final TaskWork _self;
  final $Res Function(TaskWork) _then;

/// Create a copy of TaskWork
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? taskId = null,Object? createdAt = null,Object? startedAt = freezed,Object? endedAt = freezed,Object? type = null,Object? updatedAt = null,Object? isDone = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,taskId: null == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,startedAt: freezed == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,endedAt: freezed == endedAt ? _self.endedAt : endedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TaskWorkType,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,isDone: null == isDone ? _self.isDone : isDone // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _TaskWork implements TaskWork {
  const _TaskWork({this.id, required this.taskId, required this.createdAt, this.startedAt, this.endedAt, required this.type, required this.updatedAt, this.isDone = false});
  factory _TaskWork.fromJson(Map<String, dynamic> json) => _$TaskWorkFromJson(json);

@override final  String? id;
@override final  String taskId;
@override final  DateTime createdAt;
@override final  DateTime? startedAt;
@override final  DateTime? endedAt;
@override final  TaskWorkType type;
@override final  DateTime updatedAt;
@override@JsonKey() final  bool isDone;

/// Create a copy of TaskWork
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TaskWorkCopyWith<_TaskWork> get copyWith => __$TaskWorkCopyWithImpl<_TaskWork>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TaskWorkToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TaskWork&&(identical(other.id, id) || other.id == id)&&(identical(other.taskId, taskId) || other.taskId == taskId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.endedAt, endedAt) || other.endedAt == endedAt)&&(identical(other.type, type) || other.type == type)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isDone, isDone) || other.isDone == isDone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,taskId,createdAt,startedAt,endedAt,type,updatedAt,isDone);

@override
String toString() {
  return 'TaskWork(id: $id, taskId: $taskId, createdAt: $createdAt, startedAt: $startedAt, endedAt: $endedAt, type: $type, updatedAt: $updatedAt, isDone: $isDone)';
}


}

/// @nodoc
abstract mixin class _$TaskWorkCopyWith<$Res> implements $TaskWorkCopyWith<$Res> {
  factory _$TaskWorkCopyWith(_TaskWork value, $Res Function(_TaskWork) _then) = __$TaskWorkCopyWithImpl;
@override @useResult
$Res call({
 String? id, String taskId, DateTime createdAt, DateTime? startedAt, DateTime? endedAt, TaskWorkType type, DateTime updatedAt, bool isDone
});




}
/// @nodoc
class __$TaskWorkCopyWithImpl<$Res>
    implements _$TaskWorkCopyWith<$Res> {
  __$TaskWorkCopyWithImpl(this._self, this._then);

  final _TaskWork _self;
  final $Res Function(_TaskWork) _then;

/// Create a copy of TaskWork
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? taskId = null,Object? createdAt = null,Object? startedAt = freezed,Object? endedAt = freezed,Object? type = null,Object? updatedAt = null,Object? isDone = null,}) {
  return _then(_TaskWork(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,taskId: null == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,startedAt: freezed == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,endedAt: freezed == endedAt ? _self.endedAt : endedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TaskWorkType,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,isDone: null == isDone ? _self.isDone : isDone // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
