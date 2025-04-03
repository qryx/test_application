import 'package:injectable/injectable.dart';
import 'package:test_application/models/color_model.dart';
import 'package:test_application/services/repository/abstract_colors_repository.dart';

@injectable
class GetColorsUseCase {
  final AbstractColorsRepository colorsRepository;
  GetColorsUseCase(this.colorsRepository);

  Future<List<ColorModel>> call() async {
    return await colorsRepository.getAllColors();
  }
}
