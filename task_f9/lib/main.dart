import 'package:flutter/material.dart';

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
int whatIndex = 0;
String questionHolder = "";

void main() {
  runApp(const QuestionDisplay());
}

class QuestionDisplay extends StatefulWidget {
  const QuestionDisplay({super.key});

  @override
  State<QuestionDisplay> createState() => _QuestionDisplayState();
}

class _QuestionDisplayState extends State<QuestionDisplay> {
  final TextEditingController _textEditingController = TextEditingController();

  Column displayQuestions() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < questions.length; i++)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              questions[i],
              style: const TextStyle(fontSize: 20),
            ),
          )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              whatIndex = index;
            });
          },
          currentIndex: whatIndex,
          selectedItemColor: Colors.blue,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.question_answer), label: "Questions"),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_box_sharp), label: "Ask"),
          ],
        ),
        body: IndexedStack(
          index: whatIndex,
          children: [
            Center(
              child: Container(
                child: displayQuestions(),
              ),
            ),
            Center(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        questionHolder = value;
                      },
                      controller: _textEditingController,
                      decoration: const InputDecoration(
                        hintText: "Ask Anything!",
                      ),
                    ),
                    const SizedBox(
                      height: 20,
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
                      child: const Icon(Icons.add),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
