import 'package:flutter/material.dart';
import 'package:flutter_application_1/database/appDatabase.dart';
import 'package:flutter_application_1/home/homePage.dart';

late final AppDatabase appDatabase;
void main() async {
WidgetsFlutterBinding.ensureInitialized();
  appDatabase = AppDatabase();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
