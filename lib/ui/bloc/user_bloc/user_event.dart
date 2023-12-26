import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {}

class AddDataEvent extends UserEvent {
  final String newData;

  AddDataEvent({
    required this.newData,
  });

  @override
  List<Object?> get props => [newData];
}

class EditDataEvent extends UserEvent {
  final String updatedData;

  EditDataEvent({
    required this.updatedData,
  });

  @override
  List<Object?> get props => [updatedData];
}

class DeleteDataEvent extends UserEvent {
  @override
  List<Object?> get props => [];
}
