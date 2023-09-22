import 'package:flutter/material.dart';
import 'package:todo_app/presentation/core/pageconfig.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  static const pageConfig = PageConfig(
    icon: Icons.settings_rounded,
    name: 'settings',
    child: SettingsPage(),
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple,
    );
  }
}
