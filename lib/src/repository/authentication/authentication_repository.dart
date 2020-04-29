import 'dart:async';

import 'package:baseflutter/src/local/dao/user_dao.dart';
import 'package:baseflutter/src/local/model/user_model.dart';


class AuthenticationRepository {
  static const int _id = 1;
  final userDao = UserDao();

  Future<void> deleteAll() async {
    try {
      await userDao.deleteAllUserModels();
      return true;
    } on Exception catch (e) {
      print('custom exception is been obtained');
    }
    return false;
  }

  Future<void> deleteUser() async {
    try {
      await userDao.deleteUserModel(_id);
      return true;
    } on Exception catch (e) {
      print('custom exception is been obtained');
    }
    return false;
  }

  Future<void> persistUser(UserModel userModel) async {
    try {
      await userDao.createUserModel(userModel);
      return true;
    } on Exception catch (e) {
      print('custom exception is been obtained');
    }
    return false;
  }

  Future<bool> hasUser() async {
    try {
      var user = await userDao.getUserAllModels();

      print(user.length);

      if (user.length > 0) {
        return true;
      }
    } on Exception catch (e) {
      print('custom exception is been obtained');
    }
    return false;
  }

  Future<String> fetchUser() async {
    var user;
    try {
      user = await userDao.getUserModels(query: _id.toString());
    } on Exception catch (e) {
      print('custom exception is been obtained');
    }
    return user;
  }
}