import 'package:demo_app_flutter/data/model/home_model.dart';

import '../../../data/repo/home_repo.dart';
import '../../../data/repo/home_repo_impl.dart';
import 'home_event.dart';
import 'home_state.dart';
import 'package:bloc/bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeRepo homeRepo = HomeRepoImpl();
  HomeBloc() : super(HomeScreenInitialState()) {
    on<HomeScreenAddEvent>((event, emit) async {
      try {
        emit(HomeScreenLoadingState());

        HomeModel? record = await homeRepo.getHomeModelData();

        emit(HomeScreenLoadedState(fieldData: record));
      } catch (e) {
        emit(HomeScreenErrorState(
          message: 'Unknown Exception',
        ));
      }
    });
  }
}
