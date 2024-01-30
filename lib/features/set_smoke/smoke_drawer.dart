import 'package:flutter/material.dart';
import 'package:p12_basic_widgets/data/mock/mock_service.dart';
import 'package:p12_basic_widgets/domain/enums/enum_additional_info.dart';
import 'package:p12_basic_widgets/domain/enums/enum_smoke_specification.dart';

class DrawerSmokeScreen extends StatefulWidget {
  const DrawerSmokeScreen({super.key});

  @override
  State<DrawerSmokeScreen> createState() => _DrawerSmokeScreenState();
}

class _DrawerSmokeScreenState extends State<DrawerSmokeScreen> {
  int selectedValue = -1;
  SmokeSpecification? specification;
  bool isDelinquentsChecked = false;
  bool isDrugAbuseChecked = false;
  bool isWeaponsInvolvedChecked = false;
  late MaterialStatesController buttonStatesController;

  final MockService mockService = MockService();

  @override
  void initState() {
    super.initState();
    buttonStatesController = MaterialStatesController();
  }

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
              activeColor: Theme.of(context).primaryColor,
              value: 1,
              groupValue: selectedValue,
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    selectedValue = value;

                    specification = SmokeSpecification.pendingViolence;
                  });
                }
              }),
          RadioListTile<int>(
              title: const Text("first aid meassures"),
              activeColor: Theme.of(context).primaryColor,
              value: 2,
              groupValue: selectedValue,
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    selectedValue = value;
                    specification = SmokeSpecification.firstAid;
                  });
                }
              }),
          RadioListTile<int>(
              title: const Text("evacuation"),
              activeColor: Theme.of(context).primaryColor,
              value: 3,
              groupValue: selectedValue,
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    selectedValue = value;
                    specification = SmokeSpecification.evacuation;
                  });
                }
              }),
          RadioListTile<int>(
              title: const Text("tracing after crime"),
              activeColor: Theme.of(context).primaryColor,
              value: 4,
              groupValue: selectedValue,
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    selectedValue = value;
                    specification = SmokeSpecification.tracing;
                  });
                }
              }),
          const Divider(),
          CheckboxListTile(
            title: const Text('> 10 delinquents'),
            activeColor: Theme.of(context).primaryColor,
            value: isDelinquentsChecked,
            onChanged: (value) {
              setState(() {
                isDelinquentsChecked = !isDelinquentsChecked;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('drug abuse'),
            activeColor: Theme.of(context).primaryColor,
            value: isDrugAbuseChecked,
            onChanged: (value) {
              setState(() {
                isDrugAbuseChecked = !isDrugAbuseChecked;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('weapons involved'),
            activeColor: Theme.of(context).primaryColor,
            value: isWeaponsInvolvedChecked,
            onChanged: (value) {
              setState(() {
                isWeaponsInvolvedChecked = !isWeaponsInvolvedChecked;
              });
            },
          ),
          const Divider(),
          const SizedBox(height: 15),
          Row(
            children: [
              const Spacer(),
              ElevatedButton(
                onPressed: isSpecificationSelected(specification)
                    ? () {
                        mockService.createSmokeSign(
                            specification!, buildAddInfo());
                        // buildSpecification();
                        // buildAddInfo();
                      }
                    : null,
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
                  "Set Signal",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(width: 11),
              ElevatedButton(
                onPressed: () {
                  selectedValue = -1;
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
                child:
                    const Text("Cancel", style: TextStyle(color: Colors.black)),
              ),
              const SizedBox(width: 15),
            ],
          )
        ],
      ),
    );
  }

  static bool isSpecificationSelected(SmokeSpecification? specification) {
    if (specification != null) {
      return true;
    } else {
      return false;
    }
  }

  // SmokeSpecification buildSpecification() {
  //   return const SmokeSpecification();
  // }

  List<AdditionalInformation> buildAddInfo() {
    List<AdditionalInformation> addInfoList = [];

    isDelinquentsChecked
        ? addInfoList.add(AdditionalInformation.outnumbered)
        : null;
    isDrugAbuseChecked ? addInfoList.add(AdditionalInformation.drugs) : null;
    isWeaponsInvolvedChecked
        ? addInfoList.add(AdditionalInformation.weapons)
        : null;

    print(addInfoList);
    return addInfoList;
  }
}
