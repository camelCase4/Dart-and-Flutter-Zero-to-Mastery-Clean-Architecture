import 'package:flutter/material.dart';
import 'package:todo_app/domain/entities/todo_entry.dart';

class ToDoEntryItemLoaded extends StatelessWidget {
  const ToDoEntryItemLoaded({super.key, required this.entryItem,required this.onChanged});

  final ToDoEntry entryItem;
  final Function(bool?) onChanged;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: entryItem.isDone,
      title: Text(
        entryItem.description,
      ),
      onChanged: onChanged,
    );
  }
}
