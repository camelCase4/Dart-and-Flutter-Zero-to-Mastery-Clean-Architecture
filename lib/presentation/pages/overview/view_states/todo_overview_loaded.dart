import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/domain/entities/todo_collection.dart';
import 'package:todo_app/presentation/pages/create_todo_collection/create_todo_collection_page.dart';
import 'package:todo_app/presentation/pages/detail/todo_detail_page.dart';
import 'package:todo_app/presentation/pages/homepage/bloc/navigation_todo_cubit.dart';

class ToDoOverviewLoaded extends StatelessWidget {
  const ToDoOverviewLoaded({super.key, required this.collections});

  final List<ToDoCollection> collections;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          itemCount: collections.length,
          itemBuilder: (context, index) {
            final item = collections[index];
            final colorScheme = Theme.of(context).colorScheme;

            return BlocBuilder<NavigationToDoCubit, NavigationToDoCubitState>(
              buildWhen: (previous, current) =>
                  previous.selectedCollectionId != current.selectedCollectionId,
              builder: (context, state) {
                return ListTile(
                  selected: state.selectedCollectionId == item.id,
                  tileColor: colorScheme.surface,
                  selectedTileColor: colorScheme.surfaceVariant,
                  iconColor: item.color.color,
                  selectedColor: item.color.color,
                  onTap: () {
                    context
                        .read<NavigationToDoCubit>()
                        .selectedToDoCollectionChanged(item.id);

                    if (Breakpoints.small.isActive(context)) {
                      context.pushNamed(ToDoDetailPage.pageConfig.name,
                          pathParameters: {'collectionId': item.id.value});
                    }
                  },
                  leading: const Icon(Icons.circle),
                  title: Text(item.title),
                );
              },
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              key: const Key('create-todo-entry'),
              onPressed: () =>
                  context.pushNamed(CreateToDoCollctionPage.pageConfig.name),
              child: Icon(CreateToDoCollctionPage.pageConfig.icon),
            ),
          ),
        )
      ],
    );
  }
}
