import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/domain/entities/unique_id.dart';
import 'package:todo_app/domain/usecases/create_todo_entry.dart';
import 'package:todo_app/presentation/core/form_value.dart';

part 'create_todo_entry_page_state.dart';

class CreateToDoEntryPageCubit extends Cubit<CreateToDoEntryPageState> {
  CreateToDoEntryPageCubit({required this.addToDoEntry,required this.collectionId})
      : super(const CreateToDoEntryPageState());

  final CollectionId collectionId;
  final CreateToDoEntry addToDoEntry;

  void submit() {}

  void descriptionChanged({String? description}) {
    ValidationStatus currentStatus = ValidationStatus.pending;


    if (description == null || description.isEmpty || description.length < 2) {
      currentStatus = ValidationStatus.error;
    } else {
      currentStatus = ValidationStatus.success;
    }

    emit(
      state.copyWith(
        description:
            FormValue(value: description!, validationStatus: currentStatus),
      ),
    );
  }
}
