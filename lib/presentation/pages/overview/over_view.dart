import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/domain/usecases/loadoverview_collections.dart';
import 'package:todo_app/presentation/core/pageconfig.dart';
import 'package:todo_app/presentation/pages/overview/bloc/todo_overview_cubit.dart';
import 'package:todo_app/presentation/pages/overview/view_states/todo_overview_error.dart';
import 'package:todo_app/presentation/pages/overview/view_states/todo_overview_loaded.dart';
import 'package:todo_app/presentation/pages/overview/view_states/todo_overview_loading.dart';

class OverviewPageProvider extends StatelessWidget {
  const OverviewPageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ToDoOverviewCubit(
        loadOverviewToDoCollections: LoadOverviewToDoCollections(
          toDoRepository: RepositoryProvider.of(context),
        ),
      )..readToDoCollections(),
      child: const OverviewPage(),
    );
  }
}

class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key});

  static const pageConfig = PageConfig(
    icon: Icons.work_history_rounded,
    name: 'overview',
    child: OverviewPageProvider(),
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      child: BlocBuilder<ToDoOverviewCubit, ToDoOverviewCubitState>(
        builder: (context, state) {
          if (state is ToDoOverviewCubitLoadingState) {
            return ToDoOverviewLoading();
          } else if (state is ToDoOverviewCubitLoadedState) {
            return ToDoOverviewLoaded(
              collections: state.collections,
            );
          }
          else
          {
            return const ToDoOverviewError();
          }
        },
      ),
    );
  }
}
