import 'package:flutter/material.dart';
import 'package:p12_basic_widgets/config/palette.dart';
import 'package:p12_basic_widgets/features/infrastructure/presentation/custom_navbar.dart';
import 'package:p12_basic_widgets/features/infrastructure/presentation/duty_dialogs.dart';
import 'package:p12_basic_widgets/features/plant_smoke/application/smoke_provider.dart';
import 'package:p12_basic_widgets/features/plant_smoke/data/firebase/firebase_smoke_repository.dart';
import 'package:p12_basic_widgets/features/plant_smoke/presentation/smoke_drawer.dart';
import 'package:provider/provider.dart';

class SmokeSignalScreen extends StatefulWidget {
  final FirebaseSmokeRepository databaseSetSmokeRepository;

  const SmokeSignalScreen({
    super.key,
    required this.databaseSetSmokeRepository,
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
    return Consumer<SmokeController>(
      builder: (BuildContext context, SmokeController provider, Widget? child) {
        return Scaffold(
          key: _scaffoldKey,
          drawer: DrawerSmokeScreen(
            databaseSmokeRepository: widget.databaseSetSmokeRepository,
          ),
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
                child: provider.isSmokeActive
                    ? ElevatedButton(
                        onPressed: () {
                          dutyDialog.confirmSmokeDeletetion(
                              context, widget.databaseSetSmokeRepository);
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
          backgroundColor: provider.isSmokeActive ? dutyBgYellow : dutyWhite,
        );
      },
    );
  }
}
