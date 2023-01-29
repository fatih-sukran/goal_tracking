import 'package:goal_tracking/models/goal_record.dart';
import 'package:goal_tracking/models/goal_status.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'goal.g.dart';

@HiveType(typeId: 0)
class Goal {

  @HiveField(0)
  String? id;

  @HiveField(1)
  String name;

  @HiveField(2)
  DateTime? startDate;

  @HiveField(3)
  DateTime? finishDate;

  @HiveField(4)
  List<GoalRecord> status;

  @HiveField(5)
  Map<DateTime, GoalStatus> records;
  
  Goal({
    this.id,
    required this.name,
    this.startDate,
    this.finishDate,
    this.status = const [],
    this.records = const {},
  });
}
