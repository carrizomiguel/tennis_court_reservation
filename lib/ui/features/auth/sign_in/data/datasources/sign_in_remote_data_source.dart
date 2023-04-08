import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:tennis_booking/core/core.dart';
import 'package:tennis_booking/ui/features/auth/sign_in/sign_in.dart';
import 'package:tennis_booking/ui/shared/shared.dart';

abstract class SignInRemoteDataSource {
  Future<UserModel> singIn(String email, String password);
}

class SignInRemoteDataSourceImpl implements SignInRemoteDataSource {
  SignInRemoteDataSourceImpl();

  @override
  Future<UserModel> singIn(String email, String password) async {
    try {
      final json = rootBundle.loadString('fixtures/users.json');
      final string = await json;
      final list = jsonDecode(string) as List;
      final users = list.map((e) => UserModel.fromJson(e as JSON));
      final user = users.firstWhere((e) => e.email == email);
      return await Future.delayed(const Duration(seconds: 2), () {
        return user;
      });
    } catch (_) {
      throw BadRequestException();
    }
  }
}
