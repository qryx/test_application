import 'package:hive_flutter/hive_flutter.dart';

part 'color_model.g.dart';

@HiveType(typeId: 1, adapterName: 'ColorModelAdapter')
/// Represents a color with RGB values and opacity.
class ColorModel {
  /// Red color in RGB (0-255).
  @HiveField(1)
  final int red;

  /// Green color in RGB (0-255).
  @HiveField(2)
  final int green;

  /// Blue color in RGB (0-255).
  @HiveField(3)
  final int blue;

  /// Opacity of the color in RGB (0.0 to 1.0).
  @HiveField(4)
  final double opacity;

  /// order ID to help sort the color.
  @HiveField(5)
  final int? orderId;

  /// Creates a new ColorModel with RGB values and opacity
  const ColorModel({
    required this.red,
    required this.green,
    required this.blue,
    required this.opacity,
    this.orderId,
  });
}
