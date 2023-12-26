import 'package:demo_app_flutter/data/model/home_model.dart';
import 'package:demo_app_flutter/data/model/user_model.dart';
import 'package:equatable/equatable.dart';

abstract class UserState extends Equatable {}

class UserInitialState extends UserState {
  @override
  List<Object?> get props => [];
}

class UserLoadingState extends UserState {
  @override
  List<Object?> get props => [];
}

class UserLoadedState extends UserState {
  final UserModel? userModel;

  UserLoadedState({
    this.userModel,
  });
  @override
  List<Object?> get props => [userModel];
}

class UserOperationSuccessState extends UserState {
  final String? message;

  UserOperationSuccessState({
    this.message,
  });
  @override
  List<Object?> get props => [message];
}

class UserErrorState extends UserState {
  final String message;

  UserErrorState({
    required this.message,
  });
  @override
  List<Object?> get props => [message];
}
