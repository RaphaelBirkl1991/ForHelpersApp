import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';
import 'package:p12_basic_widgets/features/plant_alarm/data/database_alarm_repository.dart';

// Wenn der User auf den btn klickt soll der Alarm gesetzt werden der
// ALarm hat eine Id und die aktuelle position
class FirebaseAlarmRepository implements DatabaseAlarmRepository {
  final FirebaseFirestore _instance = FirebaseFirestore.instance;

  LocationData? locationData;

  @override
  Future<void> createAlarmSignal() async {
    try {
      //All in
      // LatLng(locationData!.latitude!, locationData!.longitude!);
      Position position = await Geolocator.getCurrentPosition();
    } catch (e) {
      debugPrint("sth. went wrong");
    }
  }

  @override
  Future<void> deleteAlarmSignal() {
    // TODO: implement deleteAlarmSignal
    throw UnimplementedError();
  }
}
