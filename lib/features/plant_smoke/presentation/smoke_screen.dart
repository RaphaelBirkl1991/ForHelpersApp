import 'package:flutter/material.dart';
import 'package:p12_basic_widgets/config/palette.dart';
import 'package:p12_basic_widgets/features/infrastructure/presentation/custom_navbar.dart';
import 'package:p12_basic_widgets/features/infrastructure/presentation/duty_dialogs.dart';
import 'package:p12_basic_widgets/features/plant_smoke/application/smoke_provider.dart';
import 'package:p12_basic_widgets/features/plant_smoke/presentation/smoke_drawer.dart';
import 'package:provider/provider.dart';

class SmokeSignalScreen extends StatefulWidget {
  const SmokeSignalScreen({
    super.key,
  });

  @override
  State<SmokeSignalScreen> createState() => _SmokeSignalScreenState();
}

class _SmokeSignalScreenState extends State<SmokeSignalScreen> {
  final dutyDialog = DutyDialogs();
  CustomNavBar customNavBar = CustomNavBar(
    selectedIndex: 0,
    onItemTapped: (value) {},
  );

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Consumer<SmokeProvider>(
      builder:
          (BuildContext context, SmokeProvider smokeProvider, Widget? child) {
        if (smokeProvider.latestSmokeSign != null) {
          dutyDialog.alarmActive(context);
        }
        return Scaffold(
          key: _scaffoldKey,
          drawer: const DrawerSmokeScreen(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              Text("Precautionary Signal",
                  style: Theme.of(context).textTheme.headlineMedium),
              const Spacer(),
              const Spacer(),
              Center(
                child: Text(
                  "Specify Signal and \nkeep trigger pressed \nto set smokesign",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              const Spacer(),
              Center(
                child: smokeProvider.isSmokeActive
                    ? ElevatedButton(
                        onPressed: () {
                          dutyDialog.confirmSmokeDeletetion(context);
                          //context
                          // widget.databaseSetSmokeRepository
                        },
                        style: ButtonStyle(
                            minimumSize:
                                MaterialStateProperty.all(const Size(300, 38))),
                        child: const Text(
                          "Cancel Smokesignal",
                          style: TextStyle(color: dutyWhite),
                        ))
                    : ElevatedButton(
                        onPressed: () {
                          _scaffoldKey.currentState?.openDrawer();
                        },
                        style: ButtonStyle(
                            minimumSize:
                                MaterialStateProperty.all(const Size(300, 38))),
                        child: const Text(
                          "prepare smokesign",
                          style: TextStyle(color: Colors.white),
                        )),
              ),
              const Spacer(),
            ],
          ),
          backgroundColor:
              smokeProvider.isSmokeActive ? dutyBgYellow : dutyWhite,
        );
      },
    );
  }
}
