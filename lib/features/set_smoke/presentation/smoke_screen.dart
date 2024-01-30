import 'package:flutter/material.dart';
import 'package:p12_basic_widgets/features/set_smoke/data/database_set_smoke_repository.dart';
import 'package:p12_basic_widgets/features/set_smoke/presentation/smoke_drawer.dart';

class SmokeSignalScreen extends StatefulWidget {
  final DatabaseSetSmokeRepository databaseSetSmokeRepository;

  const SmokeSignalScreen({
    super.key,
    required this.databaseSetSmokeRepository,
  });

  @override
  State<SmokeSignalScreen> createState() => _SmokeSignalScreenState();
}

class _SmokeSignalScreenState extends State<SmokeSignalScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: DrawerSmokeScreen(
        databaseSetSmokeRepository: widget.databaseSetSmokeRepository,
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
            child: ElevatedButton(
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
    );
  }
}
