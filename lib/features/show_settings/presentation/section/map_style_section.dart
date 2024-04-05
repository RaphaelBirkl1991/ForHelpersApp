import 'package:flutter/material.dart';
import 'package:p12_basic_widgets/config/palette.dart';
import 'package:p12_basic_widgets/features/show_map/application/map_notifier.dart';
import 'package:p12_basic_widgets/features/show_settings/application/settings_notifier.dart';
import 'package:provider/provider.dart';

class MapStyleSection extends StatefulWidget {
  const MapStyleSection({super.key});

  @override
  State<MapStyleSection> createState() => _MapStyleSectionState();
}

class _MapStyleSectionState extends State<MapStyleSection> {
  bool isSchmeBtnLoading = false;
  int selectedValue = 1;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final mapProvider = Provider.of<MapNotifier>(context, listen: false);
      selectedValue = initializePreselectedValue(mapProvider);
    });
  }

  @override
  Widget build(BuildContext context) {
    final mapProvider = Provider.of<MapNotifier>(context, listen: false);
    final settingsProvider =
        Provider.of<SettingsNotifier>(context, listen: false);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Map Styles",
          style: TextStyle(fontSize: 25),
        ),
        const SizedBox(height: 15),
        RadioListTile(
          title: const Text('Default'),
          activeColor: Theme.of(context).primaryColor,
          value: 1,
          groupValue: selectedValue,
          onChanged: (value) {
            setState(() {
              selectedValue = value as int;
            });
            print(selectedValue);
          },
          controlAffinity: ListTileControlAffinity.trailing,
        ),
        RadioListTile(
          title: const Text('Pioneer'),
          activeColor: Theme.of(context).primaryColor,
          value: 2,
          groupValue: selectedValue,
          onChanged: (value) {
            setState(() {
              selectedValue = value as int;
              print(selectedValue);
            });
          },
          controlAffinity: ListTileControlAffinity.trailing,
        ),
        RadioListTile(
          title: const Text('Transport Dark'),
          activeColor: Theme.of(context).primaryColor,
          value: 3,
          groupValue: selectedValue,
          onChanged: (value) {
            setState(() {
              selectedValue = value as int;
              print(selectedValue);
            });
          },
          controlAffinity: ListTileControlAffinity.trailing,
        ),
        RadioListTile(
          title: const Text('Landscape'),
          activeColor: Theme.of(context).primaryColor,
          value: 4,
          groupValue: selectedValue,
          onChanged: (value) {
            setState(() {
              selectedValue = value as int;
              print(selectedValue);
            });
          },
          controlAffinity: ListTileControlAffinity.trailing,
        ),
        RadioListTile(
          title: const Text('Outdoor'),
          activeColor: Theme.of(context).primaryColor,
          value: 5,
          groupValue: selectedValue,
          onChanged: (value) {
            setState(() {
              selectedValue = value as int;
              print(selectedValue);
            });
          },
          controlAffinity: ListTileControlAffinity.trailing,
        ),
        RadioListTile(
          title: const Text('High Contrast'),
          activeColor: Theme.of(context).primaryColor,
          value: 6,
          groupValue: selectedValue,
          onChanged: (value) {
            setState(() {
              selectedValue = value as int;
              print(selectedValue);
            });
          },
          controlAffinity: ListTileControlAffinity.trailing,
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: () => saveMapStyle(selectedValue, mapProvider),
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
              child: isSchmeBtnLoading
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

  saveMapStyle(int value, MapNotifier mapNotifier) {
    final settingsNotifier =
        Provider.of<SettingsNotifier>(context, listen: false);
    if (value == 1) {
      settingsNotifier.setMapStyleDefault(mapNotifier);
    } else if (value == 2) {
      settingsNotifier.setMapStylePioneer(mapNotifier);
    } else if (value == 3) {
      settingsNotifier.setMapStyleTransportDark(mapNotifier);
    } else if (value == 4) {
      settingsNotifier.setMapStyleLandscape(mapNotifier);
    } else if (value == 5) {
      settingsNotifier.setMapStyleOutdoors(mapNotifier);
    } else if (value == 6) {
      settingsNotifier.setMapStyleHighContrast(mapNotifier);
    } else {}
  }

  int initializePreselectedValue(MapNotifier mapNotifier) {
    String currentMapStyle = mapNotifier.mapUrl;
    String defaultMapStyle = "https://tile.openstreetmap.org/{z}/{x}/{y}.png";
    String pioneerMapStyle =
        "https://tile.thunderforest.com/pioneer/{z}/{x}/{y}.png?apikey=6a80985164084c78894e55b4f69f2db5";
    String transportDarkMapStyle =
        "https://tile.thunderforest.com/transport-dark/{z}/{x}/{y}.png?apikey=6a80985164084c78894e55b4f69f2db5";
    String landscapeMapStyle =
        "https://tile.thunderforest.com/landscape/{z}/{x}/{y}.png?apikey=6a80985164084c78894e55b4f69f2db5";

    String outdoorMapStyle =
        "https://tile.thunderforest.com/outdoors/{z}/{x}/{y}.png?apikey=6a80985164084c78894e55b4f69f2db5";

    String highContrastMapStyle =
        "https://tile.thunderforest.com/mobile-atlas/{z}/{x}/{y}.png?apikey=6a80985164084c78894e55b4f69f2db5";

    if (currentMapStyle == defaultMapStyle) {
      return 1;
    } else if (currentMapStyle == pioneerMapStyle) {
      return 2;
    } else if (currentMapStyle == transportDarkMapStyle) {
      return 3;
    } else if (currentMapStyle == landscapeMapStyle) {
      return 4;
    } else if (currentMapStyle == outdoorMapStyle) {
      return 5;
    } else if (currentMapStyle == highContrastMapStyle) {
      return 6;
    } else {
      return 1;
    }
  }
}
