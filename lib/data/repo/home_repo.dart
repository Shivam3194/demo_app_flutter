import 'package:demo_app_flutter/data/model/home_model.dart';

abstract class HomeRepo {
  Future<HomeModel> getHomeModelData();
}
