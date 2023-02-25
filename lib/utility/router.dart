import 'package:define_it/pages/homepage.dart';
import 'settings.dart';
import '../pages/storage.dart';
import '../http/get_word.dart';
import 'package:flutter/material.dart';
import '../pages/about.dart';

const String homePage = '/';
const String settingsPage = '/settings';
const String storagePage = '/storage';
const String getWordsPage = '/getwords';
const String speechToTextPage = '/getspeech';
const String aboutPage = '/about';

Route<dynamic> controller(RouteSettings setting) {
  switch (setting.name) {
    case homePage:
      return MaterialPageRoute(builder: (context) => const HomePage());
    case storagePage:
      return MaterialPageRoute(builder: (context) => const StoragePage());
    case settingsPage:
      return MaterialPageRoute(builder: (context) => const SettingsPage());
    case getWordsPage:
      return MaterialPageRoute(builder: (context) => const GetWords());
    case aboutPage:
      return MaterialPageRoute(builder: (context) => const AboutPage());
    
    default:
      throw ('This route does not exist');
  }
}
