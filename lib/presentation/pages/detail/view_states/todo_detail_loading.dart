import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ToDoDetailLoading extends StatelessWidget {
  const ToDoDetailLoading({super.key});

  @override
  Widget build(BuildContext context) {
    // return const Center(
    //   child: CircularProgressIndicator(),
    // );
    return Shimmer(
      child: Container(
        color: Colors.deepPurple,
      ),
    );
  }
}
