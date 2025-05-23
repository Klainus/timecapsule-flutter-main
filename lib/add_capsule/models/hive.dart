import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'hive.g.dart';

@HiveType(typeId: 0)
class TimeCapsule {
  TimeCapsule({
    required this.thoughts,
    required this.title,
    required this.revealDate,
  });

  @HiveField(0)
  final String title;

  @HiveField(1)
  final String thoughts;

  @HiveField(2)
  final DateTime revealDate;
}
