import 'package:flutter/material.dart';

class MSTabbarItem extends BottomNavigationBarItem {
  MSTabbarItem({
    required IconData icon,
    required String title,
    double? size,
  }) : super(
          icon: Icon(
            icon,
            color: Colors.grey,
            size: size ?? 32,
          ),
          activeIcon: Icon(
            icon,
            color: Colors.green,
            size: size ?? 32,
          ),
          label: title,
        );
}
