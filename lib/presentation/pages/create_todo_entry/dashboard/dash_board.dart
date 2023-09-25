import 'package:flutter/material.dart';
import 'package:todo_app/presentation/core/pageconfig.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  static const pageConfig = PageConfig(
    icon: Icons.dashboard_rounded,
    name: 'dashboard',
    child: DashboardPage(),
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.greenAccent,
    );
  }
}
