import 'package:cyberclub_tournaments/data/repositories/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _chechkAuth();
  }

  Future<void> _chechkAuth() async {
    // await Future.delayed(const Duration(seconds: 5));
    final isLogedIn = await context.read<AuthRepository>().isLoggedIn();

    print('Splash: is Logged in? $isLogedIn');
    if (mounted) {
      if (isLogedIn) {
        print('Splash: going to /tournaments');
        context.go('/tournaments');
      } else {
        print('Splash: going to /login');
        context.go('/login');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
    // return const Scaffold(body: Center(child: Text('Splash Screen')));
  }
}
