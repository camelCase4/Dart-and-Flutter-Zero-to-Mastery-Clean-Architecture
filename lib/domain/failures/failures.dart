import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class Failure {}

class ServerFailure extends Failure with EquatableMixin{
  ServerFailure({this.stackTrace});

  final String? stackTrace;

  @override
  List<Object?> get props => [stackTrace];

  
}