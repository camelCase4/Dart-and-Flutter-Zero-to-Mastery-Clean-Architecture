import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app/core/usecase.dart';
import 'package:todo_app/domain/entities/todo_collection.dart';
import 'package:todo_app/domain/entities/todo_color.dart';
import 'package:todo_app/domain/usecases/create_todo_collection.dart';

part 'create_todo_collection_state.dart';

class CreateToDoCollctionPageCubit extends Cubit<CreateToDoCollctionPageState> {
  CreateToDoCollctionPageCubit({
    required this.createToDoCollection,
  }) : super(const CreateToDoCollctionPageState());

  final CreateToDoCollection createToDoCollection;

  void titleChanged(String title) {
    emit(state.copyWith(title: title));
  }

  void colorChanged(String color) {
    emit(state.copyWith(color: color));
  }

  Future<void> submit() async {
    final parsedColorIndex = int.tryParse(state.color ?? '') ?? 0;
    await createToDoCollection.call(
      ToDoCollectionParams(
        collection: ToDoCollection.empty().copyWith(
          title: state.title,
          color: ToDoColor(colorIndex: parsedColorIndex),
        ),
      ),
    );
  }
}
