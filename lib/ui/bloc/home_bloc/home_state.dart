import 'package:demo_app_flutter/data/model/home_model.dart';
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {}

class HomeScreenInitialState extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeScreenLoadingState extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeScreenLoadedState extends HomeState {
  final HomeModel? fieldData;

  HomeScreenLoadedState({
    required this.fieldData,
  });
  @override
  List<Object?> get props => [];
}

class HomeScreenErrorState extends HomeState {
  final String message;

  HomeScreenErrorState({
    required this.message,
  });
  @override
  List<Object?> get props => [message];
}

class HomeScreenEmptyState extends HomeState {
  @override
  List<Object?> get props => [];
}
