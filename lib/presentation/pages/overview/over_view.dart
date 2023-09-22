import 'package:flutter/material.dart';
import 'package:todo_app/presentation/core/pageconfig.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key});

  static const pageConfig = PageConfig(
    icon: Icons.work_history_rounded,
    name: 'overview',
    child: OverviewPage(),
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent,
    );
  }
}
