// import 'package:json_annotation/json_annotation.dart';
// import 'package:stage_1/models/user.dart';
// import 'farm.dart';
// part 'farmer.g.dart';

// @JsonSerializable()
// class Farmer extends User {
//   final double? farmArea;
//   final int? numberOfMember; //SỐ THÀNH VIÊN TRONG GIA ĐÌNH||
//   final String? groupSite; // LINK WEBSITE4
//   final DateTime? beginOn; // NGÀY THÀNH LẬP
//   final String? tax; // MÃ SỐ THUẾ
//   final List<Farm>? farms;

//   Farmer(
//       {this.farmArea,
//         this.numberOfMember,
//         this.groupSite,
//         this.beginOn,
//         this.tax,
//         this.farms});
//   factory Farmer.fromJson(Map <String, dynamic> json) => _$FarmerFromJson(json);
//   @override
//   Map<String, dynamic> toJson() => _$FarmerToJson(this);

// }