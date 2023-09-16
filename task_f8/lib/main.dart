import 'package:flutter/material.dart';
import 'package:task_f8/hintsAndAnwer.dart';

List<String> questions = [
  'Is Kobe Still Alive?',
  'What team does Kevin Durant play?',
  'Is Damian Lilard still playing?',
  'Who holds as the best scorer in the league?',
  'Why did Lebron leave Cleveland Cavs?',
  'When is the NBA summer league?',
  'Is Michael Jordan better than Kobe?',
  'Is Russel Westbrook still in Lakers?',
  'Is Dwayne Wayde retired?',
  'When will Lebron stop playing?',
];
void main() {
  runApp(const QuestionsPanel());
}

class QuestionsPanel extends StatefulWidget {
  const QuestionsPanel({super.key});

  @override
  State<QuestionsPanel> createState() => _QuestionsPanelState();
}

class _QuestionsPanelState extends State<QuestionsPanel> {
  Column displayCols() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < questions.length; i++)
          Builder(
            builder: (context) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return HintsAnswers(
                          questionClicked: i,
                          questionList: questions,
                        );
                      },
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    questions[i],
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              );
            }
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          child: displayCols(),
        ),
      ),
    );
  }
}
