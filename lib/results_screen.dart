import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:second_app/data/questions.dart';
import 'package:second_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
    this.updateQuiz,
    {
    super.key,
    required this.chosenAnswers,
    }
  );

  final void Function() updateQuiz;
  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    //Map is like a dict in python
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();

    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 248, 191, 245),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!'),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),
            const SizedBox(height: 30),
            TextButton.icon(
              onPressed: updateQuiz,
              style: TextButton.styleFrom(
                //padding: const EdgeInsets.only(top: 20,),
                foregroundColor: const Color.fromARGB(255, 241, 218, 238),
                textStyle: const TextStyle(
                  fontSize: 20,
                )),
              icon: const Icon(Icons.restart_alt_rounded),
              label: const Text('Restart Quiz!'),
            ),
          ],
        ),
      ),
    );
  }
}
