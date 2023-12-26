import 'package:demo_app_flutter/data/model/home_model.dart';
import 'package:equatable/equatable.dart';

import '../../../data/model/user_model.dart';

abstract class UserEvent extends Equatable {}

class UserAddEvent extends UserEvent {
  @override
  List<Object?> get props => [];
}

class AddDataEvent extends UserEvent {
  final UserModel? userModel;

  AddDataEvent({
    this.userModel,
  });

  @override
  List<Object?> get props => [userModel];
}

class EditDataEvent extends UserEvent {
  final UserModel? userModel;

  EditDataEvent({
    this.userModel,
  });

  @override
  List<Object?> get props => [userModel];
}

class DeleteDataEvent extends UserEvent {
  final String? userId;

  DeleteDataEvent({
    this.userId,
  });
  @override
  List<Object?> get props => [];
}
