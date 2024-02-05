import 'package:flutter/material.dart';
import 'package:p12_basic_widgets/config/palette.dart';
import 'package:p12_basic_widgets/features/plant_alarm/presentation/alarm_provider.dart';
import 'package:provider/provider.dart';

class CustomNavBar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomNavBar(
      {super.key, required this.selectedIndex, required this.onItemTapped});

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  late bool isSignalActive;

  @override
  void initState() {
    super.initState();

    isSignalActive =
        Provider.of<AlarmProvider>(context, listen: false).isSignalAlarmActive;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AlarmProvider>(
      builder: (BuildContext context, AlarmProvider provider, Widget? child) {
        return BottomNavigationBar(
          selectedItemColor: Theme.of(context).primaryColor,
          showSelectedLabels: false,
          unselectedIconTheme: const IconThemeData(color: dutyUnselectedGrey),
          backgroundColor: provider.isSignalAlarmActive ? dutyBgRed : dutyWhite,
          items: [
            BottomNavigationBarItem(
                icon: const Icon(Icons.map_outlined),
                label: "map",
                backgroundColor:
                    provider.isSignalAlarmActive ? dutyBgRed : dutyWhite),
            BottomNavigationBarItem(
                icon: const Icon(Icons.warning_amber_outlined),
                label: "smoke",
                backgroundColor:
                    provider.isSignalAlarmActive ? dutyBgRed : dutyWhite),
            BottomNavigationBarItem(
                icon: const Icon(
                  Icons.crisis_alert,
                ),
                activeIcon: const Icon(
                  Icons.crisis_alert,
                  color: dutyRed,
                ),
                backgroundColor:
                    provider.isSignalAlarmActive ? dutyBgRed : dutyWhite,
                label: "alarm"),
            const BottomNavigationBarItem(
                icon: Icon(Icons.more_vert), label: "settings"),
          ],
          currentIndex: widget.selectedIndex,
          onTap: widget.onItemTapped,
        );
      },
    );
  }
}
