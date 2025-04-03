import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_application/models/color_model.dart';

part 'home_page_state.freezed.dart';

@freezed
/// State class for the HomePageCubit
class HomePageState with _$HomePageState {
  /// Constructor for [HomePageState].
  const factory HomePageState({ColorModel? color}) = _HomePageState;
}
