import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:goal_tracking/components/appbar.dart';
import 'package:goal_tracking/models/goal.dart';
import 'package:goal_tracking/models/goal_status.dart';
import 'package:goal_tracking/services/goal_database.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class GoalDetailScreen extends StatefulWidget {
  const GoalDetailScreen({super.key, required this.id});
  final String id;

  @override
  State<GoalDetailScreen> createState() => _GoalDetailScreenState();
}

class _GoalDetailScreenState extends State<GoalDetailScreen> {
  late Goal goal;
  final GoalDatabase service = GoalDatabase.instance;
  final CalendarController _calendarController = CalendarController();

  @override
  void initState() {
    goal = service.getGoal(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log("_DenemeState -> build()");
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(goal.name),
      ),
      body: SfCalendar(
        view: CalendarView.month,
        firstDayOfWeek: 1,
        controller: _calendarController,
        monthCellBuilder: monthCellBuilder,
        showWeekNumber: true,
        monthViewSettings: const MonthViewSettings(
          navigationDirection: MonthNavigationDirection.vertical,
        ),
        onTap: onTap,
      ),
    );
  }

  void onTap(CalendarTapDetails calendarTapDetails) {
    setState(() => service.changeGoalStatus(
          id: widget.id,
          dateTime: calendarTapDetails.date!,
        ));
  }

  Widget monthCellBuilder(BuildContext context, MonthCellDetails details) {
    GoalStatus status = goal.records[details.date] ?? GoalStatus.skip;

    return Column(
      children: [
        Text('${details.date.day}'),
        Expanded(
          child: getCell(status),
        ),
      ],
    );
  }

  Widget getCell(GoalStatus status) {
    switch (status) {
      case GoalStatus.done:
        return const Icon(
          Icons.check,
          color: Colors.green,
        );
      case GoalStatus.fail:
        return const Icon(
          Icons.clear,
          color: Colors.red,
        );
      default:
        return Container(
          color: Colors.grey[50],
        );
    }
  }
}
