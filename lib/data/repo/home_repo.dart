import 'package:demo_app_flutter/data/model/home_model.dart';

import '../model/user_model.dart';

abstract class HomeRepo {
  Future<HomeModel> getHomeModelData();
  Future<UserModel> getUserModelData();
}
