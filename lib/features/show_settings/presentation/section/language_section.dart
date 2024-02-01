import 'package:flutter/material.dart';
import 'package:p12_basic_widgets/config/palette.dart';
import 'package:p12_basic_widgets/features/show_settings/application/settings_service.dart';
import 'package:p12_basic_widgets/features/show_settings/domain/enum_language.dart';

class LanguageSection extends StatefulWidget {
  const LanguageSection({super.key});

  @override
  State<LanguageSection> createState() => _LanguageSection();
}

class _LanguageSection extends State<LanguageSection> {
  int _selectedValue = 1;
  SettingsService settingsService = SettingsService();
  @override
  void initState() {
    if (settingsService.currentLanguage == Language.english) {
      _selectedValue = 1;
    } else if (settingsService.currentLanguage == Language.german) {
      _selectedValue = 2;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Language",
          style: TextStyle(fontSize: 25),
        ),
        RadioListTile(
          title: const Text('English'),
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
          title: const Text('German'),
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
              onPressed: languageBtnEnabled()
                  ? null
                  : () {
                      // selVal 1 = english
                      // selVal 2 = deutsch
                      if (_selectedValue == 2) {
                        settingsService.setLanguage(Language.german);
                        setState(() {});
                      } else {
                        settingsService.setLanguage(Language.english);
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

  bool languageBtnEnabled() {
    if (_selectedValue == 1 &&
        settingsService.currentLanguage == Language.german) {
      return false;
    } else if (_selectedValue == 2 &&
        settingsService.currentLanguage == Language.english) {
      return false;
    } else {
      return true;
    }
  }
}
