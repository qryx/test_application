import 'package:injectable/injectable.dart';
import 'package:test_application/services/repository/abstract_colors_repository.dart';

@injectable
/// Use case for deleting all colors from the repository.
class DeleteAllColorUseCase {
  /// The repository that manages color data.
  final AbstractColorsRepository colorsRepository;

  /// Constructor for [DeleteAllColorUseCase].
  DeleteAllColorUseCase(this.colorsRepository);

  /// Deletes all colors from the repository.
  Future<void> call() async {
    await colorsRepository.deleteAllColor();
  }
}
