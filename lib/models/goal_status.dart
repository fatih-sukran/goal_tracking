import 'package:hive/hive.dart';

part 'goal_status.g.dart';

@HiveType(typeId: 1)
enum GoalStatus {

  @HiveField(0, defaultValue: true)
  skip,

  @HiveField(1)
  done,

  @HiveField(2)
  fail;

  static GoalStatus withIndex(int index) {
    if (index % 3 == 0) {
      return GoalStatus.skip;
    } else if (index % 3 == 1) {
      return GoalStatus.done;
    } else {
      return GoalStatus.fail;
    }
  }
}
