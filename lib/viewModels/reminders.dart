import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:reminders/reminders.dart';

part 'reminders.g.dart';

@Riverpod(keepAlive: true)
// ignore: deprecated_member_use_from_same_package
Future<List<Reminder>> reminderList(ReminderListRef _) async {
  final reminders = Reminders();
  await reminders.requestPermission();
  bool hasAccess = await reminders.hasAccess();
  if (!hasAccess) {
    hasAccess = await reminders.requestPermission();
  }
  if (hasAccess) {
    final lists = await reminders.getAllLists();
    final allRemindersFuture = lists.map(
      (list) => reminders.getReminders(list.id),
    );
    final allReminders = await Future.wait(allRemindersFuture);
    return allReminders.expand<Reminder>((r) => r ?? []).toList();
  }
  return [];
}
