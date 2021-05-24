// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'weather_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$WeatherEventTearOff {
  const _$WeatherEventTearOff();

  GetCurrentWeather getCurrentWeather(double lat, double lng) {
    return GetCurrentWeather(
      lat,
      lng,
    );
  }

  GetForecast getForecast(double lat, double lng) {
    return GetForecast(
      lat,
      lng,
    );
  }
}

/// @nodoc
const $WeatherEvent = _$WeatherEventTearOff();

/// @nodoc
mixin _$WeatherEvent {
  double get lat => throw _privateConstructorUsedError;
  double get lng => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double lat, double lng) getCurrentWeather,
    required TResult Function(double lat, double lng) getForecast,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double lat, double lng)? getCurrentWeather,
    TResult Function(double lat, double lng)? getForecast,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetCurrentWeather value) getCurrentWeather,
    required TResult Function(GetForecast value) getForecast,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetCurrentWeather value)? getCurrentWeather,
    TResult Function(GetForecast value)? getForecast,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WeatherEventCopyWith<WeatherEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherEventCopyWith<$Res> {
  factory $WeatherEventCopyWith(
          WeatherEvent value, $Res Function(WeatherEvent) then) =
      _$WeatherEventCopyWithImpl<$Res>;
  $Res call({double lat, double lng});
}

/// @nodoc
class _$WeatherEventCopyWithImpl<$Res> implements $WeatherEventCopyWith<$Res> {
  _$WeatherEventCopyWithImpl(this._value, this._then);

  final WeatherEvent _value;
  // ignore: unused_field
  final $Res Function(WeatherEvent) _then;

  @override
  $Res call({
    Object? lat = freezed,
    Object? lng = freezed,
  }) {
    return _then(_value.copyWith(
      lat: lat == freezed
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: lng == freezed
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class $GetCurrentWeatherCopyWith<$Res>
    implements $WeatherEventCopyWith<$Res> {
  factory $GetCurrentWeatherCopyWith(
          GetCurrentWeather value, $Res Function(GetCurrentWeather) then) =
      _$GetCurrentWeatherCopyWithImpl<$Res>;
  @override
  $Res call({double lat, double lng});
}

/// @nodoc
class _$GetCurrentWeatherCopyWithImpl<$Res>
    extends _$WeatherEventCopyWithImpl<$Res>
    implements $GetCurrentWeatherCopyWith<$Res> {
  _$GetCurrentWeatherCopyWithImpl(
      GetCurrentWeather _value, $Res Function(GetCurrentWeather) _then)
      : super(_value, (v) => _then(v as GetCurrentWeather));

  @override
  GetCurrentWeather get _value => super._value as GetCurrentWeather;

  @override
  $Res call({
    Object? lat = freezed,
    Object? lng = freezed,
  }) {
    return _then(GetCurrentWeather(
      lat == freezed
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng == freezed
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$GetCurrentWeather implements GetCurrentWeather {
  const _$GetCurrentWeather(this.lat, this.lng);

  @override
  final double lat;
  @override
  final double lng;

  @override
  String toString() {
    return 'WeatherEvent.getCurrentWeather(lat: $lat, lng: $lng)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GetCurrentWeather &&
            (identical(other.lat, lat) ||
                const DeepCollectionEquality().equals(other.lat, lat)) &&
            (identical(other.lng, lng) ||
                const DeepCollectionEquality().equals(other.lng, lng)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(lat) ^
      const DeepCollectionEquality().hash(lng);

  @JsonKey(ignore: true)
  @override
  $GetCurrentWeatherCopyWith<GetCurrentWeather> get copyWith =>
      _$GetCurrentWeatherCopyWithImpl<GetCurrentWeather>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double lat, double lng) getCurrentWeather,
    required TResult Function(double lat, double lng) getForecast,
  }) {
    return getCurrentWeather(lat, lng);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double lat, double lng)? getCurrentWeather,
    TResult Function(double lat, double lng)? getForecast,
    required TResult orElse(),
  }) {
    if (getCurrentWeather != null) {
      return getCurrentWeather(lat, lng);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetCurrentWeather value) getCurrentWeather,
    required TResult Function(GetForecast value) getForecast,
  }) {
    return getCurrentWeather(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetCurrentWeather value)? getCurrentWeather,
    TResult Function(GetForecast value)? getForecast,
    required TResult orElse(),
  }) {
    if (getCurrentWeather != null) {
      return getCurrentWeather(this);
    }
    return orElse();
  }
}

abstract class GetCurrentWeather implements WeatherEvent {
  const factory GetCurrentWeather(double lat, double lng) = _$GetCurrentWeather;

  @override
  double get lat => throw _privateConstructorUsedError;
  @override
  double get lng => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $GetCurrentWeatherCopyWith<GetCurrentWeather> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetForecastCopyWith<$Res>
    implements $WeatherEventCopyWith<$Res> {
  factory $GetForecastCopyWith(
          GetForecast value, $Res Function(GetForecast) then) =
      _$GetForecastCopyWithImpl<$Res>;
  @override
  $Res call({double lat, double lng});
}

/// @nodoc
class _$GetForecastCopyWithImpl<$Res> extends _$WeatherEventCopyWithImpl<$Res>
    implements $GetForecastCopyWith<$Res> {
  _$GetForecastCopyWithImpl(
      GetForecast _value, $Res Function(GetForecast) _then)
      : super(_value, (v) => _then(v as GetForecast));

  @override
  GetForecast get _value => super._value as GetForecast;

  @override
  $Res call({
    Object? lat = freezed,
    Object? lng = freezed,
  }) {
    return _then(GetForecast(
      lat == freezed
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng == freezed
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$GetForecast implements GetForecast {
  const _$GetForecast(this.lat, this.lng);

  @override
  final double lat;
  @override
  final double lng;

  @override
  String toString() {
    return 'WeatherEvent.getForecast(lat: $lat, lng: $lng)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GetForecast &&
            (identical(other.lat, lat) ||
                const DeepCollectionEquality().equals(other.lat, lat)) &&
            (identical(other.lng, lng) ||
                const DeepCollectionEquality().equals(other.lng, lng)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(lat) ^
      const DeepCollectionEquality().hash(lng);

  @JsonKey(ignore: true)
  @override
  $GetForecastCopyWith<GetForecast> get copyWith =>
      _$GetForecastCopyWithImpl<GetForecast>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double lat, double lng) getCurrentWeather,
    required TResult Function(double lat, double lng) getForecast,
  }) {
    return getForecast(lat, lng);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double lat, double lng)? getCurrentWeather,
    TResult Function(double lat, double lng)? getForecast,
    required TResult orElse(),
  }) {
    if (getForecast != null) {
      return getForecast(lat, lng);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetCurrentWeather value) getCurrentWeather,
    required TResult Function(GetForecast value) getForecast,
  }) {
    return getForecast(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetCurrentWeather value)? getCurrentWeather,
    TResult Function(GetForecast value)? getForecast,
    required TResult orElse(),
  }) {
    if (getForecast != null) {
      return getForecast(this);
    }
    return orElse();
  }
}

abstract class GetForecast implements WeatherEvent {
  const factory GetForecast(double lat, double lng) = _$GetForecast;

  @override
  double get lat => throw _privateConstructorUsedError;
  @override
  double get lng => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $GetForecastCopyWith<GetForecast> get copyWith =>
      throw _privateConstructorUsedError;
}
