import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:themeal/screens/search_screen.dart';
import 'providers/meal_provider.dart';
import 'screens/home_screen.dart';
import 'utils/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MealProvider(),

      child: MaterialApp(
        title: 'Meal App',
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        darkTheme: darkTheme,  //  Dark mode support
        themeMode: ThemeMode.system, //  Auto-switch based on system setting
        home: const SearchScreen(),
      ),
    );
  }
}
