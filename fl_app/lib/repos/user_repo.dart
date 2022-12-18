import 'package:dio/dio.dart';
import 'package:fl_app/repos/user_model.dart';

class UserRepo {
  final Dio dio;

  const UserRepo({
    required this.dio,
  });

  Future<List<UserModel>> getUsers() async {
    try {
      final resp = await dio.get('/users/');
      final users = (resp.data as List<dynamic>)
          .map((e) => UserModel.fromJson(e))
          .toList();

      return users;
    } catch (ex, st) {
      print('$ex$st');
    }

    return [];
  }

  Future<UserModel?> getUser(int vkId) async {
    try {
      final resp = await dio.get('/users/$vkId');
      final user = UserModel.fromJson(resp.data);

      return user;
    } catch (ex, st) {
      print('$ex$st');
    }

    return null;
  }

  // Future<UserModel> getUser(int vkId) async {}
}
