import 'package:demo_app_flutter/ui/bloc/user_bloc/user_bloc.dart';
import 'package:demo_app_flutter/ui/bloc/user_bloc/user_event.dart';
import 'package:demo_app_flutter/ui/bloc/user_bloc/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:easy_refresh/easy_refresh.dart';

import '../../../custom_files/app_colors.dart';
import '../../views/home_screen.dart';
import '../../views/single_user_page.dart';

class UserView extends StatelessWidget {
  const UserView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    return BlocProvider(
      create: (context) => UserBloc()..add(UserAddEvent()),
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserInitialState || state is UserLoadingState) {
            return const Scaffold(
              body: Center(
                child: SpinKitCircle(
                  color: AppColors.blue,
                  size: 40.0,
                ),
              ),
            );
          }
          if (state is UserLoadedState) {
            return SingleUserPage(state: state);
          } else if (state is UserErrorState) {
            return Scaffold(
              body: Center(
                child: Text(
                  state.message,
                ),
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
