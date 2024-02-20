import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:p12_basic_widgets/config/palette.dart';
import 'package:p12_basic_widgets/features/infrastructure/presentation/duty_dialogs.dart';
import 'package:p12_basic_widgets/features/plant_smoke/data/firebase/firebase_smoke_repository.dart';
import 'package:p12_basic_widgets/features/plant_smoke/presentation/smoke_screen.dart';

class MapScreen extends StatefulWidget {
  final FirebaseSmokeRepository databaseSetSmokeRepository;
  const MapScreen({super.key, required this.databaseSetSmokeRepository});

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

  void _moveToCurrentLocation() {
    if (_locationData != null) {
      mapController.move(
        LatLng(_locationData!.latitude!, _locationData!.longitude!),
        18.0,
      );
    }
  }

  void toggleGeoMarker() {
    setState(() {
      isGeoMarkerActive = !isGeoMarkerActive;
    });
  }

  void destroyGeoMarker() {
    setState(() {
      tapMarker = null;
    });
  }

  @override
  Widget build(BuildContext context) {
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
          title: _locationData != null
              ? Text("${_locationData!.latitude}, ${_locationData!.longitude}")
              : const Text("Loading..."),
        ),
        body: Stack(
          children: [
            FlutterMap(
              mapController: mapController,
              // OPTIONS
              options: MapOptions(
                initialCenter: _locationData != null
                    ? LatLng(_locationData!.latitude ?? 48.137154,
                        _locationData!.longitude ?? 11.576124)
                    : const LatLng(48.137154, 11.576124),
                initialZoom: 18,
                backgroundColor: dutyUnselectedGrey,
                interactionOptions: const InteractionOptions(
                    flags: InteractiveFlag.all & ~InteractiveFlag.rotate),
                onLongPress: isGeoMarkerActive
                    ? (tapPosition, point) {
                        setState(() {});
                        tapMarker = Marker(
                          point: point,
                          width: 80,
                          height: 80,
                          child: const Icon(
                            Icons.location_on,
                            color: dutyBlue,
                            size: 45,
                          ),
                        );
                      }
                    : null,
              ),

              // LAYERS
              children: [
                TileLayer(
                  urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                ),
                const RichAttributionWidget(
                  attributions: [
                    TextSourceAttribution('OpenStreetMap contributors'),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Customize GeoPoint'),
                            content: const Text(
                                'You can create an Smokesignal here or destroy this GeoPoint'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: ((context) => SmokeSignalScreen(
                                                databaseSetSmokeRepository: widget
                                                    .databaseSetSmokeRepository))));
                                  },
                                  child: const Text(
                                    "set Smoke",
                                    style: TextStyle(color: dutyYellow),
                                  )),
                              TextButton(
                                  onPressed: () {
                                    destroyGeoMarker();
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("destroy GeoPoint",
                                      style: TextStyle(color: dutyRed))),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('close'),
                              ),
                            ],
                          );
                        });
                  },
                  child: MarkerLayer(
                    markers: tapMarker != null ? [tapMarker!] : [],
                  ),
                ),

                //   MarkerLayer(markers: [
                //     Marker(
                //         point: _locationData != null
                //             ? LatLng(_locationData!.latitude ?? 30,
                //                 _locationData!.longitude ?? 40)
                //             : const LatLng(30, 40),
                //         child: const Icon(
                //           Icons.local_activity_outlined,
                //           color: dutyRed,
                //         ),),
                //   ]
                //   ),
                CurrentLocationLayer(
                  alignPositionOnUpdate: AlignOnUpdate.never,
                  alignDirectionOnUpdate: AlignOnUpdate.never,
                ),
              ],
            ),
            Positioned(
              right: 0,
              top: (MediaQuery.of(context).size.height - 70) /
                  2, // Vertikal zentriert
              child: Container(
                  width: 65,
                  height: 240,
                  color: dutyWhite,
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
                              ? const Icon(Icons.location_on, color: dutyGreen)
                              : const Icon(Icons.location_off,
                                  color: dutyUnselectedGrey)),
                      // GestureDetector(
                      //     onTap: () {
                      //       destroyGeoMarker();
                      //     },
                      //     child: Icon(
                      //       Icons.exposure_minus_1_sharp,
                      //       color: isGeoMarkerActive ? dutyRed : null,
                      //     )),
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
}
