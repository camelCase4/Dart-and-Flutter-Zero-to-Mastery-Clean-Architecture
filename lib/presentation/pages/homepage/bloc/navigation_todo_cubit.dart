

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/domain/entities/unique_id.dart';

part 'navigation_todo_cubit_state.dart';


class NavigationToDoCubit extends Cubit<NavigationToDoCubitState>{
  NavigationToDoCubit() : super(const NavigationToDoCubitState());
}