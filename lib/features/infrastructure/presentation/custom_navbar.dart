import 'package:flutter/material.dart';
import 'package:p12_basic_widgets/config/palette.dart';

class CustomNavBar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomNavBar(
      {super.key, required this.selectedIndex, required this.onItemTapped});

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Theme.of(context).primaryColor,
      showSelectedLabels: false,
      // selectedIconTheme: const IconThemeData(color: Colors.green),
      unselectedIconTheme: const IconThemeData(color: dutyUnselectedGrey),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.map_outlined), label: "map"),
        BottomNavigationBarItem(
            icon: Icon(Icons.warning_amber_outlined), label: "smoke"),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.crisis_alert,
            ),
            activeIcon: Icon(
              Icons.crisis_alert,
              color: dutyRed,
            ),
            label: "alarm"),
        BottomNavigationBarItem(icon: Icon(Icons.more_vert), label: "settings"),
      ],
      currentIndex: widget.selectedIndex,
      onTap: widget.onItemTapped,
    );
  }
}
