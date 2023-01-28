enum GoalStatus {
  skip,
  done,
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
