import 'package:flutter/material.dart';
import 'package:p12_basic_widgets/config/palette.dart';
import 'package:p12_basic_widgets/features/show_settings/data/database_settings_repository.dart';
import 'package:p12_basic_widgets/features/show_settings/domain/enum_language.dart';

class LanguageSection extends StatefulWidget {
  final DatabaseSettingsRepository databaseSettingsRepository;

  const LanguageSection({super.key, required this.databaseSettingsRepository});

  @override
  State<LanguageSection> createState() => _LanguageSection();
}

class _LanguageSection extends State<LanguageSection> {
  int _selectedValue = 1;
  bool isLangBtnLoading = false;

  @override
  Widget build(BuildContext context) {
    final languageFuture = widget.databaseSettingsRepository.getLanguage();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FutureBuilder(
          future: languageFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const Text("An error occured");
            } else {
              final language = snapshot.data!;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Language",
                    style: TextStyle(fontSize: 25),
                  ),
                  const SizedBox(height: 15),
                  RadioListTile(
                    title: const Text('English'),
                    activeColor: Theme.of(context).primaryColor,
                    value: 1,
                    groupValue: _selectedValue,
                    onChanged: (value) async {
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
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: _languageBtnEnabled(language)
                            ? null
                            : () {
                                saveLanguage();
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
                        child: isLangBtnLoading
                            ? const CircularProgressIndicator(color: dutyWhite)
                            : const Text(
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

  saveLanguage() async {
    setState(() {
      isLangBtnLoading = true;
    });
    await Future.delayed(const Duration(seconds: 1));
    if (_selectedValue == 2) {
      setState(() {
        widget.databaseSettingsRepository.setLanguage(Language.german);
        isLangBtnLoading = false;
      });
    } else {
      setState(() {
        widget.databaseSettingsRepository.setLanguage(Language.english);
        isLangBtnLoading = false;
      });
    }
  }

  bool _languageBtnEnabled(Language currentLanguage) {
    if (_selectedValue == 1 && currentLanguage == Language.german) {
      return false;
    } else if (_selectedValue == 2 && currentLanguage == Language.english) {
      return false;
    } else {
      return true;
    }
  }
}
