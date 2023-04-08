import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarModel extends Equatable {
  const BottomNavigationBarModel({
    required this.icon,
    required this.title,
    required this.path,
  });

  final IconData icon;
  final String title;
  final String path;

  static List<BottomNavigationBarModel> list = [
    const BottomNavigationBarModel(
      icon: Icons.calendar_month,
      title: 'Schedule',
      path: '/schedule',
    ),
    const BottomNavigationBarModel(
      icon: Icons.search,
      title: 'Explore',
      path: '/explore',
    ),
    const BottomNavigationBarModel(
      icon: Icons.cloud_queue_rounded,
      title: 'Weather',
      path: '/weather',
    ),
    const BottomNavigationBarModel(
      icon: Icons.person,
      title: 'Account',
      path: '/account',
    ),
  ];

  @override
  List<Object?> get props => [
        icon,
        title,
        path,
      ];
}
