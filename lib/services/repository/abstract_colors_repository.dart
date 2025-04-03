import 'package:injectable/injectable.dart';
import 'package:test_application/models/color_model.dart';

@injectable
/// An abstract repository for managing color data.
abstract class AbstractColorsRepository {
  /// Fetches all the saved colors.
  Future<List<ColorModel>> getAllColors();

  /// Adds a new color to the repository.
  ///
  /// [color] The color to be added.
  Future<void> addColor(ColorModel color);

  /// Deletes a specific color from the repository.
  ///
  /// [color] The color to be deleted.
  Future<void> deleteColor(ColorModel color);

  /// Deletes all colors from the repository.
  Future<void> deleteAllColor();
}
