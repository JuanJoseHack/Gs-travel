import 'package:flutter/material.dart';

class SurprisePage extends StatelessWidget {
  const SurprisePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Sorpresa'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          '¡Sorpresa! 🎉',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sorpresa App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const SurprisePage(),
    );
  }
}
