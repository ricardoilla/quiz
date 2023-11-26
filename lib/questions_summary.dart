import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;
  final successfulColor = const Color.fromARGB(255, 150, 198, 241);
  final failureColor =  const Color.fromARGB(255, 249, 133, 241);

  Color getColor(data) {
    if (data['user_answer'] == data['correct_answer']) {
      return successfulColor;
    } else {
      return failureColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
            children: summaryData.map(
          (data) {
            return Row(
              children: [
                Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: getColor(data)),
                    child: Center(
                        child: Text(
                            ((data['question_index'] as int) + 1).toString()))),
                            const SizedBox(width: 20,),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                          style: GoogleFonts.lato(
                            color: const Color.fromARGB(255, 252, 241, 251),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          data['question'] as String),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                          style: GoogleFonts.lato(
                            color: failureColor,
                            fontSize: 15,
                          ),
                          data['user_answer'] as String),
                      Text(
                          style: GoogleFonts.lato(
                            color: successfulColor,
                            fontSize: 15,
                          ),
                          data['correct_answer'] as String)
                    ],
                  ),
                )
              ],
            );
          },
        ).toList()),
      ),
    );
  }
}
