import 'package:json_annotation/json_annotation.dart';

part 'process.g.dart';

@JsonSerializable()
class Process {
  final String name;
  // final PlaceholderType type;

  final String userId;

  const Process({
    required this.name,
    required this.userId,
  });

  Process copyWith({
    String? name,
    String? userId,
  }) {
    return Process(
      name: name ?? this.name,
      userId: userId ?? this.userId,
    );
  }

  factory Process.fromJson(Map<String, dynamic> json) =>
      _$ProcessFromJson(json);
  Map<String, dynamic> toJson() => _$ProcessToJson(this);
}
