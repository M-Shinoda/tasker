// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_basic_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TaskBasicInfo {

 String? get id; String get taskId;@JsonKey(fromJson: _datetimeFromFirestore, toJson: _datetimeToFirestore) DateTime get createdAt;@JsonKey(fromJson: _datetimeFromFirestore, toJson: _datetimeToFirestore) DateTime get updatedAt; int get targetDue;@JsonKey(fromJson: _nullableDatetimeFromFirestore, toJson: _datetimeToFirestore) DateTime? get targetStartAt; int get concentrateDue; int get distractDue; TaskSourceType get taskSourceType; bool get isDone;
/// Create a copy of TaskBasicInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskBasicInfoCopyWith<TaskBasicInfo> get copyWith => _$TaskBasicInfoCopyWithImpl<TaskBasicInfo>(this as TaskBasicInfo, _$identity);

  /// Serializes this TaskBasicInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskBasicInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.taskId, taskId) || other.taskId == taskId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.targetDue, targetDue) || other.targetDue == targetDue)&&(identical(other.targetStartAt, targetStartAt) || other.targetStartAt == targetStartAt)&&(identical(other.concentrateDue, concentrateDue) || other.concentrateDue == concentrateDue)&&(identical(other.distractDue, distractDue) || other.distractDue == distractDue)&&(identical(other.taskSourceType, taskSourceType) || other.taskSourceType == taskSourceType)&&(identical(other.isDone, isDone) || other.isDone == isDone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,taskId,createdAt,updatedAt,targetDue,targetStartAt,concentrateDue,distractDue,taskSourceType,isDone);

@override
String toString() {
  return 'TaskBasicInfo(id: $id, taskId: $taskId, createdAt: $createdAt, updatedAt: $updatedAt, targetDue: $targetDue, targetStartAt: $targetStartAt, concentrateDue: $concentrateDue, distractDue: $distractDue, taskSourceType: $taskSourceType, isDone: $isDone)';
}


}

/// @nodoc
abstract mixin class $TaskBasicInfoCopyWith<$Res>  {
  factory $TaskBasicInfoCopyWith(TaskBasicInfo value, $Res Function(TaskBasicInfo) _then) = _$TaskBasicInfoCopyWithImpl;
@useResult
$Res call({
 String? id, String taskId,@JsonKey(fromJson: _datetimeFromFirestore, toJson: _datetimeToFirestore) DateTime createdAt,@JsonKey(fromJson: _datetimeFromFirestore, toJson: _datetimeToFirestore) DateTime updatedAt, int targetDue,@JsonKey(fromJson: _nullableDatetimeFromFirestore, toJson: _datetimeToFirestore) DateTime? targetStartAt, int concentrateDue, int distractDue, TaskSourceType taskSourceType, bool isDone
});




}
/// @nodoc
class _$TaskBasicInfoCopyWithImpl<$Res>
    implements $TaskBasicInfoCopyWith<$Res> {
  _$TaskBasicInfoCopyWithImpl(this._self, this._then);

  final TaskBasicInfo _self;
  final $Res Function(TaskBasicInfo) _then;

/// Create a copy of TaskBasicInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? taskId = null,Object? createdAt = null,Object? updatedAt = null,Object? targetDue = null,Object? targetStartAt = freezed,Object? concentrateDue = null,Object? distractDue = null,Object? taskSourceType = null,Object? isDone = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,taskId: null == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,targetDue: null == targetDue ? _self.targetDue : targetDue // ignore: cast_nullable_to_non_nullable
as int,targetStartAt: freezed == targetStartAt ? _self.targetStartAt : targetStartAt // ignore: cast_nullable_to_non_nullable
as DateTime?,concentrateDue: null == concentrateDue ? _self.concentrateDue : concentrateDue // ignore: cast_nullable_to_non_nullable
as int,distractDue: null == distractDue ? _self.distractDue : distractDue // ignore: cast_nullable_to_non_nullable
as int,taskSourceType: null == taskSourceType ? _self.taskSourceType : taskSourceType // ignore: cast_nullable_to_non_nullable
as TaskSourceType,isDone: null == isDone ? _self.isDone : isDone // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _TaskBasicInfo implements TaskBasicInfo {
  const _TaskBasicInfo({this.id, required this.taskId, @JsonKey(fromJson: _datetimeFromFirestore, toJson: _datetimeToFirestore) required this.createdAt, @JsonKey(fromJson: _datetimeFromFirestore, toJson: _datetimeToFirestore) required this.updatedAt, required this.targetDue, @JsonKey(fromJson: _nullableDatetimeFromFirestore, toJson: _datetimeToFirestore) this.targetStartAt, required this.concentrateDue, required this.distractDue, required this.taskSourceType, this.isDone = false});
  factory _TaskBasicInfo.fromJson(Map<String, dynamic> json) => _$TaskBasicInfoFromJson(json);

@override final  String? id;
@override final  String taskId;
@override@JsonKey(fromJson: _datetimeFromFirestore, toJson: _datetimeToFirestore) final  DateTime createdAt;
@override@JsonKey(fromJson: _datetimeFromFirestore, toJson: _datetimeToFirestore) final  DateTime updatedAt;
@override final  int targetDue;
@override@JsonKey(fromJson: _nullableDatetimeFromFirestore, toJson: _datetimeToFirestore) final  DateTime? targetStartAt;
@override final  int concentrateDue;
@override final  int distractDue;
@override final  TaskSourceType taskSourceType;
@override@JsonKey() final  bool isDone;

/// Create a copy of TaskBasicInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TaskBasicInfoCopyWith<_TaskBasicInfo> get copyWith => __$TaskBasicInfoCopyWithImpl<_TaskBasicInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TaskBasicInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TaskBasicInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.taskId, taskId) || other.taskId == taskId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.targetDue, targetDue) || other.targetDue == targetDue)&&(identical(other.targetStartAt, targetStartAt) || other.targetStartAt == targetStartAt)&&(identical(other.concentrateDue, concentrateDue) || other.concentrateDue == concentrateDue)&&(identical(other.distractDue, distractDue) || other.distractDue == distractDue)&&(identical(other.taskSourceType, taskSourceType) || other.taskSourceType == taskSourceType)&&(identical(other.isDone, isDone) || other.isDone == isDone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,taskId,createdAt,updatedAt,targetDue,targetStartAt,concentrateDue,distractDue,taskSourceType,isDone);

@override
String toString() {
  return 'TaskBasicInfo(id: $id, taskId: $taskId, createdAt: $createdAt, updatedAt: $updatedAt, targetDue: $targetDue, targetStartAt: $targetStartAt, concentrateDue: $concentrateDue, distractDue: $distractDue, taskSourceType: $taskSourceType, isDone: $isDone)';
}


}

/// @nodoc
abstract mixin class _$TaskBasicInfoCopyWith<$Res> implements $TaskBasicInfoCopyWith<$Res> {
  factory _$TaskBasicInfoCopyWith(_TaskBasicInfo value, $Res Function(_TaskBasicInfo) _then) = __$TaskBasicInfoCopyWithImpl;
@override @useResult
$Res call({
 String? id, String taskId,@JsonKey(fromJson: _datetimeFromFirestore, toJson: _datetimeToFirestore) DateTime createdAt,@JsonKey(fromJson: _datetimeFromFirestore, toJson: _datetimeToFirestore) DateTime updatedAt, int targetDue,@JsonKey(fromJson: _nullableDatetimeFromFirestore, toJson: _datetimeToFirestore) DateTime? targetStartAt, int concentrateDue, int distractDue, TaskSourceType taskSourceType, bool isDone
});




}
/// @nodoc
class __$TaskBasicInfoCopyWithImpl<$Res>
    implements _$TaskBasicInfoCopyWith<$Res> {
  __$TaskBasicInfoCopyWithImpl(this._self, this._then);

  final _TaskBasicInfo _self;
  final $Res Function(_TaskBasicInfo) _then;

/// Create a copy of TaskBasicInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? taskId = null,Object? createdAt = null,Object? updatedAt = null,Object? targetDue = null,Object? targetStartAt = freezed,Object? concentrateDue = null,Object? distractDue = null,Object? taskSourceType = null,Object? isDone = null,}) {
  return _then(_TaskBasicInfo(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,taskId: null == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,targetDue: null == targetDue ? _self.targetDue : targetDue // ignore: cast_nullable_to_non_nullable
as int,targetStartAt: freezed == targetStartAt ? _self.targetStartAt : targetStartAt // ignore: cast_nullable_to_non_nullable
as DateTime?,concentrateDue: null == concentrateDue ? _self.concentrateDue : concentrateDue // ignore: cast_nullable_to_non_nullable
as int,distractDue: null == distractDue ? _self.distractDue : distractDue // ignore: cast_nullable_to_non_nullable
as int,taskSourceType: null == taskSourceType ? _self.taskSourceType : taskSourceType // ignore: cast_nullable_to_non_nullable
as TaskSourceType,isDone: null == isDone ? _self.isDone : isDone // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
