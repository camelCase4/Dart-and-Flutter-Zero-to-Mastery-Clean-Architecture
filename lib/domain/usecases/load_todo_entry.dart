import 'package:either_dart/either.dart';
import 'package:either_dart/src/either.dart';
import 'package:todo_app/core/usecase.dart';
import 'package:todo_app/domain/entities/todo_entry.dart';
import 'package:todo_app/domain/failures/failures.dart';
import 'package:todo_app/domain/repositories/todo_repo.dart';

class LoadToDoEntry implements UseCase<ToDoEntry, ToDoEntryIdsParam> {
  
  const LoadToDoEntry({
    required this.toDoRepository,
  });

  
  final ToDoRepository toDoRepository;
  
  
  @override
  Future<Either<Failure, ToDoEntry>> call(ToDoEntryIdsParam params) async {
    try {
      final loadedEntry =
          toDoRepository.readToDoEntry(params.collectionId, params.entryId);

      return loadedEntry.fold((left) => Left(left), (right) => Right(right));
    } on Exception catch (e) {
      return Left(ServerFailure(stackTrace: e.toString()));
    }
  }
  
}
