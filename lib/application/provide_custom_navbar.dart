import 'package:flutter/material.dart';

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
      items: [
        BottomNavigationBarItem(
            icon:
                Icon(Icons.map_outlined, color: Theme.of(context).primaryColor),
            label: "map"),
        BottomNavigationBarItem(
            icon: Icon(Icons.warning_amber_outlined,
                color: Theme.of(context).primaryColor),
            label: "smoke"),
        BottomNavigationBarItem(
            icon: Icon(Icons.alarm, color: Theme.of(context).primaryColor),
            label: "alarm"),
        BottomNavigationBarItem(
            icon: Icon(Icons.more_vert, color: Theme.of(context).primaryColor),
            label: "settings"),
      ],
      currentIndex: widget.selectedIndex,
      onTap: widget.onItemTapped,
    );
  }
}
