import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:easy_refresh/easy_refresh.dart';

import '../../../custom_files/app_colors.dart';
import '../../views/home_screen.dart';
import 'home_bloc.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    return BlocProvider(
      create: (context) => HomeBloc()..add(HomeScreenAddEvent()),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeScreenInitialState ||
              state is HomeScreenLoadingState) {
            return const Scaffold(
              body: Center(
                child: SpinKitCircle(
                  color: AppColors.blue,
                  size: 40.0,
                ),
              ),
            );
          }
          if (state is HomeScreenLoadedState) {
            return EasyRefresh(
              controller: EasyRefreshController(),
              onRefresh: () {
                BlocProvider.of<HomeBloc>(context).add(HomeScreenAddEvent());
              },
              child: HomeScreen(state: state),
            );
          } else if (state is HomeScreenEmptyState) {
            return const Center(child: Text("No Data Found"));
          }
          return const SizedBox();
        },
      ),
    );
  }
}
