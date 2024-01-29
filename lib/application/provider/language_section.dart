import 'package:flutter/material.dart';

class LanguageSection extends StatefulWidget {
  const LanguageSection({super.key});

  @override
  State<LanguageSection> createState() => _LanguageSection();
}

class _LanguageSection extends State<LanguageSection> {
  int _selectedValue = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
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
        RadioListTile(
          title: const Text('Bavarian'),
          activeColor: Theme.of(context).primaryColor,
          value: 3,
          groupValue: _selectedValue,
          onChanged: (value) {
            setState(() {
              _selectedValue = value as int;
            });
          },
          controlAffinity: ListTileControlAffinity.trailing,
        ),
      ],
    );
  }
}
