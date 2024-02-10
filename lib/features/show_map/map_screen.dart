import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:p12_basic_widgets/config/palette.dart';

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
        body: FlutterMap(
          // OPTIONS
          options: MapOptions(
            initialCenter: _locationData != null
                ? LatLng(_locationData!.latitude ?? 48.137154,
                    _locationData!.longitude ?? 11.576124)
                : const LatLng(48.137154, 11.576124),
            initialZoom: 14,
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
            MarkerLayer(markers: [
              Marker(
                  point: _locationData != null
                      ? LatLng(_locationData!.latitude ?? 30,
                          _locationData!.longitude ?? 40)
                      : const LatLng(30, 40),
                  child: const Icon(
                    Icons.local_activity_outlined,
                    color: dutyRed,
                  ))
            ])
          ],
        ),
      );
    }
  }
}
