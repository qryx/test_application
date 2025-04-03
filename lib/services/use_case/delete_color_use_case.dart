import 'package:injectable/injectable.dart';
import 'package:test_application/models/color_model.dart';
import 'package:test_application/services/repository/abstract_colors_repository.dart';

@injectable
/// Use case for deleting a color from the repository.
class DeleteColorUseCase {
  /// The repository that manages color data.
  final AbstractColorsRepository colorsRepository;

  /// Constructor for [DeleteColorUseCase].
  DeleteColorUseCase(this.colorsRepository);

  /// Deletes a specific color from the repository.
  Future<void> call(ColorModel color) async {
    await colorsRepository.deleteColor(color);
  }
}
