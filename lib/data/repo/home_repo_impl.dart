import 'dart:convert';
import 'package:demo_app_flutter/data/model/home_model.dart';
import 'package:http/http.dart' as http;

import '../model/user_model.dart';
import 'home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  @override
  Future<HomeModel> getHomeModelData() async {
    String ApiOneUrl = 'https://reqres.in/api/users?page=2';
    final response = await http.get(Uri.parse(ApiOneUrl));
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return HomeModel.fromJson(body);
    } else {
      throw Exception('Error');
    }
  }

  @override
  Future<UserModel> getUserModelData() async {
    String ApiTwoUrl = 'https://reqres.in/api/users/7';
    final response = await http.get(Uri.parse(ApiTwoUrl));
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return UserModel.fromJson(body);
    } else {
      throw Exception('Error');
    }
  }
}
