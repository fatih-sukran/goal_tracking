import '../models/goal.dart';

abstract class GoalDatabase {
  List<Goal> getGoals();
  Goal? getGoal(String id);
  void addGoal(Goal goal);
  void removeGoal(Goal goal);
  void removeGoalById(String id);
}
