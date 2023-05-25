import 'package:flutter/material.dart';
import 'package:sensors/sensors.dart';
import 'package:sensors_plus/sensors_plus.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false;

  @override
  void initState() {
    super.initState();
    _toggleTheme();
  }

  void _toggleTheme() {
    double _lightLevel;
    accelerometerEvents.listen((AccelerometerEvent event) {
      _lightLevel = event.z;
      if (_lightLevel <= 0) {
        setState(() {
          _isDarkMode = true;
        });
      } else {
        setState(() {
          _isDarkMode = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Light or Dark Mode App',
      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Light or Dark Mode App'),
        ),
        body: Center(
          child: Text(
            'Hello, World!',
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}