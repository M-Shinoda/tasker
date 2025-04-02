import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasker/viewModels/counter.dart';

class CounterCountText extends ConsumerWidget {
  const CounterCountText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
    return Text(
      counter.toString(),
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}
