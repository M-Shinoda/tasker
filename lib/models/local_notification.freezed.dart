// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'local_notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LocalNotification {

 int get id; String get title; String get body; DateTime get scheduledTime;
/// Create a copy of LocalNotification
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocalNotificationCopyWith<LocalNotification> get copyWith => _$LocalNotificationCopyWithImpl<LocalNotification>(this as LocalNotification, _$identity);

  /// Serializes this LocalNotification to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocalNotification&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body)&&(identical(other.scheduledTime, scheduledTime) || other.scheduledTime == scheduledTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,body,scheduledTime);

@override
String toString() {
  return 'LocalNotification(id: $id, title: $title, body: $body, scheduledTime: $scheduledTime)';
}


}

/// @nodoc
abstract mixin class $LocalNotificationCopyWith<$Res>  {
  factory $LocalNotificationCopyWith(LocalNotification value, $Res Function(LocalNotification) _then) = _$LocalNotificationCopyWithImpl;
@useResult
$Res call({
 int id, String title, String body, DateTime scheduledTime
});




}
/// @nodoc
class _$LocalNotificationCopyWithImpl<$Res>
    implements $LocalNotificationCopyWith<$Res> {
  _$LocalNotificationCopyWithImpl(this._self, this._then);

  final LocalNotification _self;
  final $Res Function(LocalNotification) _then;

/// Create a copy of LocalNotification
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? body = null,Object? scheduledTime = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,scheduledTime: null == scheduledTime ? _self.scheduledTime : scheduledTime // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _LocalNotification implements LocalNotification {
  const _LocalNotification({required this.id, required this.title, required this.body, required this.scheduledTime});
  factory _LocalNotification.fromJson(Map<String, dynamic> json) => _$LocalNotificationFromJson(json);

@override final  int id;
@override final  String title;
@override final  String body;
@override final  DateTime scheduledTime;

/// Create a copy of LocalNotification
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocalNotificationCopyWith<_LocalNotification> get copyWith => __$LocalNotificationCopyWithImpl<_LocalNotification>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LocalNotificationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocalNotification&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body)&&(identical(other.scheduledTime, scheduledTime) || other.scheduledTime == scheduledTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,body,scheduledTime);

@override
String toString() {
  return 'LocalNotification(id: $id, title: $title, body: $body, scheduledTime: $scheduledTime)';
}


}

/// @nodoc
abstract mixin class _$LocalNotificationCopyWith<$Res> implements $LocalNotificationCopyWith<$Res> {
  factory _$LocalNotificationCopyWith(_LocalNotification value, $Res Function(_LocalNotification) _then) = __$LocalNotificationCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, String body, DateTime scheduledTime
});




}
/// @nodoc
class __$LocalNotificationCopyWithImpl<$Res>
    implements _$LocalNotificationCopyWith<$Res> {
  __$LocalNotificationCopyWithImpl(this._self, this._then);

  final _LocalNotification _self;
  final $Res Function(_LocalNotification) _then;

/// Create a copy of LocalNotification
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? body = null,Object? scheduledTime = null,}) {
  return _then(_LocalNotification(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,scheduledTime: null == scheduledTime ? _self.scheduledTime : scheduledTime // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
