import 'package:goal_tracking/models/goal_record.dart';
import 'package:goal_tracking/models/goal_status.dart';

class Goal {
  Goal({
    this.id,
    required this.name,
    this.startDate,
    this.finishDate,
    this.status = const [],
    this.records = const {},
  });

  static List<Goal> goals = <Goal>[
    Goal(
      name: 'Goal 1',
      startDate: DateTime(2023, 1, 1),
      status: [
        GoalRecord(date: DateTime(2023, 1, 1), status: GoalStatus.done),
        GoalRecord(date: DateTime(2023, 1, 2), status: GoalStatus.done),
        GoalRecord(date: DateTime(2023, 1, 3), status: GoalStatus.fail),
        GoalRecord(date: DateTime(2023, 1, 4), status: GoalStatus.done),
        GoalRecord(date: DateTime(2023, 1, 5), status: GoalStatus.done),
        GoalRecord(date: DateTime(2023, 1, 6), status: GoalStatus.fail),
        GoalRecord(date: DateTime(2023, 1, 7), status: GoalStatus.done),
        GoalRecord(date: DateTime(2023, 1, 8), status: GoalStatus.done),
        GoalRecord(date: DateTime(2023, 1, 8), status: GoalStatus.done),
        GoalRecord(date: DateTime(2023, 1, 9), status: GoalStatus.fail),
        GoalRecord(date: DateTime(2023, 1, 10), status: GoalStatus.done),
        GoalRecord(date: DateTime(2023, 1, 11), status: GoalStatus.skip),
        GoalRecord(date: DateTime(2023, 1, 12), status: GoalStatus.done),
        GoalRecord(date: DateTime(2023, 1, 13), status: GoalStatus.done),
      ],
    )
  ];

  String? id;
  String name;
  DateTime? startDate;
  DateTime? finishDate;
  List<GoalRecord> status;
  Map<DateTime, GoalStatus> records;
}
