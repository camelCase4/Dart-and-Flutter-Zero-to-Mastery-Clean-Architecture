import 'package:flutter/material.dart';

void main() {
  runApp(const QuestionItem());
}

class QuestionItem extends StatelessWidget {
  const QuestionItem({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: const QuestionClass(
              category: "Sports",
              questionText: "What game does Lebron James play?"),
        ),
      ),
    );
  }
}

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

class QuestionClass extends StatelessWidget {
  const QuestionClass(
      {super.key, required this.category, required this.questionText});

  final String category;
  final String questionText;

  Container displayQuestions(String txt) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Text(
        txt,
        style: const TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      padding: const EdgeInsets.fromLTRB(13,0,0,0),
                      child: Image.asset('images/icons8-basketball-96.png')),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20,0,0,0),
                    child: Text(
                      category,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 45, color: Colors.white),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      questionText,
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  for (int i = 0; i < questions.length; i++)
                    displayQuestions(questions[i]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
