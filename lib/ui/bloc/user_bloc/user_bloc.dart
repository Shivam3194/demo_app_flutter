import 'package:bloc/bloc.dart';
import 'package:demo_app_flutter/ui/bloc/user_bloc/user_event.dart';
import 'package:demo_app_flutter/ui/bloc/user_bloc/user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitialState()) {}
}
