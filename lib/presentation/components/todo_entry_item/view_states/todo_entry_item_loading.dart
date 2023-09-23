import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ToDoEntryItemLoading extends StatelessWidget {
  const ToDoEntryItemLoading({super.key});

  @override
  Widget build(BuildContext context) {
    //return const CircularProgressIndicator();
    return Shimmer(
      child: Container(
        color: Colors.purple,
      ),
    );
  }
}
