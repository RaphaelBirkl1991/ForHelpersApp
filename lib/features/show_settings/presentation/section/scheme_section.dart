import 'package:flutter/material.dart';
import 'package:p12_basic_widgets/config/palette.dart';
import 'package:p12_basic_widgets/features/show_settings/data/database_settings_repository.dart';
import 'package:p12_basic_widgets/features/show_settings/domain/enum_color_sheme.dart';

class SchemeSection extends StatefulWidget {
  final DatabaseSettingsRepository databaseSettingsRepository;

  const SchemeSection({super.key, required this.databaseSettingsRepository});

  @override
  State<SchemeSection> createState() => _SchemeSection();
}

class _SchemeSection extends State<SchemeSection> {
  int _selectedValue = 1;

  @override
  Widget build(BuildContext context) {
    final schemeFuture = widget.databaseSettingsRepository.getColorMode();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FutureBuilder(
          future: schemeFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const Text("An error occured");
            } else {
              final scheme = snapshot.data!;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Color Schemes",
                    style: TextStyle(fontSize: 25),
                  ),
                  const SizedBox(height: 15),
                  RadioListTile(
                    title: const Text('Default'),
                    activeColor: Theme.of(context).primaryColor,
                    value: 1,
                    groupValue: _selectedValue,
                    onChanged: (value) {
                      setState(() {
                        _selectedValue = value as int;
                      });
                    },
                    controlAffinity: ListTileControlAffinity.trailing,
                  ),
                  RadioListTile(
                    title: const Text('Darkmode'),
                    activeColor: Theme.of(context).primaryColor,
                    value: 2,
                    groupValue: _selectedValue,
                    onChanged: (value) {
                      setState(() {
                        _selectedValue = value as int;
                      });
                    },
                    controlAffinity: ListTileControlAffinity.trailing,
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: schmeBtnEnabled(scheme)
                            ? null
                            : () {
                                if (_selectedValue == 2) {
                                  widget.databaseSettingsRepository
                                      .setColorMode(ColorMode.darkmode);
                                  setState(() {});
                                } else {
                                  widget.databaseSettingsRepository
                                      .setColorMode(ColorMode.lightmode);
                                  setState(() {});
                                }
                              },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (states) {
                              if (states.contains(MaterialState.disabled)) {
                                return Colors.grey;
                              }
                              return Theme.of(context).primaryColor;
                            },
                          ),
                        ),
                        child: const Text(
                          "save",
                          style: TextStyle(color: dutyWhite),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }
          },
        ),
      ],
    );
  }

  bool schmeBtnEnabled(ColorMode currentMode) {
    if (_selectedValue == 1 && currentMode == ColorMode.darkmode) {
      return false;
    } else if (_selectedValue == 2 && currentMode == ColorMode.lightmode) {
      return false;
    } else {
      return true;
    }
  }
}
