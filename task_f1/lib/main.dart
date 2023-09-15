import 'package:flutter/material.dart';

void main() {
  runApp(const TaskF1());
}

class TaskF1 extends StatelessWidget {
  const TaskF1({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScaffoldMessenger(
        child: Scaffold(
          body: ButtonAndSnack(),
        ),
      ),
    );
  }
}

class ButtonAndSnack extends StatelessWidget {
  const ButtonAndSnack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Builder(builder: (context) {
          return FloatingActionButton(
            child: const Icon(Icons.question_mark),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    "Hello There I am SnackBar!",
                    textAlign: TextAlign.center,
                  ),
                  duration: Duration(seconds: 3),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
