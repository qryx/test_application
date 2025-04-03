import 'package:injectable/injectable.dart';
import 'package:test_application/models/color_model.dart';
import 'package:test_application/services/repository/abstract_colors_repository.dart';

@injectable
/// Use case for getting all colors from the repository.
class GetColorsUseCase {
  /// The repository that manages color data.
  final AbstractColorsRepository colorsRepository;

  /// Constructor for [GetColorsUseCase].
  GetColorsUseCase(this.colorsRepository);

  /// Getting all colors from the repository.
  Future<List<ColorModel>> call() async {
    return colorsRepository.getAllColors();
  }
}
