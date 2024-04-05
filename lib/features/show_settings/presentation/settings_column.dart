// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:p12_basic_widgets/features/show_settings/presentation/section/language_section.dart';
import 'package:p12_basic_widgets/features/show_settings/presentation/section/map_style_section.dart';
import 'package:p12_basic_widgets/features/show_settings/presentation/section/scheme_section.dart';

class SettingsColumn extends StatefulWidget {
  const SettingsColumn({super.key});

  @override
  State<SettingsColumn> createState() => _SettingsColumnState();
}

class _SettingsColumnState extends State<SettingsColumn> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Spacer(),
            LanguageSection(),
            // Spacer(),
            SchemeSection(),
            MapStyleSection(),
            //  Spacer(),
          ],
        ),
      ),
    );
  }
}
