import 'package:flutter/material.dart';
import 'package:tennis_booking/ui/features/home/home.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.child,
  });

  static Page<dynamic> page(Widget child) {
    return MaterialPage<void>(
      child: HomePage(
        child: child,
      ),
    );
  }

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return HomeBody(
      child: child,
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: child,
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
