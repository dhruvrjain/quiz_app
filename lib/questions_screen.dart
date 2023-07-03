import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAns});
  final void Function(String) onSelectAns;
  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuesIndex = 0;

  void answerQues(String ans) {
    widget.onSelectAns(ans);
    setState(() {
      currentQuesIndex = (currentQuesIndex + 1) % 6;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQues = questions[currentQuesIndex];
    return Center(
      child: Container(
        padding: const EdgeInsets.all(50),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQues.ques,
              style: GoogleFonts.poppins(
                color: const Color.fromARGB(255, 215, 175, 255),
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 40,
            ),
            ...currentQues.shuffle().map((e) {
              return AnswerButton(
                answerText: e,
                onTap: () {
                  answerQues(e);
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
