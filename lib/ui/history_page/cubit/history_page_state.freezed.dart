// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HistoryPageState {
  List<ColorModel> get colors => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  /// Create a copy of HistoryPageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HistoryPageStateCopyWith<HistoryPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryPageStateCopyWith<$Res> {
  factory $HistoryPageStateCopyWith(
          HistoryPageState value, $Res Function(HistoryPageState) then) =
      _$HistoryPageStateCopyWithImpl<$Res, HistoryPageState>;
  @useResult
  $Res call({List<ColorModel> colors, bool isLoading});
}

/// @nodoc
class _$HistoryPageStateCopyWithImpl<$Res, $Val extends HistoryPageState>
    implements $HistoryPageStateCopyWith<$Res> {
  _$HistoryPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HistoryPageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? colors = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      colors: null == colors
          ? _value.colors
          : colors // ignore: cast_nullable_to_non_nullable
              as List<ColorModel>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HistoryPageStateImplCopyWith<$Res>
    implements $HistoryPageStateCopyWith<$Res> {
  factory _$$HistoryPageStateImplCopyWith(_$HistoryPageStateImpl value,
          $Res Function(_$HistoryPageStateImpl) then) =
      __$$HistoryPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ColorModel> colors, bool isLoading});
}

/// @nodoc
class __$$HistoryPageStateImplCopyWithImpl<$Res>
    extends _$HistoryPageStateCopyWithImpl<$Res, _$HistoryPageStateImpl>
    implements _$$HistoryPageStateImplCopyWith<$Res> {
  __$$HistoryPageStateImplCopyWithImpl(_$HistoryPageStateImpl _value,
      $Res Function(_$HistoryPageStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HistoryPageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? colors = null,
    Object? isLoading = null,
  }) {
    return _then(_$HistoryPageStateImpl(
      colors: null == colors
          ? _value._colors
          : colors // ignore: cast_nullable_to_non_nullable
              as List<ColorModel>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$HistoryPageStateImpl implements _HistoryPageState {
  const _$HistoryPageStateImpl(
      {final List<ColorModel> colors = const [], this.isLoading = false})
      : _colors = colors;

  final List<ColorModel> _colors;
  @override
  @JsonKey()
  List<ColorModel> get colors {
    if (_colors is EqualUnmodifiableListView) return _colors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_colors);
  }

  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'HistoryPageState(colors: $colors, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HistoryPageStateImpl &&
            const DeepCollectionEquality().equals(other._colors, _colors) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_colors), isLoading);

  /// Create a copy of HistoryPageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HistoryPageStateImplCopyWith<_$HistoryPageStateImpl> get copyWith =>
      __$$HistoryPageStateImplCopyWithImpl<_$HistoryPageStateImpl>(
          this, _$identity);
}

abstract class _HistoryPageState implements HistoryPageState {
  const factory _HistoryPageState(
      {final List<ColorModel> colors,
      final bool isLoading}) = _$HistoryPageStateImpl;

  @override
  List<ColorModel> get colors;
  @override
  bool get isLoading;

  /// Create a copy of HistoryPageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HistoryPageStateImplCopyWith<_$HistoryPageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
