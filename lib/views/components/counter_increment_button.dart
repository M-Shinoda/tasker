import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasker/viewModels/counter.dart';

class CounterIncrementButton extends ConsumerWidget {
  const CounterIncrementButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counterNotifier = ref.read(counterProvider.notifier);

    return FloatingActionButton(
      onPressed: counterNotifier.increment,
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}
