import 'package:flutter/material.dart';
import 'package:p12_basic_widgets/config/palette.dart';
import 'package:p12_basic_widgets/features/show_map/application/map_service.dart';

class MapController extends ChangeNotifier {
  final mapService = MapService();

  // final intelligenceController = Provider.of<IntelligenceController>();
  double _markerLat = 0;
  double _markerLong = 0;
  Color _markerColor = Colors.black;
  final double _distanceToSmoke = 0;

  double get markerLat => _markerLat;
  double get markerLong => _markerLong;
  Color get markerColor => _markerColor;
  double get distanceToSmoke => _distanceToSmoke;

  void setMarkerColorYellow() {
    _markerColor = dutyYellow;
    notifyListeners();
    debugPrint("\tMarker col = yellow");
  }

  void setMarkerColorBlue() {
    _markerColor = dutyBlue;
    notifyListeners();
  }

  void updateMarkerCoordinates(double lat, double long) {
    _markerLat = lat;
    _markerLong = long;
    notifyListeners();
  }

  // void calculateDistance(double startLatitude, double startLongitude,
  //     double endLatitude, double endLongitude) {
  //   mapService.calculateDistance(
  //       startLatitude, startLongitude, endLatitude, endLongitude);
  // }
}
