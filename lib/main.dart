import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/data/repository/todo_repo_mock.dart';
import 'package:todo_app/domain/repositories/todo_repo.dart';
import 'package:todo_app/presentation/app/basic_app.dart';

void main() {
  runApp(RepositoryProvider<ToDoRepository>(
    create: (context) => ToDoRepositoryMock(),
    child: const BasicApp(),
  ));
}
