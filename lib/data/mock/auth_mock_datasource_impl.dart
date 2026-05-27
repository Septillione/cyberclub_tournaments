// lib/data/datasources/auth_mock_datasource_impl.dart
import 'package:cyberclub_tournaments/data/datasources/auth_remote_datasource.dart';
import 'package:cyberclub_tournaments/data/models/auth/auth_models.dart';
import 'package:flutter/material.dart';

class AuthMockDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<AuthResponseModel> login(LoginRequestModel request) async {
    await Future.delayed(const Duration(seconds: 1));
    debugPrint("MOCK: Logging in user ${request.email}");
    return const AuthResponseModel(
      accessToken: 'mock_access_token_for_demo_user_1',
      refreshToken: 'mock_refresh_token_for_demo_user_1',
    );
  }

  @override
  Future<AuthResponseModel> register(RegisterRequestModel request) async {
    await Future.delayed(const Duration(seconds: 1));
    debugPrint("MOCK: Registering user ${request.email}");
    return const AuthResponseModel(
      accessToken: 'mock_access_token_for_demo_user_1',
      refreshToken: 'mock_refresh_token_for_demo_user_1',
    );
  }

  @override
  Future<void> logout() async {
    await Future.delayed(const Duration(milliseconds: 200));
    debugPrint("MOCK: Logging out");
  }
}
