import 'package:injectable/injectable.dart';
import 'package:test_application/models/color_model.dart';

@injectable
abstract class AbstractColorsRepository {
  Future<List<ColorModel>> getAllColors();
  Future<void> addColor(ColorModel color);
  Future<void> deleteColor(ColorModel color);
}
