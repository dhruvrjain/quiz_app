import 'package:flutter/material.dart';
import 'package:quiz_app/start_screen.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 18, 13, 149),
                Color.fromARGB(255, 45, 9, 228),
              ],
            ),
          ),
          child: const StartScreen(),
        ),
      ),
    ),
  );
}
