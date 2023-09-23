import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app/core/usecase.dart';
import 'package:todo_app/domain/entities/unique_id.dart';
import 'package:todo_app/domain/usecases/load_todo_entry_ids_for_collection.dart';

part 'todo_detial_cubit_state.dart';

class TodoDetialCubit extends Cubit<TodoDetialCubitState> {
  TodoDetialCubit({
    required this.collectionId,
    required this.loadToDoEntryIdsForCollection,
  }) : super(ToDoDetialCubitLoadingState());

  final LoadToDoEntryIdsForCollection loadToDoEntryIdsForCollection;
  final CollectionId collectionId;

  Future<void> fetch() async {
    emit(ToDoDetialCubitLoadingState());
    try {
      final entryIds = await loadToDoEntryIdsForCollection.call(
        CollectionIdParam(collectionId: collectionId),
      );

      if(entryIds.isLeft)
      {
        emit(ToDoDetialCubitErrorState());
      }
      else{
        emit(ToDoDetialCubitLoadedState(entryIds: entryIds.right));
      }
    } on Exception {
      emit(ToDoDetialCubitErrorState());
    }
  }
}
