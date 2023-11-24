import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen(this.updateQuiz, {super.key});

  final void Function() updateQuiz;

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Opacity(
            opacity: 0.5,
            child: Image.asset('assets/images/quiz-logo.png', width: 300)),
        const SizedBox(height: 80),
        Text(
          'Learn Flutter the fun way!',
          style: GoogleFonts.lato(
            color: const Color.fromARGB(255, 237, 223, 252),
            fontSize: 24,
          ),
        ),
        const SizedBox(height: 30),
        OutlinedButton.icon(
            onPressed: updateQuiz,
            style: TextButton.styleFrom(
                //padding: const EdgeInsets.only(top: 20,),
                foregroundColor: Color.fromARGB(255, 241, 218, 238),
                backgroundColor: Colors.deepPurple,
                textStyle: const TextStyle(
                  fontSize: 20,
                )),
            icon: const Icon(Icons.arrow_right_rounded),
            label: const Text('Start Quiz')),
      ],
    );
  }
}
