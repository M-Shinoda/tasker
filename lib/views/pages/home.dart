import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tasker/viewModels/progress.dart';
import 'package:tasker/views/components/progress_bar.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progressNotifier = ref.read(progressProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[DayTaskProgressBar()],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => progressNotifier.add(10),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
