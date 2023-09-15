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

class QuestionClass extends StatelessWidget {
  const QuestionClass(
      {super.key, required this.category, required this.questionText});

  final String category;
  final String questionText;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                category,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 25),
              ),
              Text(
                questionText,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 25),
              )
            ],
          ),
        ),
      ),
    );
  }
}
