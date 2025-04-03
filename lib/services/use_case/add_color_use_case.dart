import 'package:injectable/injectable.dart';
import 'package:test_application/models/color_model.dart';
import 'package:test_application/services/repository/abstract_colors_repository.dart';

@injectable
/// Use case for adding a color to the repository.
class AddColorUseCase {
  /// The repository that manages color data.
  final AbstractColorsRepository colorsRepository;

  /// Constructor for [AddColorUseCase].
  AddColorUseCase(this.colorsRepository);

  /// Adds a new color to the repository.
  Future<void> call(ColorModel color) async {
    await colorsRepository.addColor(color);
  }
}
