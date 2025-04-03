import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_application/models/color_model.dart';
import 'package:test_application/services/use_case/add_color_use_case.dart';
import 'package:test_application/services/use_case/get_colors_use_case.dart';
import 'package:test_application/ui/home_page/cubit/home_page_state.dart';

/// Cubit for managing the home page state
class HomePageCubit extends Cubit<HomePageState> {
  /// Use case for adding color
  final AddColorUseCase _addColorUseCase;

  /// Use case for getting colors
  final GetColorsUseCase _getColorsUseCase;

  /// Maximum value for generate colors
  final int maxColorValue = 255;

  /// Constructor for [HomePageCubit]
  HomePageCubit(this._addColorUseCase, this._getColorsUseCase)
    : super(const HomePageState());

  /// Initializes the state by getting colors and setting the current color
  Future<void> init() async {
    final colors = await _getColorsUseCase.call();
    const defaultColor = ColorModel(red: 0, green: 0, blue: 0, opacity: 0);
    final colorToEmit = colors.isEmpty ? defaultColor : colors.last;

    emit(
      state.copyWith(
        color:
            colors.isEmpty && state.color != null
                ? colorToEmit
                : state.color ?? colorToEmit,
      ),
    );
  }

  /// Changes the current color to a random or a specified color from history
  Future<ColorModel> changeCurrentColor({ColorModel? changeColor}) async {
    final ColorModel color =
        changeColor ??
        ColorModel(
          red: Random().nextInt(maxColorValue),
          green: Random().nextInt(maxColorValue),
          blue: Random().nextInt(maxColorValue),
          opacity: Random().nextDouble(),
        );

    emit(state.copyWith(color: color));
    await _addColorUseCase.call(color);

    return color;
  }
}
