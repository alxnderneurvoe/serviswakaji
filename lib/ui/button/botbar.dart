import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      onTap: onTap,
      selectedItemColor: Colors.brown.shade900,
      unselectedItemColor: Colors.grey, // Assuming you have defined darkbrown
      items: [
        _buildNavItem(Icons.dashboard_sharp, 'Dashboard', 0),
        _buildNavItem(Icons.shopping_cart, 'Shop', 1),
        _buildNavItem(Icons.directions_car, 'Kendaraan', 2),
        _buildNavItem(Icons.person, 'Profil', 3),
      ],
    );
  }

  BottomNavigationBarItem _buildNavItem(
    IconData icon,
    String label,
    int index,
  ) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}
