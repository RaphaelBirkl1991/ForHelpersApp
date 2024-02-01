import 'package:flutter/material.dart';
import 'package:p12_basic_widgets/config/palette.dart';
import 'package:p12_basic_widgets/features/show_settings/application/settings_service.dart';
import 'package:p12_basic_widgets/features/show_settings/domain/enum_color_sheme.dart';

class SchemeSection extends StatefulWidget {
  const SchemeSection({super.key});

  @override
  State<SchemeSection> createState() => _SchemeSection();
}

class _SchemeSection extends State<SchemeSection> {
  int _selectedValue = 1;
  SettingsService settingsService = SettingsService();

  @override
  void initState() {
    if (settingsService.currentMode == ColorMode.lightmode) {
      _selectedValue = 1;
    } else if (settingsService.currentMode == ColorMode.darkmode) {
      _selectedValue = 2;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Color Schemes", style: TextStyle(fontSize: 25)),
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
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: schmeBtnEnabled()
                  ? null
                  : () {
                      if (_selectedValue == 2) {
                        settingsService.setColorMode(ColorMode.darkmode);
                        setState(() {});
                      } else {
                        settingsService.setColorMode(ColorMode.lightmode);
                        setState(() {});
                      }
                    },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
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

  bool schmeBtnEnabled() {
    if (_selectedValue == 1 &&
        settingsService.currentMode == ColorMode.darkmode) {
      return false;
    } else if (_selectedValue == 2 &&
        settingsService.currentMode == ColorMode.lightmode) {
      return false;
    } else {
      return true;
    }
  }
}
