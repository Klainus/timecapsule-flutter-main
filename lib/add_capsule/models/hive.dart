import 'package:hive_flutter/hive_flutter.dart';

part 'hive.g.dart';

@HiveType(typeId: 0)
class TimeCapsule {
  TimeCapsule({
    required this.thoughts,
    required this.revealDate,
  });
  @HiveField(0)
  final String thoughts;

  @HiveField(1)
  final DateTime revealDate;
}
