import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tasker/viewModels/reminders.dart';
import 'package:tasker/viewModels/task_basic_info_repository.dart';
import 'package:tasker/views/pages/timer.dart';

class TaskBasicInfoList extends HookConsumerWidget {
  const TaskBasicInfoList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskBasicInfoAsync = ref.watch(taskBasicInfoListProvider);
    final remindersAsync = ref.watch(reminderListProvider);

    final taskName = useCallback((String taskId) {
      return remindersAsync.when(
        data: (reminders) {
          final filsterReminder = reminders.where((reminder) {
            return reminder.id == taskId;
          });
          return filsterReminder.isEmpty ? taskId : filsterReminder.first.title;
        },
        error: (err, stack) => 'Error: $err',
        loading: () => 'Loading... $taskId',
      );
    }, [remindersAsync]);

    return taskBasicInfoAsync.when(
      data:
          (taskBasicInfos) => ListView.builder(
            itemCount: taskBasicInfos.length,
            itemBuilder: (_, i) {
              final taskBasicInfo = taskBasicInfos[i];
              return ListTile(
                title: Text(taskName(taskBasicInfo.taskId)),
                onLongPress: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder:
                          (context) => TimerPage(taskBasicInfo: taskBasicInfo),
                    ),
                  );
                },
                trailing: Checkbox(
                  value: taskBasicInfo.isDone,
                  onChanged: (_) {
                    ref
                        .read(taskBasicInfoRepositoryProvider)
                        .toggleTaskDone(taskBasicInfo);
                    ref.invalidate(taskBasicInfoListProvider); // 強制リロード
                  },
                ),
              );
            },
          ),
      loading: () => Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('エラー: $e')),
    );
  }
}
