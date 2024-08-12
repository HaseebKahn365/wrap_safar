// home_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:wrap_safar/providers/theme_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: 'Flutter App',
      theme: themeProvider.themeData,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          Switch(
            value: themeProvider.themeData.brightness == Brightness.dark,
            onChanged: (value) {
              themeProvider.toggleTheme(value);
            },
          ),
        ],
      ),
      body: ListView(children: [
        Text('Welcome to the Home Screen'),
        //lets see the entire color pallete
        Container(
          color: themeProvider.themeData.colorScheme.primary,
          height: 100,
          width: double.infinity,
          child: Center(
            child: Text('Primary Color'),
          ),
        ),

        Container(
          color: themeProvider.themeData.colorScheme.secondary,
          height: 100,
          width: double.infinity,
          child: Center(
            child: Text('Secondary Color'),
          ),
        ),

        Container(
          color: themeProvider.themeData.colorScheme.tertiary,
          height: 100,
          width: double.infinity,
          child: Center(
            child: Text('Tertiary Color'),
          ),
        ),
      ]),
    );
  }
}
