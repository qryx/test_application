import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_application/models/color_model.dart';
import 'package:test_application/services/use_case/delete_all_color_use_case.dart';
import 'package:test_application/services/use_case/delete_color_use_case.dart';
import 'package:test_application/services/use_case/get_colors_use_case.dart';
import 'package:test_application/ui/history_page/bloc/history_page_state.dart';

class HistoryPageCubit extends Cubit<HistoryPageState> {
  HistoryPageCubit(
    this._deleteColorUseCase,
    this._deleteAllColorUseCase,
    this._getColorsUseCase,
  ) : super(const HistoryPageState());

  final DeleteColorUseCase _deleteColorUseCase;
  final DeleteAllColorUseCase _deleteAllColorUseCase;
  final GetColorsUseCase _getColorsUseCase;

  Future<void> init() async {
    emit(state.copyWith(isLoading: true));
    final colors = await _getColorsUseCase.call();
    emit(state.copyWith(colors: colors, isLoading: false));
  }

  Future<void> deleteColor(ColorModel color) async {
    await _deleteColorUseCase.call(color);
    await init();
  }

  Future<void> deleteAllColors() async {
    await _deleteAllColorUseCase.call();
    await init();
  }
}
