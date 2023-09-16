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

void main() {
  runApp(const SreenLayouts());
}

class SreenLayouts extends StatefulWidget {
  const SreenLayouts({super.key});

  @override
  State<SreenLayouts> createState() => _SreenLayoutsState();
}

class _SreenLayoutsState extends State<SreenLayouts> {
  bool isChanged = false;

  Column layoutStyleCol() {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            setState(
              () {
                isChanged = true;
              },
            );
          },
          child: const Icon(Icons.change_circle),
        ),
         const SizedBox(
          width: 30,
        ),
        for (int i = 0; i < questions.length; i++)
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              questions[i],
              style: const TextStyle(fontSize: 25),
            ),
          ),
          
      ],
    );
  }

  Row layoutStyleRow() {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () {
            setState(
              () {
                isChanged = false;
              },
            );
          },
          child: const Icon(Icons.change_circle),
        ),
        const SizedBox(
          width: 30,
        ),
        for (int i = 0; i < questions.length; i++)
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              questions[i],
              style: const TextStyle(fontSize: 25),
            ),
          ),
          
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            double screenWidth = constraints.maxWidth;
            return Padding(
              padding: EdgeInsets.all(screenWidth * 0.05),
              child: SingleChildScrollView(
                scrollDirection: isChanged ? Axis.horizontal : Axis.vertical,
                child: Center(
                  child: Container(
                    child: isChanged ? layoutStyleRow() : layoutStyleCol(),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
