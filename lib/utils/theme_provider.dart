import 'package:flutter/material.dart';

class ThemeProvider extends StatefulWidget {
  final Widget child;

  ThemeProvider({required this.child});

  static ThemeProviderState of(BuildContext context) {
    return context.findAncestorStateOfType<ThemeProviderState>()!;
  }

  @override
  ThemeProviderState createState() => ThemeProviderState();
}

class ThemeProviderState extends State<ThemeProvider> {
  ThemeMode currentThemeMode = ThemeMode.light;

  ThemeData get lightTheme => ThemeData(
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        brightness: Brightness.light,
      );

  ThemeData get darkTheme => ThemeData(
        primaryColor: Colors.grey[800],
        scaffoldBackgroundColor: Colors.black,
        brightness: Brightness.dark,
      );

  void toggleTheme() {
    setState(() {
      currentThemeMode = currentThemeMode == ThemeMode.light
          ? ThemeMode.dark
          : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
