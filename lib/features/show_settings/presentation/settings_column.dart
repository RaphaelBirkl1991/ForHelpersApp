// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:p12_basic_widgets/features/show_settings/data/database_settings_repository.dart';
import 'package:p12_basic_widgets/features/show_settings/presentation/section/language_section.dart';
import 'package:p12_basic_widgets/features/show_settings/presentation/section/scheme_section.dart';

class SettingsColumn extends StatefulWidget {
  final DatabaseSettingsRepository databaseSettingsRepository;

  const SettingsColumn({super.key, required this.databaseSettingsRepository});

  @override
  State<SettingsColumn> createState() => _SettingsColumnState();
}

class _SettingsColumnState extends State<SettingsColumn> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(),
          LanguageSection(
              databaseSettingsRepository: widget.databaseSettingsRepository),
          const Spacer(),
          SchemeSection(
              databaseSettingsRepository: widget.databaseSettingsRepository),
          const Spacer(),
        ],
      ),
    );
  }
}
