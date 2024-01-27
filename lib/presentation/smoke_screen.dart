import 'package:flutter/material.dart';
import 'package:p12_basic_widgets/application/provide_smoke_drawer.dart';

class SmokeSignalScreen extends StatefulWidget {
  const SmokeSignalScreen({super.key});

  @override
  State<SmokeSignalScreen> createState() => _SmokeSignalScreenState();
}

class _SmokeSignalScreenState extends State<SmokeSignalScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
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
                  // Scaffold.of(context).openDrawer();
                },
                child: const Text(
                  "prepare smokesign",
                  style: TextStyle(color: Colors.white),
                )),
          ),
          const Spacer(),
          const Spacer(),
        ],
      ),
    );
  }
}
