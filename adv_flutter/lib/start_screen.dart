import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  @override
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          "assets/images/quiz-logo.png",
          width: 300,
          color: const Color.fromARGB(109, 244, 233, 232),
        ),
        // Opacity(
        //   opacity: 0.5,
        // ),
        const SizedBox(height: 80),
        Text(
          "Learn Flutter in an Easy Way",
          style: GoogleFonts.lato(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton.icon(
          onPressed: startQuiz,
          style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: const Color.fromARGB(255, 2, 31, 83),
              padding: const EdgeInsets.all(10)),
          icon: const Icon(Icons.arrow_right_alt),
          label: const Text(
            "Start Quiz",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        )
      ],
    ));
  }
}
