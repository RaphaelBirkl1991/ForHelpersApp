import 'package:flutter/material.dart';

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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
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
