import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class UserState extends Equatable {}

class UserLoadingState extends UserState {
  @override
  List<Object?> get props => [];
}

class UserLoadedState extends UserState {
  final List<Map> useres;
  UserLoadedState(this.useres);
  @override
  List<Object?> get props => [useres];
}

class UeserErrorState extends UserState {
  final String error;
  UeserErrorState(this.error);
  @override
  List<Object?> get props => [error];
}
