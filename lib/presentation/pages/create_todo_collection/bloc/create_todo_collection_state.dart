
part of 'create_todo_collection_page_cubit.dart';


class CreateToDoCollctionPageState extends Equatable {
  final String? title;
  final String? color;

  const CreateToDoCollctionPageState({this.title, this.color});

  CreateToDoCollctionPageState copyWith({String? title, String? color}) {
    return CreateToDoCollctionPageState(
      color: color ?? this.color,
      title: title ?? this.title,
    );
  }

  @override
  List<Object?> get props => [title, color];
}
