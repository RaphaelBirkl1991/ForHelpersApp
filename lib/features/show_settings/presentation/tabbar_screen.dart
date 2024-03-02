import 'package:flutter/material.dart';
import 'package:p12_basic_widgets/config/palette.dart';
import 'package:p12_basic_widgets/features/show_settings/application/settings_provider.dart';
import 'package:p12_basic_widgets/features/show_settings/presentation/section/about_section.dart';
import 'package:p12_basic_widgets/features/show_settings/presentation/section/doc_section.dart';
import 'package:p12_basic_widgets/features/show_settings/presentation/settings_column.dart';
import 'package:provider/provider.dart';

class TabBarScreen extends StatelessWidget {
  //  final DatabaseSettingsRepository databaseSettingsRepository;

  const TabBarScreen({super.key});
  //  required this.databaseSettingsRepository,

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<SettingsProvider>(builder: (context, settingsProvider, _) {
        return DefaultTabController(
          initialIndex: 1,
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: dutyWhite,
              bottom: const TabBar(
                tabs: [
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
                //  databaseSettingsRepository: databaseSettingsRepository
                DocumentationColumn(),
                AboutScreen(),
              ],
            ),
          ),
        );
      }),
    );
  }
}
