import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reminders/reminder.dart';
import 'package:tasker/viewModels/reminders.dart';

class ReminderListView extends HookConsumerWidget {
  const ReminderListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final remindersAsync = ref.watch(reminderListProvider);

    useEffect(() {
      final timer = Timer.periodic(Duration(seconds: 3), (_) {
        ref.invalidate(reminderListProvider);
      });

      return timer.cancel;
    }, const []);

    return remindersAsync.when(
      data: (reminders) {
        final isCompletedRems =
            reminders.where((reminder) => !reminder.isCompleted).toList();
        return listTileBuilder(isCompletedRems);
      },
      loading: () => CircularProgressIndicator(),
      error: (err, stack) => Text('Error: $err'),
    );
  }
}

Widget listTileBuilder(List<Reminder> reminders) {
  return ListView.builder(
    itemCount: reminders.length,
    itemBuilder: (context, index) {
      final reminder = reminders[index];
      return ListTile(
        title: Text(reminder.title),
        subtitle: Text(reminder.notes ?? ''),
      );
    },
  );
}
