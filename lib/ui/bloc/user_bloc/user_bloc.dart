import 'package:bloc/bloc.dart';
import 'package:demo_app_flutter/data/repo/fire_store_service.dart';
import 'package:demo_app_flutter/ui/bloc/user_bloc/user_event.dart';
import 'package:demo_app_flutter/ui/bloc/user_bloc/user_state.dart';

import '../../../data/model/user_model.dart';
import '../../../data/repo/home_repo.dart';
import '../../../data/repo/home_repo_impl.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  HomeRepo homeRepo = HomeRepoImpl();

  UserBloc() : super(UserInitialState()) {
    on<UserAddEvent>(
      (event, emit) async {
        try {
          emit(UserLoadingState());

          UserModel? record = await homeRepo.getUserModelData();

          emit(UserLoadedState());
        } catch (e) {
          emit(UserErrorState(message: 'Failed to add Data.'));
        }
      },
    );

    on<AddDataEvent>(
      (event, emit) async {
        try {
          emit(UserLoadingState());

          emit(UserLoadedState());
        } catch (e) {
          emit(UserErrorState(message: 'Failed to add Data.'));
        }
      },
    );
    on<EditDataEvent>(
      (event, emit) async {
        try {
          emit(UserLoadingState());

          emit(UserLoadedState());
        } catch (e) {
          emit(UserErrorState(message: 'Failed to edit Data.'));
        }
      },
    );

    on<DeleteDataEvent>(
      (event, emit) async {
        try {
          emit(UserLoadingState());

          // await fireStoreService.deleteUserDetails(event.userId!);

          emit(UserLoadedState());
        } catch (e) {
          emit(UserErrorState(message: 'Failed to edit Data.'));
        }
      },
    );
  }
}
