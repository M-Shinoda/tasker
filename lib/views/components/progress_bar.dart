import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:tasker/repositories/task_repositories.dart';
import 'package:tasker/viewModels/progress.dart';
import 'package:tasker/viewModels/reminders.dart';

class DayTaskProgressBar extends HookConsumerWidget {
  const DayTaskProgressBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progress = ref.watch(progressProvider);
    final remindersAsync = ref.watch(reminderListProvider);
    final tasks = ref.watch(taskListProvider);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        int progressAllCount = 0;
        int progressIsDoneCount = 0;

        if (remindersAsync.hasValue) {
          final reminders = remindersAsync.value!;
          final isCompletedRems =
              reminders.where((reminder) => reminder.isCompleted).toList();
          progressAllCount += reminders.length;
          progressIsDoneCount += isCompletedRems.length;
        }

        progressAllCount += tasks.length;
        progressIsDoneCount += tasks.where((task) => task.isDone).length;

        final progressPercentage =
            progressAllCount != 0
                ? progressIsDoneCount / progressAllCount * 100
                : 0.0; // Avoid division by zero

        final progressNotifier = ref.read(progressProvider.notifier);
        progressNotifier.set(progressPercentage);
      });
      return null;
    }, [remindersAsync, tasks]);

    final progressNotifier = useMemoized(
      () => ValueNotifier(progress),
      const [],
    );

    useEffect(() {
      progressNotifier.value = progress;
      return null;
    }, [progress]);

    return SimpleCircularProgressBar(
      size: 200,
      progressColors: const [Colors.cyan, Colors.purple],
      backColor: Colors.grey.shade300,
      progressStrokeWidth: 12,
      backStrokeWidth: 12,
      valueNotifier: progressNotifier,
      mergeMode: true,
      animationDuration: 3,
      onGetText: (double value) {
        return Text(
          '${value.toInt()}%',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        );
      },
    );
  }
}
