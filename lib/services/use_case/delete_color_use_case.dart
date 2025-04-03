import 'package:injectable/injectable.dart';
import 'package:test_application/models/color_model.dart';
import 'package:test_application/services/repository/abstract_colors_repository.dart';

@injectable
class DeleteColorUseCase {
  final AbstractColorsRepository colorsRepository;
  DeleteColorUseCase(this.colorsRepository);

  Future<void> call(ColorModel color) async {
    await colorsRepository.deleteColor(color);
  }
}
