import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.chosenAns, required this.restart});

  final List<String> chosenAns;
  final void Function() restart;

  getSummary() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAns.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].ques,
        'correct_answer': questions[i].ans[0],
        'chosen_answer': chosenAns[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summary = getSummary();
    final totNoOfQues = questions.length;
    final noOfCorrectAns = summary.where((e) {
      return e['chosen_answer'] == e['correct_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You\'ve correctly answered $noOfCorrectAns out of $totNoOfQues questions',
              style: GoogleFonts.poppins(
                color: const Color.fromARGB(255, 215, 175, 255),
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 35,
            ),
            QuestionsSummary(summary: summary),
            const SizedBox(
              height: 35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 10,
                  backgroundColor: Color.fromARGB(255, 233, 30, 216),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Text(
                    'Wrong Answer',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
                const CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.cyan,
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Text(
                    'Correct Answer',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: restart,
              icon: const Icon(Icons.rotate_right),
              label: const Text('Restart Quiz'),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
