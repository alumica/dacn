import 'package:json_annotation/json_annotation.dart';
import 'package:stage_1/models/disease.dart';

part 'fertilizer.g.dart';

@JsonSerializable()
class Fertilizer {
  final String id;
  final String name;
  final List<String> components;
  final String producer;
  // final List<Placeholder> placeholders;
  final List<Disease> diseases;
  final double price;
  final double amount;
  final String userId;

  const Fertilizer({
    required this.id,
    required this.name,
    required this.components,
    required this.producer,
    required this.diseases,
    required this.price,
    required this.amount,
    required this.userId,
  });

  factory Fertilizer.fromJson(Map<String, dynamic> json) =>
      _$FertilizerFromJson(json);
  Map<String, dynamic> toJson() => _$FertilizerToJson(this);

  Fertilizer copyWith({
    String? id,
    String? name,
    List<String>? components,
    String? producer,
    List<Disease>? diseases,
    double? price,
    double? amount,
    String? userId,
  }) {
    return Fertilizer(
      id: id ?? this.id,
      name: name ?? this.name,
      components: components ?? this.components,
      producer: producer ?? this.producer,
      diseases: diseases ?? this.diseases,
      price: price ?? this.price,
      amount: amount ?? this.amount,
      userId: userId ?? this.userId,
    );
  }

  @override
  String toString() {
    return 'Fertilizer(id: $id, name: $name, components: $components, producer: $producer, diseases: $diseases, price: $price, amount: $amount, userId: $userId)';
  }
}
