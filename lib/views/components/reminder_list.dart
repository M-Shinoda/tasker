import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reminders/reminder.dart';
import 'package:tasker/models/task_basic_info.dart';
import 'package:tasker/viewModels/reminders.dart';
import 'package:tasker/viewModels/task_basic_info_repository.dart';

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
      return ReminderListTile(reminder: reminder);
    },
  );
}

class ReminderListTile extends ConsumerWidget {
  const ReminderListTile({required this.reminder, super.key});

  final Reminder reminder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(reminder.title),
      subtitle: Text(reminder.notes ?? ''),
      onTap: () async {
        final aleadyTaskBasicInfo = await ref
            .watch(taskBasicInfoRepositoryProvider)
            .fetchTaskByTaskId(reminder.id!);
        print(aleadyTaskBasicInfo);
        if (aleadyTaskBasicInfo != null) {
          // TODO: すでにタスクがある場合の処理
          return;
        }
        await showDialog(
          context: context,
          builder: (context) {
            int targetDue = 0;
            int concentrateDue = 0;
            int distractDue = 0;

            return AlertDialog(
              title: Text('Add Task Basic Info'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: 'Target Due'),
                    onChanged: (value) {
                      // TODO: 冗長
                      final int? tryIntValue = int.tryParse(value);
                      if (tryIntValue != null) {
                        targetDue = tryIntValue;
                      }
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Concentrate Due'),
                    onChanged: (value) {
                      // TODO: 冗長
                      final int? tryIntValue = int.tryParse(value);
                      if (tryIntValue != null) {
                        concentrateDue = tryIntValue;
                      }
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Distract Due'),
                    onChanged: (value) {
                      // TODO: 冗長
                      final int? tryIntValue = int.tryParse(value);
                      if (tryIntValue != null) {
                        distractDue = tryIntValue;
                      }
                    },
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancel'),
                ),
                TextButton(
                  onPressed: () async {
                    if (targetDue == 0 ||
                        concentrateDue == 0 ||
                        distractDue == 0) {
                      return;
                    }
                    final newTaskBasicInfo = TaskBasicInfo.newCreate(
                      taskId: reminder.id!,
                      targetDue: targetDue,
                      concentrateDue: concentrateDue,
                      distractDue: distractDue,
                      taskSourceType: TaskSourceType.appleReminder,
                    );
                    await ref
                        .watch(taskBasicInfoRepositoryProvider)
                        .addTask(newTaskBasicInfo);
                    ref.invalidate(taskBasicInfoListProvider);
                    Navigator.of(context).pop();
                  },
                  child: Text('Add'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
