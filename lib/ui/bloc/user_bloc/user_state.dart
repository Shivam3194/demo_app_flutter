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
  @override
  List<Object?> get props => [];
}

class UserErrorState extends UserState {
  final String message;

  UserErrorState({
    required this.message,
  });
  @override
  List<Object?> get props => [];
}
