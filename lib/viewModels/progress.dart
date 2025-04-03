import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'progress.g.dart';

@riverpod
class Progress extends _$Progress {
  @override
  double build() => 0;

  void add(double addValue) => state += addValue;
  void set(double setValue) => state = setValue;
}
