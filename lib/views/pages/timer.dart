import 'dart:async';

import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reminders/reminder.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:tasker/models/local_notification.dart';
import 'package:tasker/models/task_basic_info.dart';
import 'package:tasker/models/task_work.dart';
import 'package:tasker/viewModels/local_notification.dart';
import 'package:tasker/viewModels/reminders.dart';
import 'package:tasker/viewModels/task_work_repository.dart';

class TimerPage extends HookConsumerWidget {
  const TimerPage({required this.taskBasicInfo, super.key});

  final TaskBasicInfo taskBasicInfo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final remindersAsync = ref.watch(reminderListProvider);

    final progressNotifier = useMemoized(() => ValueNotifier(0.0), const []);
    final nowTaskWork = useState<TaskWork?>(null);
    final updator = useState(0);
    final chartUpdator = useState(0);
    final dueDuration = useState(0);

    useEffect(() {
      final timer = Timer.periodic(const Duration(milliseconds: 200), (timer) {
        updator.value++;
      });

      return timer.cancel;
    }, const []);

    final refresh = useCallback(() {
      progressNotifier.value = 0.0;
      dueDuration.value = 0;
      nowTaskWork.value = null;
      chartUpdator.value++;
    }, const []);

    final endTaskWork = useCallback((DateTime endedAt) async {
      final updatedTaskWork = nowTaskWork.value!.copyWith(
        endedAt: endedAt,
        updatedAt: endedAt,
      );
      await ref
          .read(taskWorkRepositoryProvider)
          .updateEndedAt(updatedTaskWork.id, updatedTaskWork);
      refresh();
    }, [nowTaskWork.value]);

    useEffect(() {
      if (nowTaskWork.value != null) {
        final startedAt = nowTaskWork.value!.startedAt;
        final duration = DateTime.now().difference(startedAt!).inSeconds;
        dueDuration.value = duration;
        final progress = (duration / taskBasicInfo.concentrateDue) * 100;
        progressNotifier.value = progress.clamp(0.0, 100.0);
        print(progressNotifier.value);
        if (duration >= taskBasicInfo.concentrateDue) {
          final endedAt = startedAt.add(
            Duration(seconds: taskBasicInfo.concentrateDue),
          );
          endTaskWork(endedAt);
        }
      }
      return null;
    }, [updator.value]);

    final rangesSnapshot = useMemoized(() async {
      final taskWorks = await ref
          .read(taskWorkRepositoryProvider)
          .fetchTasksByTaskId(taskBasicInfo.taskId);
      final endOfMeasureTaskWork = taskWorks!.where(
        (taskWork) =>
            taskWork.endedAt != null &&
            taskWork.startedAt != null &&
            taskWork.type == TaskWorkType.concentrate,
      );
      return endOfMeasureTaskWork
          .map(
            (taskWork) => {
              'start': taskWork.startedAt!,
              'end': taskWork.endedAt!,
            },
          )
          .toList();
    }, [chartUpdator.value]);

    final ranges = useFuture(rangesSnapshot);

    final remainingDue = useMemoized(() {
      return 0.0;
    }, []);

    return Scaffold(
      appBar: AppBar(
        title: Text("Timer"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            (getThisReminder(remindersAsync, taskBasicInfo.taskId)?.title ??
                taskBasicInfo.taskId),
          ),
          SizedBox(
            width: double.infinity,
            height: 220,
            child: SimpleCircularProgressBar(
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
                  '${(taskBasicInfo.concentrateDue / 60).toInt()} /${(dueDuration.value / 60).toInt()} min',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed:
                    nowTaskWork.value != null
                        ? null
                        : () async {
                          // TODO: createdAtとstartedAtがほぼ同じ
                          final createdAt = DateTime.now();
                          final newTaskWork = TaskWork.newCreate(
                            taskId: taskBasicInfo.taskId,
                            createdAt: createdAt,
                            startedAt: createdAt,
                            endedAt: null,
                            type: TaskWorkType.concentrate,
                          );
                          final doc = await ref
                              .read(taskWorkRepositoryProvider)
                              .addTaskWork(newTaskWork);

                          nowTaskWork.value = newTaskWork.copyWith(id: doc.id);
                          final scheduledAt = createdAt.add(
                            Duration(seconds: taskBasicInfo.concentrateDue),
                          );
                          final noti = LocalNotification(
                            id: createdAt.millisecondsSinceEpoch ~/ 1000,
                            title:
                                getThisReminder(
                                  remindersAsync,
                                  taskBasicInfo.taskId,
                                )?.title ??
                                taskBasicInfo.taskId,
                            body:
                                "createdAt: $createdAt scheduledAt: $scheduledAt concentrateDue: ${taskBasicInfo.concentrateDue}",
                            scheduledTime: scheduledAt,
                          );
                          await ref
                              .read(notificationServiceProvider.notifier)
                              .scheduleNotification(noti);
                        },
                child: Text('Start Timer'),
              ),
              ElevatedButton(
                onPressed:
                    nowTaskWork.value == null
                        ? null
                        : () => endTaskWork(DateTime.now()),
                child: Text('End Timer'),
              ),
              ElevatedButton(
                onPressed: () async {
                  final scheduledAt = DateTime.now().add(
                    Duration(milliseconds: 5000),
                  );
                  final noti = LocalNotification(
                    id: DateTime.now().millisecondsSinceEpoch ~/ 1000,
                    title:
                        getThisReminder(
                          remindersAsync,
                          taskBasicInfo.taskId,
                        )?.title ??
                        taskBasicInfo.taskId,
                    body: "test",
                    scheduledTime: scheduledAt,
                  );
                  await ref
                      .read(notificationServiceProvider.notifier)
                      .scheduleNotification(noti);
                },
                child: Text('test Notification'),
              ),
            ],
          ),
          Expanded(
            child:
                ranges.hasData
                    ? LineChart(
                      LineChartData(
                        gridData: FlGridData(show: true),
                        titlesData: FlTitlesData(
                          // leftTitles: SideTitles(showTitles: true),
                          // bottomTitles: SideTitles(showTitles: true),
                        ),
                        borderData: FlBorderData(show: true),
                        lineBarsData: createTimeRangeBars(
                          ranges.data!,
                        ), // 時間範囲をマーキング
                        lineTouchData: LineTouchData(enabled: false),
                      ),
                    )
                    : CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }
}

List<LineChartBarData> createTimeRangeBars(List<Map<String, DateTime>> ranges) {
  List<LineChartBarData> lineBars = [];
  for (var range in ranges) {
    DateTime start = range['start']!;
    DateTime end = range['end']!;

    // DateTimeをdoubleに変換
    double startTime = start.millisecondsSinceEpoch.toDouble();
    double endTime = end.millisecondsSinceEpoch.toDouble();

    // 範囲をマーキングするデータを作成
    lineBars.add(
      LineChartBarData(
        spots: [
          FlSpot(startTime, 0), // 開始時点
          FlSpot(endTime, 0), // 終了時点
        ],
        isCurved: true,
        color: Colors.blue,
        belowBarData: BarAreaData(
          show: true,
          color: Colors.blue.withOpacity(0.2),
        ),
      ),
    );
  }
  return lineBars;
}

Reminder? getThisReminder(
  AsyncValue<List<Reminder>> remindersAsync,
  String taskId,
) {
  return remindersAsync.whenOrNull(
    data: (reminders) {
      return reminders.firstWhereOrNull((reminder) => reminder.id == taskId);
    },
  );
}
