import 'package:flutter/material.dart';

class DrawerSmokeScreen extends StatelessWidget {
  const DrawerSmokeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                child:
                    const Text("Cancel", style: TextStyle(color: Colors.black)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
