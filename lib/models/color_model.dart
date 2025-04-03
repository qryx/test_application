import 'package:hive_flutter/hive_flutter.dart';

part 'color_model.g.dart';

@HiveType(typeId: 1, adapterName: 'ColorModelAdapter')
class ColorModel {
  @HiveField(1)
  final int red;
  @HiveField(2)
  final int green;
  @HiveField(3)
  final int blue;
  @HiveField(4)
  final double opacity;
  @HiveField(5)
  final int? orderId;

  const ColorModel({
    required this.red,
    required this.green,
    required this.blue,
    required this.opacity,
    this.orderId,
  });
}
