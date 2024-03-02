import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:p12_basic_widgets/config/palette.dart';
import 'package:p12_basic_widgets/features/infrastructure/presentation/duty_dialogs.dart';
import 'package:p12_basic_widgets/features/plant_smoke/application/smoke_provider.dart';
import 'package:p12_basic_widgets/features/plant_smoke/domain/enum_additional_info.dart';
import 'package:p12_basic_widgets/features/plant_smoke/domain/enum_smoke_specification.dart';
import 'package:p12_basic_widgets/features/plant_smoke/domain/smoke_sign.dart';
import 'package:p12_basic_widgets/features/show_map/application/map_provider.dart';
import 'package:provider/provider.dart';

class DrawerSmokeScreen extends StatefulWidget {
  const DrawerSmokeScreen({
    super.key,
  });

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
  final dutyDialog = DutyDialogs();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    buttonStatesController = MaterialStatesController();
  }

  @override
  Widget build(BuildContext context) {
    final mapProvider = Provider.of<MapProvider>(context, listen: false);
    final smokeProvider = Provider.of<SmokeProvider>(context, listen: false);
    final SmokeSign smokeSign;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
            padding: EdgeInsets.fromLTRB(20, 50, 1, 0),
            decoration: BoxDecoration(color: dutyBlue),
            child: Text(
              'specify your signal',
              maxLines: 1,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.normal,
                  color: dutyWhite),
            ),
          ),
          RadioListTile<int>(
              title: const Text(
                "pending violence",
                style: TextStyle(color: dutyBlack),
              ),
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
              title: const Text(
                "first aid meassures",
                style: TextStyle(color: dutyBlack),
              ),
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
              title: const Text(
                "evacuation",
                style: TextStyle(color: dutyBlack),
              ),
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
              title: const Text(
                "tracing after crime",
                style: TextStyle(color: dutyBlack),
              ),
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
            title: const Text(
              '> 10 delinquents',
              style: TextStyle(color: dutyBlack),
            ),
            activeColor: Theme.of(context).primaryColor,
            value: isDelinquentsChecked,
            onChanged: (value) {
              setState(() {
                isDelinquentsChecked = !isDelinquentsChecked;
              });
            },
          ),
          CheckboxListTile(
            title: const Text(
              'drug abuse',
              style: TextStyle(color: dutyBlack),
            ),
            activeColor: Theme.of(context).primaryColor,
            value: isDrugAbuseChecked,
            onChanged: (value) {
              setState(() {
                isDrugAbuseChecked = !isDrugAbuseChecked;
              });
            },
          ),
          CheckboxListTile(
            title: const Text(
              'weapons involved',
              style: TextStyle(color: dutyBlack),
            ),
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
                    ? () async {
                        setState(() {
                          isLoading = true;
                        });
                        try {
                          // await widget.databaseSmokeRepository.createSmokeSign(specification!, buildAddInfo());

                          await smokeProvider.createSmokeSingal(equipSign());
                        } finally {
                          setState(() {
                            isLoading = false;
                          });
                          smokeProvider.activateSendingMode();
                          mapProvider.setMarkerColorYellow();
                          Navigator.pop(context);
                          dutyDialog.smokePlanted(context);
                        }
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
                child: isLoading
                    ? const CircularProgressIndicator(color: dutyWhite)
                    : const Text(
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
                child: const Text(
                  "Cancel",
                  style: TextStyle(color: dutyBlack),
                ),
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

  List<AdditionalInformation> buildAddInfo() {
    List<AdditionalInformation> addInfoList = [];

    isDelinquentsChecked
        ? addInfoList.add(AdditionalInformation.outnumbered)
        : null;
    isDrugAbuseChecked ? addInfoList.add(AdditionalInformation.drugs) : null;
    isWeaponsInvolvedChecked
        ? addInfoList.add(AdditionalInformation.weapons)
        : null;

    debugPrint("$addInfoList");
    return addInfoList;
  }

  String getCurrentUserId() {
    User? user = FirebaseAuth.instance.currentUser;
    return user?.uid ?? "";
  }

  Future<double?> getCurrentLongitude() async {
    Location location = Location();
    bool serviceEnabled;
    PermissionStatus permission;
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
    }
    if (!serviceEnabled) {
      return null;
    }
    permission = await location.hasPermission();
    if (permission == PermissionStatus.denied) {
      permission = await location.requestPermission();
      if (permission != PermissionStatus.granted) {
        return null;
      }
    }
    return null;
  }

  Future<double?> getCurrentLatitude() async {
    Location location = Location();
    bool serviceEnabled;
    PermissionStatus permission;
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
    }
    if (!serviceEnabled) {
      return null;
    }
    permission = await location.hasPermission();
    if (permission == PermissionStatus.denied) {
      permission = await location.requestPermission();
      if (permission != PermissionStatus.granted) {
        return null;
      }
    }
    return null;
  }

  SmokeSpecification? getCurrentSpecification() {
    return specification;
  }

  SmokeSign equipSign() {
    final userId = getCurrentUserId();
    final longitude = getCurrentLongitude();
    final latitude = getCurrentLatitude();
    final specification = getCurrentSpecification();
    final addititonalInfo = buildAddInfo();
    const message = "";
    final timestamp = Timestamp.now();
    return SmokeSign(userId, longitude, latitude, specification,
        addititonalInfo, message, timestamp);
  }
}
