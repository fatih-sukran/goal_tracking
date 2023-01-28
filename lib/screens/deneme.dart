import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:goal_tracking/components/appbar.dart';
import 'package:goal_tracking/models/goal.dart';
import 'package:goal_tracking/models/goal_status.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../models/goal_record.dart';

class Deneme extends StatefulWidget {
  const Deneme({super.key});

  @override
  State<Deneme> createState() => _DenemeState();
}

class _DenemeState extends State<Deneme> {
  final Goal goal = Goal.goals.first;
  final CalendarController _calendarController = CalendarController();

  @override
  Widget build(BuildContext context) {
    log("_DenemeState -> build()");
    return Scaffold(
      appBar: CustomAppBar(title: Text(goal.name),),
      body: SfCalendar(
        view: CalendarView.month,
        firstDayOfWeek: 1,
        controller: _calendarController,
        monthCellBuilder: monthCellBuilder,
        showWeekNumber: true,
        monthViewSettings: const MonthViewSettings(
          navigationDirection: MonthNavigationDirection.vertical,
        ),
        onTap: (calendarTapDetails) {
          setState(() {
            GoalRecord goalRecord = goal.status.firstWhere((element) =>
                element.date.isAtSameMomentAs(calendarTapDetails.date!));
            int index = goalRecord.status.index;
            goalRecord.status = GoalStatus.withIndex(index + 1);
          });
        },
        allowedViews: const [
          CalendarView.day,
          CalendarView.week,
          CalendarView.month,
          CalendarView.schedule
        ],
      ),
    );
  }

  Widget monthCellBuilder(BuildContext context, MonthCellDetails details) {
    GoalRecord goalRecord = goal.status.firstWhere(
      (element) => element.date.isAtSameMomentAs(details.date),
      orElse: () => GoalRecord(date: details.date, status: GoalStatus.skip),
    );
    return Column(
      children: [
        Text('${details.date.day}'),
        Expanded(
          child: (goalRecord.status == GoalStatus.done)
              ? const Icon(
                  Icons.check,
                  color: Colors.green,
                )
              : (goalRecord.status == GoalStatus.fail)
                  ? const Icon(
                      Icons.clear,
                      color: Colors.red,
                    )
                  : Container(
                      color: Colors.amber,
                    ),
        ),
      ],
    );
  }
}
