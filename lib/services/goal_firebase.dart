import 'package:goal_tracking/models/goal.dart';
import 'package:goal_tracking/models/goal_status.dart';
import 'package:goal_tracking/services/goal_database.dart';

class GoalFirebase implements GoalDatabase {
  final List<Goal> goals = [
    Goal(
      name: 'Günde 10 Bin Adım Atmak',
      id: 'goal_1_id',
      records: {
        DateTime(2023, 1, 1): GoalStatus.done,
      },
    )
  ];

  @override
  List<Goal> getGoals() {
    return goals;
  }

  @override
  void addGoal(Goal goal) {
    goals.add(goal);
  }

  @override
  Goal getGoal(String id) {
    return goals.firstWhere((goal) => goal.id == id);
  }

  @override
  void removeGoal(Goal goal) {
    goals.remove(goal);
  }

  @override
  void removeGoalById(String id) {
    goals.removeWhere((element) => element.id == id);
  }

  @override
  void changeGoalStatus({required String id, required DateTime dateTime}) {
    Goal goal = goals.firstWhere((element) => element.id == id);
    GoalStatus? status = goal.records[dateTime];
    
    if (status == null) {
      goal.records[dateTime] = GoalStatus.done;
      return;
    }

    int index = status.index;
    goal.records[dateTime] = GoalStatus.withIndex(index + 1);
  }
}
