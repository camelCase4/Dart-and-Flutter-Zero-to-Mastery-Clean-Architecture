import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/domain/entities/unique_id.dart';
import 'package:todo_app/domain/repositories/todo_repo.dart';
import 'package:todo_app/domain/usecases/load_todo_entry_ids_for_collection.dart';
import 'package:todo_app/presentation/core/pageconfig.dart';
import 'package:todo_app/presentation/pages/detail/bloc/cubit/todo_detial_cubit.dart';
import 'package:todo_app/presentation/pages/detail/view_states/todo_detail_error.dart';
import 'package:todo_app/presentation/pages/detail/view_states/todo_detail_loading.dart';
import 'package:todo_app/presentation/pages/detail/view_states/todo_detial_loaded.dart';

class ToDoDetailPageProvider extends StatelessWidget {
  const ToDoDetailPageProvider({super.key, required this.collectionId});

  final CollectionId collectionId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TodoDetialCubit>(
      create: (context) => TodoDetialCubit(
          collectionId: collectionId,
          loadToDoEntryIdsForCollection: LoadToDoEntryIdsForCollection(
              toDoRepository: RepositoryProvider.of<ToDoRepository>(context)))..fetch(),
      child: ToDoDetailPage(
        collectionId: collectionId,
      ),
    );
  }
}

class ToDoDetailPage extends StatelessWidget {
  const ToDoDetailPage({
    super.key,
    required this.collectionId,
  });
  final CollectionId collectionId;

  static const pageConfig = PageConfig(
    icon: Icons.details_rounded,
    name: 'detail',
    child: Placeholder(),
  );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoDetialCubit,TodoDetialCubitState>(
      builder: (context, state) {
        if (state is ToDoDetialCubitLoadingState) {
          return const ToDoDetailLoading();
        } else if (state is ToDoDetialCubitLoadedState) {
          return ToDoDetailLoaded(
              collectionId: collectionId, entryIds: state.entryIds);
        } else {
          return const ToDoDetailError();
        }
      },
    );
  }
}
