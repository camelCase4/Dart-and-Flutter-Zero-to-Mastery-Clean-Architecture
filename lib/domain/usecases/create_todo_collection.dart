import 'package:either_dart/either.dart';
import 'package:todo_app/core/usecase.dart';
import 'package:todo_app/domain/failures/failures.dart';
import 'package:todo_app/domain/repositories/todo_repo.dart';

class CreateToDoCollection implements UseCase<bool, ToDoCollectionParams>
{
  final ToDoRepository toDoRepository;

  CreateToDoCollection ({required this.toDoRepository});

  @override
  Future<Either<Failure, bool>> call(params) async
  {
    try{
      final result = toDoRepository.createToDoCollection(params.collection);

      return result.fold((left) => Left(left), (right) => Right(right),);
    } on Exception catch(e)
    {
      return Left(ServerFailure(stackTrace: e.toString()));
    }
  }
}