import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:p12_basic_widgets/config/palette.dart';

class MapNotifier extends ChangeNotifier {
  double? _markerLat;
  double? _markerLong;
  Color _markerColor = Colors.black;
  Marker? tapMarker;
//  String mapUrl = "https://tile.openstreetmap.org/{z}/{x}/{y}.png";
  String mapUrl =
      "https://tile.thunderforest.com/pioneer/{z}/{x}/{y}.png?apikey=6a80985164084c78894e55b4f69f2db5";
  double? get markerLat => _markerLat;
  double? get markerLong => _markerLong;

  void setMarkerLat(double? lat) {
    _markerLat = lat;
    notifyListeners();
  }

  void setMarkerLong(double? long) {
    _markerLong = long;
    notifyListeners();
  }

  Color get markerColor => _markerColor;

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

  void destroyTapMarker() {
    tapMarker = null;
    notifyListeners();
  }

  void setMapStylePioneer() {
    mapUrl =
        "https://tile.thunderforest.com/pioneer/{z}/{x}/{y}.png?apikey=6a80985164084c78894e55b4f69f2db5";
    notifyListeners();
  }

  void setMapStyleDefault() {
    mapUrl = "https://tile.openstreetmap.org/{z}/{x}/{y}.png";
    notifyListeners();
  }

  void setMapStyleTransportDark() {
    mapUrl =
        "https://tile.thunderforest.com/transport-dark/{z}/{x}/{y}.png?apikey=6a80985164084c78894e55b4f69f2db5";
    notifyListeners();
  }

  void setMapStyleLandscape() {
    mapUrl =
        "https://tile.thunderforest.com/landscape/{z}/{x}/{y}.png?apikey=6a80985164084c78894e55b4f69f2db5";
    notifyListeners();
  }

  void setMapStyleOutdoor() {
    mapUrl =
        "https://tile.thunderforest.com/outdoors/{z}/{x}/{y}.png?apikey=6a80985164084c78894e55b4f69f2db5";
    notifyListeners();
  }

  void setMapStyleHighContrast() {
    mapUrl =
        "https://tile.thunderforest.com/mobile-atlas/{z}/{x}/{y}.png?apikey=6a80985164084c78894e55b4f69f2db5";
    notifyListeners();
  }
}
