import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_application/models/color_model.dart';
import 'package:test_application/services/repository/abstract_colors_repository.dart';
import 'package:test_application/services/repository/colors_repository.dart';
import 'package:test_application/services/use_case/add_color_use_case.dart';
import 'package:test_application/services/use_case/delete_all_color_use_case.dart';
import 'package:test_application/services/use_case/delete_color_use_case.dart';
import 'package:test_application/services/use_case/get_colors_use_case.dart';
import 'package:test_application/ui/history_page/cubit/history_page_cubit.dart';
import 'package:test_application/ui/home_page/cubit/home_page_cubit.dart';

/// Storage for all the app's dependencies
final getIt = GetIt.instance;

/// Sets up the service locator
Future<void> setupServiceLocator() async {
  const colorsBoxName = 'heart_rate_box';
  await Hive.initFlutter();
  Hive.registerAdapter(ColorModelAdapter());

  final colorsBox = await Hive.openBox<ColorModel>(colorsBoxName);

  GetIt.I.registerLazySingleton<AbstractColorsRepository>(
    () => ColorsRepository(colorsBox: colorsBox),
  );
  getIt.registerLazySingleton(
    () => AddColorUseCase(getIt<AbstractColorsRepository>()),
  );
  getIt.registerLazySingleton(
    () => GetColorsUseCase(getIt<AbstractColorsRepository>()),
  );
  getIt.registerLazySingleton(
    () => DeleteColorUseCase(getIt<AbstractColorsRepository>()),
  );

  getIt.registerLazySingleton(
    () => DeleteAllColorUseCase(getIt<AbstractColorsRepository>()),
  );

  getIt.registerFactory(
    () => HomePageCubit(getIt<AddColorUseCase>(), getIt<GetColorsUseCase>()),
  );
  getIt.registerFactory(
    () => HistoryPageCubit(
      getIt<DeleteColorUseCase>(),
      getIt<DeleteAllColorUseCase>(),
      getIt<GetColorsUseCase>(),
    ),
  );
}
