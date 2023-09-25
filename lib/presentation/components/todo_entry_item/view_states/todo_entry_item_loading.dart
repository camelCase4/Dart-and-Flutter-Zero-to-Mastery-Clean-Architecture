import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ToDoEntryItemLoading extends StatelessWidget {
  const ToDoEntryItemLoading({super.key});

  @override
  Widget build(BuildContext context) {
    //return const CircularProgressIndicator();
    return ListTile(
      title: Shimmer(
        color: Theme.of(context).colorScheme.onBackground,
        child: const Text(
          "Loading ... ",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
