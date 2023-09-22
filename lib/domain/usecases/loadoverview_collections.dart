import 'package:either_dart/either.dart';
import 'package:either_dart/src/either.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/usecase.dart';
import 'package:todo_app/domain/entities/todo_collection.dart';
import 'package:todo_app/domain/failures/failures.dart';
import 'package:todo_app/domain/repositories/todo_repo.dart';

class LoadOverviewToDoCollections
    implements UseCase<List<ToDoCollection>, NoParams> {
  const LoadOverviewToDoCollections({required this.toDoRepository});
  final ToDoRepository toDoRepository;

  @override
  Future<Either<Failure, List<ToDoCollection>>> call(NoParams params) async {
    try {
      final loadedCollections = toDoRepository.readToDoCollections();
      return loadedCollections.fold(
          (left) => Left(left), (right) => Right(right));
    } on Exception catch (e) {
      return Left(ServerFailure(stackTrace: e.toString()));
    }
  }
}
