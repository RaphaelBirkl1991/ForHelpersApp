import 'package:flutter/material.dart';
import 'package:p12_basic_widgets/config/configuration.dart';
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
  bool isSignalActive = Configuration.isSignalAlarmActive;

  @override
  void initState() {
    super.initState();

    Configuration.onStateChanged = (isSignalAlarmActive) {
      setState(() {
        isSignalActive = isSignalAlarmActive;
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Theme.of(context).primaryColor,
      showSelectedLabels: false,
      unselectedIconTheme: const IconThemeData(color: dutyUnselectedGrey),
      backgroundColor: isSignalActive ? dutyBgRed : dutyWhite,
      items: [
        BottomNavigationBarItem(
            icon: const Icon(Icons.map_outlined),
            label: "map",
            backgroundColor: isSignalActive ? dutyBgRed : dutyWhite),
        BottomNavigationBarItem(
            icon: const Icon(Icons.warning_amber_outlined),
            label: "smoke",
            backgroundColor: isSignalActive ? dutyBgRed : dutyWhite),
        BottomNavigationBarItem(
            icon: const Icon(
              Icons.crisis_alert,
            ),
            activeIcon: const Icon(
              Icons.crisis_alert,
              color: dutyRed,
            ),
            backgroundColor: isSignalActive ? dutyBgRed : dutyWhite,
            label: "alarm"),
        const BottomNavigationBarItem(
            icon: Icon(Icons.more_vert), label: "settings"),
      ],
      currentIndex: widget.selectedIndex,
      onTap: widget.onItemTapped,
    );
  }
}
