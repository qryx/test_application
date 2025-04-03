import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_application/models/color_model.dart';
import 'package:test_application/services/use_case/delete_all_color_use_case.dart';
import 'package:test_application/services/use_case/delete_color_use_case.dart';
import 'package:test_application/services/use_case/get_colors_use_case.dart';
import 'package:test_application/ui/history_page/cubit/history_page_state.dart';

/// Cubit for managing the history page state
class HistoryPageCubit extends Cubit<HistoryPageState> {
  /// Use cases for deleting color
  final DeleteColorUseCase _deleteColorUseCase;

  /// Use case for deleting all colors
  final DeleteAllColorUseCase _deleteAllColorUseCase;

  /// Use case for getting colors
  final GetColorsUseCase _getColorsUseCase;

  /// Constructor for [HistoryPageCubit]
  HistoryPageCubit(
    this._deleteColorUseCase,
    this._deleteAllColorUseCase,
    this._getColorsUseCase,
  ) : super(const HistoryPageState());

  /// Initializes the state by getting colors
  Future<void> init() async {
    emit(state.copyWith(isLoading: true));
    final colors = await _getColorsUseCase.call();
    emit(state.copyWith(colors: colors, isLoading: false));
  }

  /// Deletes a specific color
  Future<void> deleteColor(ColorModel color) async {
    await _deleteColorUseCase.call(color);
    await init();
  }

  /// Deletes all colors
  Future<void> deleteAllColors() async {
    await _deleteAllColorUseCase.call();
    await init();
  }
}
