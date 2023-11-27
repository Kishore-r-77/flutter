import 'package:adv_flutter/data/questions.dart';
import 'package:adv_flutter/questions_screen.dart';
import 'package:adv_flutter/results_screen.dart';
import 'package:adv_flutter/start_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  @override
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _Quiz();
  }
}

class _Quiz extends State<Quiz> {
  // Widget? activeScreen;

  var activeScreen = "start-screen";

  List<String> listOfAnswers = [];

  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }

  void switchScreen() {
    setState(() {
      activeScreen = "questions-screen";
    });
  }

  void addAnswer(String answer) {
    listOfAnswers.add(answer);
    if (listOfAnswers.length == questions.length) {
      setState(() {
        activeScreen = "results-screen";
      });
    }
  }

  @override
  Widget build(context) {
    // var screenWidget = activeScreen == "start-screen"
    //     ? StartScreen(switchScreen)
    //     : QuestionsScreen(onSelectAnswer: addAnswer);
    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == "questions-screen") {
      screenWidget = QuestionsScreen(onSelectAnswer: addAnswer);
    } else if (activeScreen == "results-screen") {
      screenWidget = ResultsScreen(
        chosenAnswers: listOfAnswers,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 76, 106, 175),
                Color.fromARGB(255, 5, 77, 246)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
