// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:p12_basic_widgets/features/show_settings/presentation/section/language_section.dart';
import 'package:p12_basic_widgets/features/show_settings/presentation/section/scheme_section.dart';

class SettingsColumn extends StatefulWidget {
  const SettingsColumn({super.key});

  @override
  State<SettingsColumn> createState() => _SettingsColumnState();
}

class _SettingsColumnState extends State<SettingsColumn> {
  @override
  Widget build(BuildContext context) {
    // to do padding: 16
    // ignore: prefer_const_constructors
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacer(),
          LanguageSection(),
          Spacer(),
          SchemeSection(),
          Spacer(),
          //  PinSection(),
          //  Spacer(),
        ],
      ),
    );

    //Column(
    // crossAxisAlignment: CrossAxisAlignment.start,
    // children: [
    //   const LanguageSection(),
    //   const SchemeSection(),
    //   const PinSection(),
    // ],
    //  );
  }
}
