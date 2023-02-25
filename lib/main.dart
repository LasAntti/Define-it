import 'package:define_it/utility/router.dart' as route;
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'theme/config_theme.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('storedWords');
  await Hive.openBox('themeData');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> { 

  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: route.controller,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: currentTheme.currentTheme(),
      initialRoute: route.homePage,
    );
  }
}
