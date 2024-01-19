import 'package:flutter/material.dart';
import 'package:p12_basic_widgets/application/services/documentation_column.dart';
import 'package:p12_basic_widgets/application/services/settings_column.dart';
import 'package:p12_basic_widgets/presentation/about_screen.dart';

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
          bottom: TabBar(
            indicatorColor: Theme.of(context).primaryColor,
            automaticIndicatorColorAdjustment: true,
            indicatorWeight: 2,
            dividerColor: Colors.grey,
            labelColor: Theme.of(context).primaryColor,
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
