import 'package:flutter/material.dart';
import 'package:p12_basic_widgets/application/provider/documentation_column.dart';
import 'package:p12_basic_widgets/application/provider/settings_column.dart';
import 'package:p12_basic_widgets/presentation/main_screens/about_screen.dart';

class TabBarScreen extends StatelessWidget {
  const TabBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: Theme.of(context).primaryColor,
        indicatorColor: Theme.of(context).primaryColor,
      ),
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
          bottom: TabBar(
            labelStyle: TextStyle(color: Theme.of(context).primaryColor),
            labelColor: Theme.of(context).primaryColor,
            unselectedLabelColor: Colors.black,
            indicatorColor: Theme.of(context).primaryColor,
            automaticIndicatorColorAdjustment: true,
            indicatorWeight: 2,
            dividerColor: Colors.grey,
            tabs: const <Widget>[
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