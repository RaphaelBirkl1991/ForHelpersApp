import 'package:flutter/material.dart';
import 'package:p12_basic_widgets/config/palette.dart';
import 'package:p12_basic_widgets/features/infrastructure/presentation/custom_navbar.dart';
import 'package:p12_basic_widgets/features/infrastructure/presentation/duty_dialogs.dart';
import 'package:p12_basic_widgets/features/infrastructure/presentation/text_provider.dart';
import 'package:p12_basic_widgets/features/plant_alarm/application/alarm_provider.dart';
import 'package:p12_basic_widgets/features/plant_alarm/data/database_alarm_repository.dart';
import 'package:provider/provider.dart';

class AlarmSignalScreen extends StatefulWidget {
  final DatabaseAlarmRepository databaseAlarmRepository;
  const AlarmSignalScreen(
      {super.key,
      required this.databaseAlarmRepository,
      required databaseSetAlarmRepository});

  @override
  State<AlarmSignalScreen> createState() => _AlarmSignalScreenState();
}

class _AlarmSignalScreenState extends State<AlarmSignalScreen> {
  late MaterialStatesController btnStateController;

  DutyDialogs dutyDialogs = DutyDialogs();
  CustomNavBar customNavBar = CustomNavBar(
    selectedIndex: 0,
    onItemTapped: (value) {},
  );
  final text = TextProvider();
  bool isTriggerLocked = true;
  bool isLockBtnLocked = false;
  bool isLoading = false;
  bool isAlarmActive = false;

  @override
  void initState() {
    super.initState();
    btnStateController = MaterialStatesController();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AlarmProvider>(
      builder: (BuildContext context, AlarmProvider provider, Widget? child) {
        return Scaffold(
          backgroundColor: provider.isAlarmActive ? dutyBgRed : dutyWhite,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              Center(
                child: Text("Reactive Alarm",
                    style: Theme.of(context).textTheme.headlineMedium),
              ),
              const Spacer(),
              const Spacer(),
              const Spacer(),
              const Center(
                child: Text(
                    "Activate button and \nkeep trigger pressed \n to send alarmsignal"),
              ),
              const Spacer(),
              OutlinedButton(
                onPressed: isLockBtnLocked
                    ? null
                    : () {
                        switchTriggerBtnState();
                        relockTriggerBtn();
                        setState(() {});
                        debugPrint("isTrgiggerLocked: $isTriggerLocked");
                      },
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all<Size>(
                    const Size(300, 38),
                  ),
                ),
                child: isTriggerLocked
                    ? Text(
                        "activate Button",
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      )
                    : const Text("activate Button",
                        style: TextStyle(color: Colors.grey)),
              ),
              provider.isAlarmActive
                  ? ElevatedButton(
                      onPressed: isTriggerLocked
                          ? null
                          : () async {
                              setState(() {
                                isLoading = true;
                              });
                              try {
                                await widget.databaseAlarmRepository
                                    .deleteAlarmSignal();
                              } catch (error) {
                                const Text("An error occured!");
                              } finally {
                                await relockTriggerBtn();
                                setState(() {
                                  isLoading = false;
                                });
                                provider.stopSendingMode();
                                debugPrint("cncl btn pressed");
                                setState(() {});
                                dutyDialogs.alarmDropped(context);
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
                          minimumSize: MaterialStateProperty.all<Size>(
                            const Size(300, 38),
                          )),
                      child: isLoading
                          ? const CircularProgressIndicator(color: dutyWhite)
                          : const Text(
                              "Cancel Alarm",
                              style: TextStyle(
                                  color: dutyWhite,
                                  fontWeight: FontWeight.bold),
                            ),
                    )
                  : ElevatedButton(
                      onPressed: isTriggerLocked
                          ? null
                          : () async {
                              setState(() {
                                isLoading = true;
                              });
                              try {
                                await widget.databaseAlarmRepository
                                    .createAlarmSignal();
                              } catch (error) {
                                const Text("An error occured!");
                              } finally {
                                await relockTriggerBtn();
                                setState(() {
                                  isLoading = false;
                                });
                                provider.activateSendingMode();
                                setState(() {});
                              }

                              dutyDialogs.alarmActive(context);
                              isLockBtnLocked = false;
                              isTriggerLocked = true;
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
                          minimumSize: MaterialStateProperty.all<Size>(
                            const Size(300, 38),
                          )),
                      child: isLoading
                          ? const CircularProgressIndicator(color: dutyWhite)
                          : const Text(
                              "send alarm",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
              const Spacer(),
            ],
          ),
        );
      },
    );
  }

  bool switchTriggerBtnState() {
    debugPrint("$isTriggerLocked");
    isTriggerLocked = false;
    isLockBtnLocked = true;
    setState(() {});
    debugPrint(
        "Lock Butoon Locked: $isLockBtnLocked \nTrigger Button Locked: $isTriggerLocked");

    return isTriggerLocked;
  }

  Future<void> relockTriggerBtn() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      isTriggerLocked = true;
      isLockBtnLocked = false;
    });
  }
}
