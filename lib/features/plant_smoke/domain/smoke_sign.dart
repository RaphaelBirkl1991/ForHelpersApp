import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:p12_basic_widgets/features/plant_smoke/domain/enum_additional_info.dart';
import 'package:p12_basic_widgets/features/plant_smoke/domain/enum_smoke_specification.dart';

class SmokeSign {
  String userId;
  double longitude;
  double latitude;
  SmokeSpecification? specification;
  List<AdditionalInformation>? addititonalInfo;
  String? message;
  Timestamp timestamp;

  SmokeSign(this.userId, this.longitude, this.latitude, this.specification,
      this.addititonalInfo, this.message, this.timestamp);

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
      (map['additional_info'] as List<dynamic>?)
          ?.map((e) => AdditionalInformation.values
              .firstWhere((element) => element.toString() == e))
          .toList(),
      map['message'],
      map['timestamp'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "user_id": userId,
      "logitude": longitude,
      "latitude": latitude,
      "specification": specification.toString(),
      "additional_info": addititonalInfo != null
          ? addititonalInfo!.map((e) => e.toString()).toList()
          : [],
      "message": message,
      "timestamp": timestamp,
    };
  }
}
