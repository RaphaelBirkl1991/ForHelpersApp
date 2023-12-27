import 'package:flutter/material.dart';
import 'package:p12_basic_widgets/helper_widgets/decumentation_column.dart';
import 'package:p12_basic_widgets/helper_widgets/settings_column.dart';
import 'package:p12_basic_widgets/screens/about_screen.dart';

class TabBarScreen extends StatelessWidget {
  const TabBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const TabBarExample(),
    );
  }
}

class TabBarExample extends StatelessWidget {
  const TabBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                text: "Settings",
              ),
              Tab(
                text: "Documentation",
              ),
              Tab(
                text: "About",
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            SettingsColumn(),
            DocumentationColumn(),
            AboutScreen(),
          ],
        ),
      ),
    );
  }
}
