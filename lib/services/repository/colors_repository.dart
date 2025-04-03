import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:test_application/models/color_model.dart';
import 'package:test_application/services/repository/abstract_colors_repository.dart';

@injectable
/// An implementation of the [AbstractColorsRepository]
class ColorsRepository extends AbstractColorsRepository {
  /// The Hive box that stores color data.
  final Box<ColorModel> colorsBox;

  /// Constructor for [ColorsRepository].
  ColorsRepository({required this.colorsBox});

  @override
  Future<List<ColorModel>> getAllColors() async {
    final colorsList = colorsBox.values.toList();
    colorsList.sort((a, b) {
      return (a.orderId ?? 0).compareTo(b.orderId ?? 0);
    });

    return Future.value(colorsList.reversed.toList());
  }

  @override
  Future<void> addColor(ColorModel color) async {
    final ColorModel finalColor = ColorModel(
      red: color.red,
      green: color.green,
      blue: color.blue,
      opacity: color.opacity,
      orderId: DateTime.now().millisecondsSinceEpoch,
    );
    await colorsBox.put(_createKey(color), finalColor);
  }

  @override
  Future<void> deleteColor(ColorModel color) async {
    await colorsBox.delete(_createKey(color));
  }

  String _createKey(ColorModel color) {
    return color.red.toString() +
        color.green.toString() +
        color.blue.toString();
  }

  @override
  Future<void> deleteAllColor() async {
    await colorsBox.clear();
  }
}
