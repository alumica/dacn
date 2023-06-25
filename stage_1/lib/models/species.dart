import 'package:json_annotation/json_annotation.dart';
part 'species.g.dart';

@JsonSerializable()
class Species {
  final String? id;
  final String? name;

  const Species({
    this.id,
    this.name,
  });

  Species copyWith({
    String? id,
    String? name,
  }) {
    return Species(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  factory Species.fromJson(Map<String, dynamic> json) =>
      _$SpeciesFromJson(json);
  Map<String, dynamic> toJson() => _$SpeciesToJson(this);
}
