import 'package:flutter/material.dart';

class DrawerSmokeScreen extends StatefulWidget {
  const DrawerSmokeScreen({super.key});

  @override
  State<DrawerSmokeScreen> createState() => _DrawerSmokeScreenState();
}

class _DrawerSmokeScreenState extends State<DrawerSmokeScreen> {
  int selectedValue = -1;
  bool isDelinquentsChecked = false;
  bool isDrugAbuseChecked = false;
  bool isWeaponsInvolvedChecked = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            child: Text(
              'specify your signal',
              style: TextStyle(fontSize: 25),
            ),
          ),
          RadioListTile<int>(
              title: const Text("pending violence"),
              value: 1,
              groupValue: selectedValue,
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    selectedValue = value;
                  });
                }
              }),
          RadioListTile<int>(
              title: const Text("first aid meassures"),
              value: 2,
              groupValue: selectedValue,
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    selectedValue = value;
                  });
                }
              }),
          RadioListTile<int>(
              title: const Text("evacuation"),
              value: 3,
              groupValue: selectedValue,
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    selectedValue = value;
                  });
                }
              }),
          RadioListTile<int>(
              title: const Text("tracing after crime"),
              value: 4,
              groupValue: selectedValue,
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    selectedValue = value;
                  });
                }
              }),
          const Divider(),
          CheckboxListTile(
            title: const Text('> 10 delinquents'),
            value: isDelinquentsChecked,
            onChanged: (value) {
              setState(() {
                isDelinquentsChecked = !isDelinquentsChecked;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('drug abuse'),
            value: isDrugAbuseChecked,
            onChanged: (value) {
              setState(() {
                isDrugAbuseChecked = !isDrugAbuseChecked;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('weapons involved'),
            value: isWeaponsInvolvedChecked,
            onChanged: (value) {
              setState(() {
                isWeaponsInvolvedChecked = !isWeaponsInvolvedChecked;
              });
            },
          ),
          const Divider(),
          Row(
            children: [
              const Spacer(),
              ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    "Set Signal",
                    style: TextStyle(color: Colors.white),
                  )),
              const SizedBox(width: 11),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
                child:
                    const Text("Cancel", style: TextStyle(color: Colors.black)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
