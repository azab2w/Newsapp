import 'package:flutter/material.dart';
import 'package:news_application/newsDetails.dart';
import 'homeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF39A552),
        drawerTheme: DrawerThemeData(
          backgroundColor: Colors.white
        ),
          appBarTheme: const AppBarTheme(
            color: Colors.indigo,
              titleTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 22,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ))),
          colorScheme: ColorScheme.fromSeed(
              seedColor: Color(0xFF39A552), primary: Colors.black),
          useMaterial3: false),
      title: 'News App',
      routes: {
        HomeScreen.RouteName: (_) => HomeScreen(),
        newsDetails.routeName: (_) => newsDetails(),
      },
      initialRoute: HomeScreen.RouteName,
    );
  }
}
