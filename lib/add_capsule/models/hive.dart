import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class TimeCapsule {
  TimeCapsule({
    required this.thoughts,
    required this.goal,
    required this.revealDate,
  });
  @HiveField(0)
  final String thoughts;

  @HiveField(1)
  final String goal;

  @HiveField(2)
  final DateTime revealDate;
}
