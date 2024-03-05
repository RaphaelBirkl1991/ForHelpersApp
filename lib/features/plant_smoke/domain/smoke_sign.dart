import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:p12_basic_widgets/features/plant_smoke/domain/enum_additional_info.dart';
import 'package:p12_basic_widgets/features/plant_smoke/domain/enum_smoke_specification.dart';

class SmokeSign {
  final String userId;
  final double longitude;
  final double latitude;
  final SmokeSpecification? specification;
  final List<AdditionalInformation> addititonalInfo;
  final String message;
  final Timestamp timestamp;

  SmokeSign(this.userId, this.longitude, this.latitude, this.specification,
      this.addititonalInfo, this.message, this.timestamp);

  // // Getter für userId
  // String get getUserId => userId;

  // // Getter für longitude
  // Future<double> get getLongitude => longitude;

  // // Getter für latitude
  // Future<double> get getLatitude => latitude;

  // // Getter für specification
  // SmokeSpecification get getSpecification => specification;

  // // Getter für additionalInfo
  // List<AdditionalInformation> get getAdditionalInfo => addititonalInfo;

  // // Getter für message
  // String get getMessage => message;

  // // Getter für timestamp
  // Timestamp get getTimestamp => timestamp;

  // SmokeSign(
  //     {required this.userId,
  //     required this.longitude,
  // required this.latitude,
  //     required this.specification,
  //     required this.addititonalInfo,
  //     required this.message,
  //     required this.timestamp});

  // SmokeSign(
  //     {this.userId = "",
  //     this.longitude = 0,
  //     this.latitude = 0,
  //     this.specification = SmokeSpecification.none,
  //     this.addititonalInfo = const [],
  //     this.message = "",
  //     required this.timestamp});

  factory SmokeSign.fromMap(Map<String, dynamic> map) {
    return SmokeSign(
      map['user_id'],
      // LocationData.fromMap(map['locationData']),
      map["longitude"],
      map["latitude"],
      map['specification'] != null
          ? SmokeSpecification.values
              .firstWhere((e) => e.toString() == map['specification'])
          : null,
      (map['additional_info'] as List<dynamic>? ?? [])
          .map((e) => AdditionalInformation.values
              .firstWhere((element) => element.toString() == e))
          .toList(),
      map['message'],
      map['timestamp'],
    );
  }

  // Future<Map<String, dynamic>> toMap() async {
  //   final double? long = longitude;
  //   final double? lat = latitude;

  //   return {
  //     "user_id": userId,
  //     "longitude": long,
  //     "latitude": lat,
  //     "specification": specification?.toString() ?? "",
  //     "additional_info": addititonalInfo.map((e) => e.toString()).toList(),
  //     "message": message,
  //     "timestamp": timestamp,
  //   };
  // }

  Map<String, dynamic> toMap() {
    return {
      "user_id": userId,
      "longitude": longitude,
      "latitude": latitude,
      "specification": specification.toString(),
      "additional_info": addititonalInfo.map((e) => e.toString()).toList(),
      "message": message,
      "timestamp": timestamp,
    };
  }
}
