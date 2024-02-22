import 'package:fl_22_learn_realtime_database/pages/detail_page.dart';
import 'package:fl_22_learn_realtime_database/pages/home_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomePage.id,
      routes: {
       HomePage.id:(context) => const HomePage(),
       DetailPage.id:(context) => const DetailPage(),
      },
    );
  }
}
