import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/result_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var activeScreen = 0;
  List<String> chosenAns = [];

  void switchScreen() {
    setState(() {
      activeScreen = 1;
    });
  }

  void addAns(String ans) {
    chosenAns.add(ans);
    if (chosenAns.length == questions.length) {
      setState(() {
        activeScreen = 2;
      });
    }
  }

  void restart() {
    setState(() {
      activeScreen = 0;
      chosenAns = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 106, 0, 133),
                Color.fromARGB(255, 18, 31, 151),
              ],
            ),
          ),
          child: activeScreen == 0
              ? StartScreen(switchScreen)
              : activeScreen == 1
                  ? QuestionsScreen(onSelectAns: addAns)
                  : ResultScreen(chosenAns: chosenAns, restart: restart),
        ),
      ),
    );
  }
}
