import 'package:flutter/material.dart';
import 'package:goal_tracking/models/goal.dart';
import 'package:intl/intl.dart';
import 'package:goal_tracking/components/appbar.dart';

class GoalCalender extends StatefulWidget {
  GoalCalender({super.key, required this.goal});

  static const route = 'goal_calender';
  final Goal goal;
  final String goalName = 'Goal Name'; // todo: parametrik alınacak
  final DateTime date = DateTime.now(); // todo: parametrik alınacak

  @override
  State<GoalCalender> createState() => _GoalCalenderState();
}

class _GoalCalenderState extends State<GoalCalender> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(widget.goal.name),
        leading: const BackButton(),
      ),
      body: SingleChildScrollView(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            double spacing = 3;
            double margin = 3;
            double screenWidth = constraints.maxWidth;
            double width = (screenWidth - (spacing * 7) - (margin * 2)) / 8;
            double height = width * 1.81;
            return dataTable(spacing, margin, width, height, widget.date);
          },
        ),
      ),
    );
  }

  DataTable dataTable(double spacing, double margin, double width,
      double height, DateTime dateTime) {
    return DataTable(
      columnSpacing: spacing,
      dividerThickness: 3, //todo: kaldıralabilir
      horizontalMargin: margin,
      columns: const [
        DataColumn(label: Text('Week')),
        DataColumn(label: Text('1')),
        DataColumn(label: Text('2')),
        DataColumn(label: Text('3')),
        DataColumn(label: Text('4')),
        DataColumn(label: Text('5')),
        DataColumn(label: Text('6')),
        DataColumn(label: Text('7')),
      ],
      rows: <DataRow>[
        dataRow(width, height, dateTime),
        dataRow(width, height, dateTime.add(const Duration(days: 7)))
      ],
    );
  }

  DataRow dataRow(double width, double height, DateTime dateTime) {
    return DataRow(
      cells: <DataCell>[
        weekCell(getWeekOfYear(dateTime)),
        dataCellDone(width, height),
        dataCellDone(width, height),
        dataCellDone(width, height),
        dataCellDone(width, height),
        dataCellDone(width, height),
        dataCellDone(width, height),
        dataCellFail(width, height),
      ],
    );
  }

  DataCell weekCell(int week) {
    return DataCell(Text('$week'));
  }

  DataCell dataCellDone(double width, double height) {
    return DataCell(InkWell(
      onTap: () {},
      child: Container(
        color: Colors.amber,
        width: width,
        height: height,
        child: const Icon(
          Icons.check,
          color: Colors.green,
          size: 41,
        ),
      ),
    ));
  }

  DataCell dataCellFail(double width, double height) {
    return DataCell(InkWell(
      onTap: () {},
      child: Container(
        color: Colors.amber,
        width: width,
        height: height,
        child: const Icon(
          Icons.close,
          color: Colors.red,
          size: 41,
        ),
      ),
    ));
  }

  int getWeekOfYear(DateTime date) {
    int dayOfYear = int.parse(DateFormat("D").format(date));
    return ((dayOfYear - date.weekday + 10) / 7).floor();
  }
}
