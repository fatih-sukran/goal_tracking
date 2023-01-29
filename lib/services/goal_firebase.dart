import 'package:goal_tracking/constants.dart';
import 'package:goal_tracking/models/goal.dart';
import 'package:goal_tracking/models/goal_status.dart';
import 'package:goal_tracking/services/goal_database.dart';
import 'package:goal_tracking/util/helper.dart';
import 'package:hive_flutter/hive_flutter.dart';

class GoalFirebase implements GoalDatabase {
  late Box<Goal> goalBox;

  @override
  List<Goal> getGoals() {
    return goalBox.values.toList();
  }

  @override
  void addGoal(Goal goal) {
    goal.id ??= generateRandomString(10);
    goalBox.put(goal.id, goal);
  }

  @override
  Goal getGoal(String id) {
    return goalBox.get(id)!;
  }

  @override
  void removeGoal(Goal goal) {
    goalBox.delete(goal.id);
  }

  @override
  void removeGoalById(String id) {
    goalBox.delete(id);
  }

  @override
  void changeGoalStatus({required String id, required DateTime dateTime}) {
    Goal goal = goalBox.get(id)!;
    GoalStatus? status = goal.records[dateTime];

    if (status == null) {
      goal.records[dateTime] = GoalStatus.done;
      goalBox.put(goal.id, goal);
      return;
    }

    int index = status.index;
    goal.records[dateTime] = GoalStatus.withIndex(index + 1);
    goalBox.put(goal.id, goal);
  }

  @override
  Future<void> closeDatabaseConnection() async {
    if (goalBox.isOpen) {
      await goalBox.close();
    }
  }

  @override
  Future<void> openDatabaseConnection() async {
    if (Hive.isBoxOpen(hiveGoalBoxName)) return;
    goalBox = await Hive.openBox<Goal>(hiveGoalBoxName);
  }
}
