
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/usecase.dart';
import 'package:todo_app/domain/entities/todo_collection.dart';
import 'package:todo_app/domain/usecases/loadoverview_collections.dart';

part 'todo_overview_cubit_state.dart';

class ToDoOverviewCubit extends Cubit<ToDoOverviewCubitState>{
  
  ToDoOverviewCubit({
    required this.loadOverviewToDoCollections,
    ToDoOverviewCubitState? initialState,

  }): super(initialState ?? ToDoOverviewCubitLoadingState());

  final LoadOverviewToDoCollections loadOverviewToDoCollections;

  Future<void> readToDoCollections() async{
    emit(ToDoOverviewCubitLoadingState());
    try
    {
      final collectionsFuture = loadOverviewToDoCollections.call(NoParams());
      final collections = await collectionsFuture;

      if(collections.isLeft)
      {
        emit(ToDoOverviewCubitErrorState());
      }
      else{
        emit(ToDoOverviewCubitLoadedState(collections: collections.right));
      }
    } on Exception{
      emit(ToDoOverviewCubitErrorState());
    }
  }
}
