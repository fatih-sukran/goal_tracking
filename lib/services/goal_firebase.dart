import 'package:goal_tracking/models/goal.dart';
import 'package:goal_tracking/services/goal_database.dart';

class GoalFirebase implements GoalDatabase {
  final List<Goal> goals = [];

  @override
  List<Goal> getGoals() {
    return goals;
  }

  @override
  void addGoal(Goal goal) {
    goals.add(goal);
  }

  @override
  Goal? getGoal(String id) {
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
}
