import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:p12_basic_widgets/config/palette.dart';
import 'package:p12_basic_widgets/features/plant_smoke/data/firebase/firebase_smoke_repository.dart';
import 'package:p12_basic_widgets/features/plant_smoke/domain/enum_additional_info.dart';
import 'package:p12_basic_widgets/features/plant_smoke/domain/enum_smoke_specification.dart';
import 'package:p12_basic_widgets/features/plant_smoke/domain/smoke_sign.dart';
import 'package:p12_basic_widgets/features/show_map/application/map_notifier.dart';
import 'package:provider/provider.dart';
import 'package:vibration/vibration.dart';

class SmokeNotifier extends ChangeNotifier {
  final repository = FirebaseSmokeRepository();
  bool isSmokeActive = false;
  bool isMarkerSet = false;
  SmokeSign? _latestSmokeSign;

  //  final mapNotifier = MapNotifier();

  SmokeSign? get latestSmokeSign => _latestSmokeSign;

  SmokeNotifier() {
    listenToSmokeSigns();
  }

  void listenToSmokeSigns() {
    repository.smokeSign.listen((event) {
      _latestSmokeSign = event.lastOrNull;
      log("${ansiGreen}NEW EVENT$ansiGreenEnd");
      setSmokeMarker(_latestSmokeSign);
      notifyListeners();
      _vibrate();
    });
  }

  void activateSendingMode() {
    isSmokeActive = true;
    notifyListeners();
  }

  void stopSendingMode() {
    isSmokeActive = false;
    notifyListeners();
  }

  void setSmokeMarker(latestSmokeSign) {
    final lat = latestSmokeSign?.latitude;
    final long = latestSmokeSign?.longitude;
  }

  Future<void> createSmokeSignal(
    double? markerLong,
    double? markerLat,
    SmokeSpecification specification,
    List<AdditionalInformation> additionalInfo,
    String message,
  ) async {
    debugPrint("\nSMOKE PROVIDER CREATE SMOKESIGNAL\n");
    final String userId = getCurrentUserId();
    // final double latitude = await getCurrentLatitude();
    // final double longitude = await getCurrentLongitude();
    final double? longitude;
    final double? latitude;

// TODO: isMarkerSet unnötig geht über null check

    markerLong == null
        ? longitude = await getCurrentLongitude()
        : longitude = markerLong;
    markerLat == null
        ? latitude = await getCurrentLatitude()
        : latitude = markerLat;

    final timestamp = Timestamp.now();
    final smokeSign = SmokeSign(
      userId,
      longitude,
      latitude,
      specification,
      additionalInfo,
      message,
      timestamp,
    );
    repository.createSmokeSign(smokeSign);
  }

  Future<void> deleteSmokeSignal(context) async {
    final mapNotifier = Provider.of<MapNotifier>(context, listen: false);
    debugPrint("\nSMOKE PROVIDER DELETE SMOKESIGNAL\n");
    repository.deleteSmokeSign(context);
    _latestSmokeSign = null;

    mapNotifier.setMarkerLat(null);
    mapNotifier.setMarkerLong(null);
    notifyListeners();
  }

  String getCurrentUserId() {
    User? user = FirebaseAuth.instance.currentUser;
    return user?.uid ?? "";
  }

  void useMarkerCoordinates() {
    isMarkerSet = true;
    print("$ansiGreen isMarkerSet: $isMarkerSet $ansiGreenEnd");
    notifyListeners();
  }

  void useCurrentCoordinates() {
    isMarkerSet = false;
    print("$ansiGreen isMarkerSet: $isMarkerSet $ansiGreenEnd");
    notifyListeners();
  }

  // Future<double> getMarkerLongitude() async {
  //   return mapNotifier.markerLong;
  // }

  // Future<double> getMarkerLatitude() async {
  //   return mapNotifier.markerLat;
  // }

//  TODO: move to location repo requst location service
  Future<double> getCurrentLongitude() async {
    Location location = Location();
    bool serviceEnabled;
    PermissionStatus permission;
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
    }
    if (!serviceEnabled) {
      log("service not enabled");
      return 0.00;
    }
    permission = await location.hasPermission();
    if (permission == PermissionStatus.denied) {
      permission = await location.requestPermission();
      if (permission != PermissionStatus.granted) {
        //TODO: warning
        log("permission not granted");
        return 0.00;
      }
    }
    final LocationData locationData = await location.getLocation();
    if (locationData.longitude != null) {
      final double longitude = locationData.longitude ?? 0.00;
      log("$longitude");
      return longitude;
    } else {
      log("anderer fehler");
      return 0.00;
    }
  }

//  TODO: move to location repo requst location service
  Future<double> getCurrentLatitude() async {
    Location location = Location();
    bool serviceEnabled;
    PermissionStatus permission;
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
    }
    if (!serviceEnabled) {
      log("service not enabled");
      return 0.00;
    }
    permission = await location.hasPermission();
    if (permission == PermissionStatus.denied) {
      permission = await location.requestPermission();
      if (permission != PermissionStatus.granted) {
        //TODO: warning
        log("permission not granted");
        return 0.00;
      }
    }
    final LocationData locationData = await location.getLocation();
    if (locationData.longitude != null) {
      final double latitude = locationData.latitude ?? 0.00;
      log("$latitude");
      return latitude;
    } else {
      log("anderer fehler");
      return 0.00;
    }
  }

  void _vibrate() async {
    bool? hasVibrator;
    try {
      hasVibrator = await Vibration.hasVibrator();
    } catch (e) {
      print(e);
    }

    if (hasVibrator ?? true) {
      Vibration.vibrate(duration: 200);
    } else {
      print('Das Gerät hat keine Vibrationsfunktion.');
    }
  }
}
