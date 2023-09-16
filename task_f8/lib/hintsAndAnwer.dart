import 'package:flutter/material.dart';
import 'package:task_f8/main.dart';

List<String> firstHints = [
  'There was an accident',
  'They use this to catch fish',
  'He still has 1 yr left in contract',
  'He is hailed as a king',
  'He accomplished a mission',
  'This is a very hot season',
  'He has more points',
  'He scored average 12 pts per game',
  'They recruited him during olympics',
  'Contract related',
];

List<String> secondHints = [
  'His daughter did not survive',
  'They use to to catch jellyfish in spongebob',
  'He still has 1 yr left in contract hint 2',
  'He is hailed as a king hint 2',
  'He accomplished a mission hint 2',
  'This is a very hot season hint 2',
  'He has more points hint 2',
  'He scored average 12 pts per game hint 2',
  'They recruited him during olympics hint 2',
  'Contract related hint 2',
];

List<String> questionAnswers = [
  'Answer for number 1',
  'Answer for number 2',
  'Answer for number 3',
  'Answer for number 4',
  'Answer for number 5',
  'Answer for number 6',
  'Answer for number 7',
  'Answer for number 8',
  'Answer for number 9',
  'Answer for number 10',
];

class HintsAnswers extends StatefulWidget {
  const HintsAnswers(
      {super.key, required this.questionClicked, required this.questionList});

  final int questionClicked;
  final List questionList;

  @override
  State<HintsAnswers> createState() => _HintsAnswersState();
}

class _HintsAnswersState extends State<HintsAnswers> {
  int whatIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
            setState(() {
              whatIndex = index;
            });
        },
        currentIndex: whatIndex,
        selectedItemColor: Colors.blue,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.one_k), label: "Hint 1"),
          BottomNavigationBarItem(icon: Icon(Icons.two_k), label: "Hint 2"),
          BottomNavigationBarItem(icon: Icon(Icons.question_answer), label: "The answer"),

        ],
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.questionList[widget.questionClicked],
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20,),
              IndexedStack(
                index: whatIndex,
                children: [
                   Text(firstHints[widget.questionClicked],textAlign: TextAlign.center,),
                   Text(secondHints[widget.questionClicked],textAlign: TextAlign.center,),
                   Text(questionAnswers[widget.questionClicked],textAlign: TextAlign.center,),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
