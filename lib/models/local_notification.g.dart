// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LocalNotification _$LocalNotificationFromJson(Map<String, dynamic> json) =>
    _LocalNotification(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      body: json['body'] as String,
      scheduledTime: DateTime.parse(json['scheduledTime'] as String),
    );

Map<String, dynamic> _$LocalNotificationToJson(_LocalNotification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'scheduledTime': instance.scheduledTime.toIso8601String(),
    };
