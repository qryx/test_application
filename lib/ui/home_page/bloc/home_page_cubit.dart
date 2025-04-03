import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_application/models/color_model.dart';
import 'package:test_application/services/use_case/add_color_use_case.dart';
import 'package:test_application/services/use_case/get_colors_use_case.dart';
import 'package:test_application/ui/home_page/bloc/home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit(this._addColorUseCase, this._getColorsUseCase)
    : super(HomePageState());

  final AddColorUseCase _addColorUseCase;
  final GetColorsUseCase _getColorsUseCase;

  Future<void> init() async {
    final colors = await _getColorsUseCase.call();
    final defaultColor = ColorModel(red: 0, green: 0, blue: 0, opacity: 0);
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

  Future<ColorModel> changeCurrentColor({ColorModel? changeColor}) async {
    ColorModel color =
        changeColor ??
        ColorModel(
          red: Random().nextInt(255),
          green: Random().nextInt(255),
          blue: Random().nextInt(255),
          opacity: Random().nextDouble(),
        );

    emit(state.copyWith(color: color));
    await _addColorUseCase.call(color);
    return color;
  }
}
