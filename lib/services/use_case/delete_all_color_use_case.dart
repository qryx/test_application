import 'package:injectable/injectable.dart';
import 'package:test_application/services/repository/abstract_colors_repository.dart';

@injectable
class DeleteAllColorUseCase {
  final AbstractColorsRepository colorsRepository;
  DeleteAllColorUseCase(this.colorsRepository);

  Future<void> call() async {
    await colorsRepository.deleteAllColor();
  }
}
