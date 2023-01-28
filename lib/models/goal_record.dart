import 'package:goal_tracking/models/goal_status.dart';

class GoalRecord {

  GoalRecord({
    required this.date,
    required this.status,
  });

  DateTime date;
  GoalStatus status;
}
