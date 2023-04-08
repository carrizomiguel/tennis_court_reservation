import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tennis_booking/ui/features/home/home.dart';
import 'package:tennis_booking/ui/shared/shared.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  CustomBottomNavigationBar({super.key});

  final list = BottomNavigationBarModel.list;

  @override
  Widget build(BuildContext context) {
    final currentLocation = GoRouter.of(context).location;

    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: kShadowColor.withAlpha(20),
            blurRadius: 60,
            offset: const Offset(0, -4),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (var item in list) ...[
            NavigationItem(
              icon: item.icon,
              title: item.title,
              path: item.path,
              active: currentLocation == item.path,
            ),
          ],
        ],
      ),
    );
  }
}

class NavigationItem extends StatelessWidget {
  const NavigationItem({
    super.key,
    required this.icon,
    required this.title,
    required this.path,
    required this.active,
  });

  final IconData icon;
  final String title;
  final String path;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(path),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: kSecondaryColor.withOpacity(
              active ? 1 : .3,
            ),
          ),
          Text(
            title,
            style: TextStyle(
              color: kSecondaryColor.withOpacity(
                active ? 1 : .3,
              ),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
