import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_application/models/color_model.dart';

part 'history_page_state.freezed.dart';

@freezed
/// State class for the HistoryPageCubit
class HistoryPageState with _$HistoryPageState {
  /// Constructor for [HistoryPageState].
  const factory HistoryPageState({
    @Default([]) List<ColorModel> colors,
    @Default(false) bool isLoading,
  }) = _HistoryPageState;
}
