// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_work.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TaskWork _$TaskWorkFromJson(Map<String, dynamic> json) => _TaskWork(
  id: json['id'] as String?,
  taskId: json['taskId'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  startedAt:
      json['startedAt'] == null
          ? null
          : DateTime.parse(json['startedAt'] as String),
  endedAt:
      json['endedAt'] == null
          ? null
          : DateTime.parse(json['endedAt'] as String),
  type: $enumDecode(_$TaskWorkTypeEnumMap, json['type']),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  isDone: json['isDone'] as bool? ?? false,
);

Map<String, dynamic> _$TaskWorkToJson(_TaskWork instance) => <String, dynamic>{
  'id': instance.id,
  'taskId': instance.taskId,
  'createdAt': instance.createdAt.toIso8601String(),
  'startedAt': instance.startedAt?.toIso8601String(),
  'endedAt': instance.endedAt?.toIso8601String(),
  'type': _$TaskWorkTypeEnumMap[instance.type]!,
  'updatedAt': instance.updatedAt.toIso8601String(),
  'isDone': instance.isDone,
};

const _$TaskWorkTypeEnumMap = {
  TaskWorkType.concentrate: 'concentrate',
  TaskWorkType.distract: 'distract',
};
