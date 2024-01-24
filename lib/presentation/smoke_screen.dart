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
              child: Text(
                'specify your signal',
                style: TextStyle(fontSize: 25),
              ),
            ),
            ListTile(
              leading: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.radio_button_unchecked)),
              title: const Text('pending violence'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.radio_button_unchecked)),
              title: const Text('first aid meassures'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.radio_button_unchecked)),
              title: const Text('evacuation'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.radio_button_unchecked)),
              title: const Text('tracing after crime'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            const Spacer(),
            const Spacer(),
            ListTile(
              leading: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.check_box_outline_blank)),
              title: const Text("> 10 delinquents"),
              onTap: () {},
            ),
            ListTile(
              leading: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.check_box_outline_blank)),
              title: const Text("drug abuse"),
              onTap: () {},
            ),
            ListTile(
              leading: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.check_box_outline_blank)),
              title: const Text("weapons involved"),
              onTap: () {},
            ),
            const Divider(),
            Row(
              children: [
                const Spacer(),
                ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      "Set Signal",
                      style: TextStyle(color: Colors.white),
                    )),
                const SizedBox(width: 11),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  child: const Text("Cancel",
                      style: TextStyle(color: Colors.black)),
                ),
              ],
            )
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
