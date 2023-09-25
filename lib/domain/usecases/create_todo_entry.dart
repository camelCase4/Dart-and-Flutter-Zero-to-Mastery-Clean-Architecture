import 'package:either_dart/either.dart';
import 'package:todo_app/core/usecase.dart';
import 'package:todo_app/domain/failures/failures.dart';
import 'package:todo_app/domain/repositories/todo_repo.dart';

class CreateToDoEntry implements UseCase<bool, ToDoEntryParams>
{
  final ToDoRepository toDoRepository;

  CreateToDoEntry ({required this.toDoRepository});

  @override
  Future<Either<Failure, bool>> call(params) async
  {
    try{
      final result = toDoRepository.createToDoEntry(params.entry);

      return result.fold((left) => Left(left), (right) => Right(right),);
    } on Exception catch(e)
    {
      return Left(ServerFailure(stackTrace: e.toString()));
    }
  }
}