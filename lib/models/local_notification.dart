import 'package:freezed_annotation/freezed_annotation.dart';

part 'local_notification.freezed.dart';
part 'local_notification.g.dart';

@freezed
class LocalNotification with _$LocalNotification {
  const factory LocalNotification({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledTime,
  }) = _LocalNotification;

  factory LocalNotification.fromJson(Map<String, dynamic> json) =>
      _$LocalNotificationFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
