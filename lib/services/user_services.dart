import 'dart:developer';
import 'package:appscrip_task/model/user_model.dart';
import 'package:dio/dio.dart';

class UserServices{

  Future<List<UserModel>?> fetchUsers() async {
  var dio = Dio();
  try {
    Response response = await dio.get('https://jsonplaceholder.typicode.com/users');
  if (response.statusCode == 200) {
        final List<dynamic> json = response.data;
        // print('Response: ${response.data}');
        final List<UserModel> userList = json.map((item) => UserModel.fromJson(item)).toList();
        return userList;
      } else {
        throw Exception('Failed to load data');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        log("${e.response?.data}");
      }
    }
    return null;
}
}