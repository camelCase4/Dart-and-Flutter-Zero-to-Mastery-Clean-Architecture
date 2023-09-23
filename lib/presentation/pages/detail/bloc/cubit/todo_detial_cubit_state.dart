part of 'todo_detial_cubit.dart';

sealed class TodoDetialCubitState extends Equatable {
  const TodoDetialCubitState();

  @override
  List<Object> get props => [];
}

final class ToDoDetialCubitLoadingState extends TodoDetialCubitState {}

final class ToDoDetialCubitErrorState extends TodoDetialCubitState {}

final class ToDoDetialCubitLoadedState extends TodoDetialCubitState {
  const ToDoDetialCubitLoadedState({
    required this.entryIds
  });

  final List<EntryId> entryIds;

  @override
  List<Object> get props => [entryIds];
}
