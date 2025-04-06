// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_basic_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TaskBasicInfo _$TaskBasicInfoFromJson(Map<String, dynamic> json) =>
    _TaskBasicInfo(
      id: json['id'] as String?,
      taskId: json['taskId'] as String,
      createdAt: _datetimeFromFirestore(json['createdAt']),
      updatedAt: _datetimeFromFirestore(json['updatedAt']),
      targetDue: (json['targetDue'] as num).toInt(),
      targetStartAt: _datetimeFromFirestore(json['targetStartAt']),
      concentrateDue: (json['concentrateDue'] as num).toInt(),
      distractDue: (json['distractDue'] as num).toInt(),
      taskSourceType: $enumDecode(
        _$TaskSourceTypeEnumMap,
        json['taskSourceType'],
      ),
      isDone: json['isDone'] as bool? ?? false,
    );

Map<String, dynamic> _$TaskBasicInfoToJson(_TaskBasicInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'taskId': instance.taskId,
      'createdAt': _datetimeToFirestore(instance.createdAt),
      'updatedAt': _datetimeToFirestore(instance.updatedAt),
      'targetDue': instance.targetDue,
      'targetStartAt': _datetimeToFirestore(instance.targetStartAt),
      'concentrateDue': instance.concentrateDue,
      'distractDue': instance.distractDue,
      'taskSourceType': _$TaskSourceTypeEnumMap[instance.taskSourceType]!,
      'isDone': instance.isDone,
    };

const _$TaskSourceTypeEnumMap = {
  TaskSourceType.appleReminder: 'appleReminder',
  TaskSourceType.task: 'task',
};
