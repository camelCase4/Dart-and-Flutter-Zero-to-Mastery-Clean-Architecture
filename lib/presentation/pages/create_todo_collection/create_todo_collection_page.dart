import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/domain/entities/todo_color.dart';
import 'package:todo_app/domain/repositories/todo_repo.dart';
import 'package:todo_app/presentation/core/pageconfig.dart';
import 'package:todo_app/presentation/pages/create_todo_collection/bloc/create_todo_collection_page_cubit.dart';

import '../../../domain/usecases/create_todo_collection.dart';

class CreateToDoCollectionPageProvider extends StatelessWidget {
  const CreateToDoCollectionPageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CreateToDoCollctionPageCubit>(
      create: (context) => CreateToDoCollctionPageCubit(
        createToDoCollection: CreateToDoCollection(
          toDoRepository: RepositoryProvider.of<ToDoRepository>(context),
        ),
      ),
      child: const CreateToDoCollctionPage(),
    );
  }
}

class CreateToDoCollctionPage extends StatefulWidget {
  const CreateToDoCollctionPage({super.key});

  static const pageConfig = PageConfig(
    name: 'create_todo_collection',
    icon: Icons.add_task_rounded,
    child: CreateToDoCollectionPageProvider(),
  );

  @override
  State<CreateToDoCollctionPage> createState() =>
      _CreateToDoCollctionPageState();
}

class _CreateToDoCollctionPageState extends State<CreateToDoCollctionPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Title'),
              onChanged: (value) => context
                  .read<CreateToDoCollctionPageCubit>()
                  .titleChanged(value),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a title!';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Color'),
              onChanged: (value) => context
                  .read<CreateToDoCollctionPageCubit>()
                  .colorChanged(value),
              validator: (value) {
                if (value != null && value.isNotEmpty) {
                  final parsedColorIndex = int.tryParse(value);
                  if (parsedColorIndex == null ||
                      parsedColorIndex < 0 ||
                      parsedColorIndex > ToDoColor.predefinedColors.length) {
                    return 'Only Numbers between 0 and ${ToDoColor.predefinedColors.length - 1} are allowed';
                  }
                  return null;
                }
              },
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                final isValid = _formKey.currentState?.validate();
                if (isValid == true) {
                  context.read<CreateToDoCollctionPageCubit>().submit();
                  context.pop();
                }
              },
              child: const Text('Save Collection'),
            ),
          ],
        ),
      ),
    );
  }
}
