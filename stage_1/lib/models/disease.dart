import 'package:json_annotation/json_annotation.dart';
import 'package:stage_1/models/user.dart';

part 'disease.g.dart';

@JsonSerializable()
class Disease {
  final String id;
  final String name;
  final String identification;
  final int level;
  final String species;
  final List<String> medicines;
  final String treatment;
  final String causes;
  final String status;
  final User user;

  const Disease({
    required this.id,
    required this.name,
    required this.identification,
    required this.level,
    required this.species,
    required this.medicines,
    required this.treatment,
    required this.causes,
    required this.status,
    required this.user,
  });

  Disease copyWith({
    String? id,
    String? name,
    String? identification,
    int? level,
    String? species,
    List<String>? medicines,
    String? treatment,
    String? causes,
    String? status,
    User? user,
  }) {
    return Disease(
      id: id ?? this.id,
      name: name ?? this.name,
      identification: identification ?? this.identification,
      level: level ?? this.level,
      species: species ?? this.species,
      medicines: medicines ?? this.medicines,
      treatment: treatment ?? this.treatment,
      causes: causes ?? this.causes,
      status: status ?? this.status,
      user: user ?? this.user,
    );
  }

  factory Disease.fromJson(Map<String, dynamic> json) =>
      _$DiseaseFromJson(json);
  Map<String, dynamic> toJson() => _$DiseaseToJson(this);
}
