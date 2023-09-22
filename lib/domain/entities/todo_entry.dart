import 'dart:html';

import 'package:todo_app/domain/entities/unique_id.dart';

class ToDoEntry{
  final String description;
  final bool isDone;
  final EntryId id;

  const ToDoEntry({
    required this.id,
    required this.description,
    required this.isDone,
  });

  factory ToDoEntry.empty()
  {
    return ToDoEntry(
      id: EntryId(),
      description: '',
      isDone: false,
    );
  }
}