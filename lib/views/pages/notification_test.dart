import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tasker/models/local_notification.dart';
import 'package:tasker/viewModels/local_notification.dart';

class NotificationSchedulerPage extends HookConsumerWidget {
  const NotificationSchedulerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = useTextEditingController();
    final bodyController = useTextEditingController();
    final timeController = useState<DateTime>(
      DateTime.now().add(const Duration(minutes: 1)),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('通知スケジューラー')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'タイトル'),
            ),
            TextField(
              controller: bodyController,
              decoration: const InputDecoration(labelText: '本文'),
            ),
            ElevatedButton(
              onPressed: () async {
                final picked = await showDateTimePicker(
                  context,
                  initial: timeController.value,
                );
                if (picked != null) timeController.value = picked;
              },
              child: Text('通知時間: ${timeController.value}'),
            ),
            ElevatedButton(
              onPressed: () async {
                final noti = LocalNotification(
                  id: DateTime.now().millisecondsSinceEpoch ~/ 1000,
                  title: titleController.text,
                  body: bodyController.text,
                  scheduledTime: timeController.value,
                );
                await ref
                    .read(notificationServiceProvider.notifier)
                    .scheduleNotification(noti);
              },
              child: const Text('通知を予約する'),
            ),
          ],
        ),
      ),
    );
  }

  Future<DateTime?> showDateTimePicker(
    BuildContext context, {
    required DateTime initial,
  }) async {
    final date = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (date == null) return null;

    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(initial),
    );
    if (time == null) return null;

    return DateTime(date.year, date.month, date.day, time.hour, time.minute);
  }
}
