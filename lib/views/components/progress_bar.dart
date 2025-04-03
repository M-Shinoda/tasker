import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:tasker/viewModels/progress.dart';

class DayTaskProgressBar extends HookConsumerWidget {
  const DayTaskProgressBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progress = ref.watch(progressProvider);
    final progressNotifier = useMemoized(
      () => ValueNotifier(progress),
      const [],
    );

    useEffect(() {
      progressNotifier.value = progress;
      return null;
    }, [progress]);

    return SimpleCircularProgressBar(
      progressColors: const [Colors.blueAccent],
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
