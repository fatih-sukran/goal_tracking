import 'package:goal_tracking/services/goal_firebase.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/goal.dart';

abstract class GoalDatabase {
  static final GoalDatabase instance = GoalFirebase();

  List<Goal> getGoals();
  Goal getGoal(String id);
  void addGoal(Goal goal);
  void removeGoal(Goal goal);
  void removeGoalById(String id);

  Stream<List<Goal>> streamGoals();

  Future<void> openDatabaseConnection();
  Future<void> closeDatabaseConnection();

  void changeGoalStatus({
    required String id,
    required DateTime dateTime,
  });
}
