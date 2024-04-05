import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:p12_basic_widgets/config/palette.dart';
import 'package:p12_basic_widgets/features/infrastructure/presentation/duty_dialogs.dart';
import 'package:p12_basic_widgets/features/plant_smoke/application/smoke_notifier.dart';
import 'package:p12_basic_widgets/features/show_map/application/map_notifier.dart';
import 'package:provider/provider.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Location location = Location();
  bool _serviceEnabled = false;
  PermissionStatus _permissionGranted = PermissionStatus.denied;
  LocationData? _locationData;
  MapController mapController = MapController();
  bool isOnDuty = false;
  final dutyDialog = DutyDialogs();
  Marker? tapMarker;

  bool isGeoMarkerActive = false;

  @override
  void initState() {
    super.initState();
    _checkLocationPermission();
  }

  Future<void> _checkLocationPermission() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    _locationData = await location.getLocation();
    setState(() {});
  }

  void _moveToCurrentLocation() async {
    _locationData = await location.getLocation();
    if (_locationData != null) {
      mapController.move(
        LatLng(_locationData!.latitude!, _locationData!.longitude!),
        18.0,
      );
    }
  }

  void toggleGeoMarker() {
    isGeoMarkerActive = !isGeoMarkerActive;
    setState(() {});
  }

  Future<void> showSmokePlantedDialog() async {
    bool? success = await dutyDialog.smokePlanted(context);
    if (success ?? false) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final SmokeNotifier smokeProvider = Provider.of<SmokeNotifier>(context);
    final MapNotifier mapProvider = Provider.of<MapNotifier>(context);
    final LatLng? smokeLocation = smokeProvider.latestSmokeSign != null
        ? LatLng(
            smokeProvider.latestSmokeSign!.latitude,
            smokeProvider.latestSmokeSign!.longitude,
          )
        : null;

    if (_locationData == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("loading..."),
        ),
        body: const Center(child: CircularProgressIndicator()),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
            title: Text(
          "${mapProvider.markerLong} ${mapProvider.markerLat} ${smokeProvider.isMarkerSet}",
          style: const TextStyle(fontSize: 16),
        )),
        body: Stack(
          children: [
            FlutterMap(
              mapController: mapController,
              // MAPOPTIONS MARKER CENTER ZOOM
              options: MapOptions(
                initialCenter: _locationData != null
                    ? LatLng(_locationData!.latitude ?? 48.137154,
                        _locationData!.longitude ?? 11.576124)
                    : const LatLng(48.137154, 11.576124),
                initialZoom: 18,
                backgroundColor: dutyUnselectedGrey,
                interactionOptions: const InteractionOptions(
                    flags: InteractiveFlag.all & ~InteractiveFlag.rotate),
                onTap: isGeoMarkerActive
                    ? (tapPosition, point) {
                        _saveMarkerCoordinates(
                            point.latitude, point.longitude, mapProvider);
                        smokeProvider.useMarkerCoordinates();
                        print(
                            "$ansiGreen isMarkerSet: ${smokeProvider.isMarkerSet} expected: true$ansiGreenEnd");
                        print("$ansiGreen in: on tap $ansiGreenEnd");
                        setState(() {
                          _saveMarkerCoordinates(
                              point.latitude, point.longitude, mapProvider);
                          tapMarker = Marker(
                            point: point,
                            width: 80,
                            height: 80,
                            child: Icon(
                              Icons.location_on,
                              color: mapProvider.markerColor,
                              size: 45,
                            ),
                          );
                        });
                      }
                    : null,
              ),

              // LAYERS
              children: [
                TileLayer(urlTemplate: mapProvider.mapUrl

                    //  "https://tile.thunderforest.com/neighbourhood/{z}/{x}/{y}.png?apikey=6a80985164084c78894e55b4f69f2db5"
                    //   "https://tile.thunderforest.com/pioneer/{z}/{x}/{y}.png?apikey=6a80985164084c78894e55b4f69f2db5",
                    //     "https://tile.thunderforest.com/transport-dark/{z}/{x}/{y}.png?apikey=6a80985164084c78894e55b4f69f2db5",
                    //  urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                    ),
                const RichAttributionWidget(
                  attributions: [
                    TextSourceAttribution('OpenStreetMap contributors'),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    dutyDialog.showSmokeDialog(destroyGeoMarker, context);
                  },
                  child: MarkerLayer(
                    markers: [
                      //  testMarker,
                      if (smokeLocation != null)
                        // set the Marker for the smoke Signal
                        Marker(
                            point: smokeLocation,
                            child: const Icon(Icons.location_on_rounded,
                                color: Colors.red),
                            width: 80,
                            height: 80),

                      if (tapMarker != null) tapMarker!
                    ],
                  ),
                ),
                CurrentLocationLayer(
                  alignPositionOnUpdate: AlignOnUpdate.never,
                  alignDirectionOnUpdate: AlignOnUpdate.never,
                ),
              ],
            ),
            //SideTool
            Positioned(
              right: 0,
              top: (MediaQuery.of(context).size.height - 80) /
                  2, // Vertikal zentriert
              child: Container(
                  width: 50,
                  height: 220,
                  decoration: BoxDecoration(
                    color: dutyWhite,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          switchDutyState();
                        },
                        child: isOnDuty
                            ? const Icon(Icons.radio_button_checked,
                                color: dutyGreen)
                            : const Icon(Icons.radio_button_unchecked,
                                color: dutyRed),
                      ),
                      GestureDetector(
                          onTap: () {
                            toggleGeoMarker();
                          },
                          child: isGeoMarkerActive
                              ? const Icon(Icons.location_on)
                              : const Icon(Icons.location_off,
                                  color: dutyUnselectedGrey)),
                      GestureDetector(
                        onTap: () {},
                        child: const Icon(Icons.turn_right_outlined,
                            color: dutyBlack),
                      ),
                      GestureDetector(
                        onTap: () {
                          _moveToCurrentLocation();
                        },
                        child: const Icon(Icons.adjust, color: dutyBlack),
                      )
                    ],
                  )),
            ),
          ],
        ),
      );
    }
  }

  switchDutyState() {
    isOnDuty ? dutyDialog.offDuty(context) : dutyDialog.onDuty(context);
    isOnDuty = !isOnDuty;
    setState(() {});
  }

  void _saveMarkerCoordinates(
      double latitude, double longitude, MapNotifier mapProvider) {
    final smokeNotifier = SmokeNotifier();
    debugPrint("\nNo Provider: \tlat: $latitude \tlong: $longitude");
    mapProvider.updateMarkerCoordinates(latitude, longitude);
    smokeNotifier.useMarkerCoordinates();
    debugPrint(
        "Provider: \tlat: ${mapProvider.markerLat} \tlong: ${mapProvider.markerLong}\n");
  }

  void destroyGeoMarker() {
    setState(() {
      tapMarker = null;
    });
  }
}
