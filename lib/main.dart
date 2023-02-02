import 'package:flutter/material.dart';
import 'package:goal_tracking/models/goal.dart';
import 'package:goal_tracking/models/goal_status.dart';
import 'package:goal_tracking/routes.dart';
import 'package:goal_tracking/screens/home_page.dart';
import 'package:goal_tracking/services/goal_database.dart';
import 'package:goal_tracking/services/goal_firebase.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await hiveSetup();
  runApp(const MyApp());
}

Future<void> hiveSetup() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(GoalAdapter());
  Hive.registerAdapter(GoalStatusAdapter());
  await GoalDatabase.instance.openDatabaseConnection();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: routes,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
