import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summary});
  final List<Map<String, Object>> summary;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summary.map((e) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: (e['chosen_answer'] == e['correct_answer'])
                      ? Colors.cyan
                      : const Color.fromARGB(255, 233, 30, 216),
                  child: Text(
                    ((e['question_index'] as int) + 1).toString(),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        e['question'] as String,
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Text(
                        e['chosen_answer'] as String,
                        style: GoogleFonts.lato(
                          color: const Color.fromARGB(255, 255, 125, 244),
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        e['correct_answer'] as String,
                        style: GoogleFonts.lato(
                          color: Colors.cyan,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
