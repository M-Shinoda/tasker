// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_work.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TaskWork _$TaskWorkFromJson(Map<String, dynamic> json) => _TaskWork(
  id: json['id'] as String?,
  taskId: json['taskId'] as String,
  createdAt: _datetimeFromFirestore(json['createdAt']),
  startedAt: _nullableDatetimeFromFirestore(json['startedAt']),
  endedAt: _nullableDatetimeFromFirestore(json['endedAt']),
  type: $enumDecode(_$TaskWorkTypeEnumMap, json['type']),
  updatedAt: _datetimeFromFirestore(json['updatedAt']),
  isDone: json['isDone'] as bool? ?? false,
);

Map<String, dynamic> _$TaskWorkToJson(_TaskWork instance) => <String, dynamic>{
  'id': instance.id,
  'taskId': instance.taskId,
  'createdAt': _datetimeToFirestore(instance.createdAt),
  'startedAt': _datetimeToFirestore(instance.startedAt),
  'endedAt': _datetimeToFirestore(instance.endedAt),
  'type': _$TaskWorkTypeEnumMap[instance.type]!,
  'updatedAt': _datetimeToFirestore(instance.updatedAt),
  'isDone': instance.isDone,
};

const _$TaskWorkTypeEnumMap = {
  TaskWorkType.concentrate: 'concentrate',
  TaskWorkType.distract: 'distract',
};
