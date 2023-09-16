import 'package:flutter/material.dart';

void main() {
  runApp(const QuestionElement());
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

class QuestionElement extends StatefulWidget {
  const QuestionElement({super.key});

  @override
  State<QuestionElement> createState() => _QuestionElementState();
}

class _QuestionElementState extends State<QuestionElement> {
  String questionHolder = "";
  final TextEditingController _textEditingController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  TextField(
                    controller: _textEditingController,
                    decoration: const InputDecoration(
                      hintText: "Enter a question",
                    ),
                    onChanged: (value) {
                      questionHolder = value;
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      if (questionHolder != null) {

                        _textEditingController.clear();
                        setState(() {
                        questions.add(questionHolder);
                        });
                      }
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("ADD "),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  for(int i = 0; i < questions.length; i++)
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(questions[i]),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
