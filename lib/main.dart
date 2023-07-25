import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

Stream<String> getDataTime() => Stream.periodic(
    Duration(seconds: 1), (_) => DateTime.now().toIso8601String());

class HomePage extends HookWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final dateTime = useStream(getDataTime());
    return Scaffold(
      appBar: AppBar(title: Text(dateTime.data ?? "Some text")),
      body: Container(),
    );
  }
}
