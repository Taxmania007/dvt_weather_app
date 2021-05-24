// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'location_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LocationEventTearOff {
  const _$LocationEventTearOff();

  GetCurrentLocation getCurrentLocation() {
    return const GetCurrentLocation();
  }

  SearchCity searchCity(String input) {
    return SearchCity(
      input,
    );
  }

  SaveCity saveCity(City city) {
    return SaveCity(
      city,
    );
  }

  GetFavoriteCities getFavoriteCities() {
    return const GetFavoriteCities();
  }
}

/// @nodoc
const $LocationEvent = _$LocationEventTearOff();

/// @nodoc
mixin _$LocationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getCurrentLocation,
    required TResult Function(String input) searchCity,
    required TResult Function(City city) saveCity,
    required TResult Function() getFavoriteCities,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getCurrentLocation,
    TResult Function(String input)? searchCity,
    TResult Function(City city)? saveCity,
    TResult Function()? getFavoriteCities,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetCurrentLocation value) getCurrentLocation,
    required TResult Function(SearchCity value) searchCity,
    required TResult Function(SaveCity value) saveCity,
    required TResult Function(GetFavoriteCities value) getFavoriteCities,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetCurrentLocation value)? getCurrentLocation,
    TResult Function(SearchCity value)? searchCity,
    TResult Function(SaveCity value)? saveCity,
    TResult Function(GetFavoriteCities value)? getFavoriteCities,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationEventCopyWith<$Res> {
  factory $LocationEventCopyWith(
          LocationEvent value, $Res Function(LocationEvent) then) =
      _$LocationEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$LocationEventCopyWithImpl<$Res>
    implements $LocationEventCopyWith<$Res> {
  _$LocationEventCopyWithImpl(this._value, this._then);

  final LocationEvent _value;
  // ignore: unused_field
  final $Res Function(LocationEvent) _then;
}

/// @nodoc
abstract class $GetCurrentLocationCopyWith<$Res> {
  factory $GetCurrentLocationCopyWith(
          GetCurrentLocation value, $Res Function(GetCurrentLocation) then) =
      _$GetCurrentLocationCopyWithImpl<$Res>;
}

/// @nodoc
class _$GetCurrentLocationCopyWithImpl<$Res>
    extends _$LocationEventCopyWithImpl<$Res>
    implements $GetCurrentLocationCopyWith<$Res> {
  _$GetCurrentLocationCopyWithImpl(
      GetCurrentLocation _value, $Res Function(GetCurrentLocation) _then)
      : super(_value, (v) => _then(v as GetCurrentLocation));

  @override
  GetCurrentLocation get _value => super._value as GetCurrentLocation;
}

/// @nodoc

class _$GetCurrentLocation implements GetCurrentLocation {
  const _$GetCurrentLocation();

  @override
  String toString() {
    return 'LocationEvent.getCurrentLocation()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is GetCurrentLocation);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getCurrentLocation,
    required TResult Function(String input) searchCity,
    required TResult Function(City city) saveCity,
    required TResult Function() getFavoriteCities,
  }) {
    return getCurrentLocation();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getCurrentLocation,
    TResult Function(String input)? searchCity,
    TResult Function(City city)? saveCity,
    TResult Function()? getFavoriteCities,
    required TResult orElse(),
  }) {
    if (getCurrentLocation != null) {
      return getCurrentLocation();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetCurrentLocation value) getCurrentLocation,
    required TResult Function(SearchCity value) searchCity,
    required TResult Function(SaveCity value) saveCity,
    required TResult Function(GetFavoriteCities value) getFavoriteCities,
  }) {
    return getCurrentLocation(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetCurrentLocation value)? getCurrentLocation,
    TResult Function(SearchCity value)? searchCity,
    TResult Function(SaveCity value)? saveCity,
    TResult Function(GetFavoriteCities value)? getFavoriteCities,
    required TResult orElse(),
  }) {
    if (getCurrentLocation != null) {
      return getCurrentLocation(this);
    }
    return orElse();
  }
}

abstract class GetCurrentLocation implements LocationEvent {
  const factory GetCurrentLocation() = _$GetCurrentLocation;
}

/// @nodoc
abstract class $SearchCityCopyWith<$Res> {
  factory $SearchCityCopyWith(
          SearchCity value, $Res Function(SearchCity) then) =
      _$SearchCityCopyWithImpl<$Res>;
  $Res call({String input});
}

/// @nodoc
class _$SearchCityCopyWithImpl<$Res> extends _$LocationEventCopyWithImpl<$Res>
    implements $SearchCityCopyWith<$Res> {
  _$SearchCityCopyWithImpl(SearchCity _value, $Res Function(SearchCity) _then)
      : super(_value, (v) => _then(v as SearchCity));

  @override
  SearchCity get _value => super._value as SearchCity;

  @override
  $Res call({
    Object? input = freezed,
  }) {
    return _then(SearchCity(
      input == freezed
          ? _value.input
          : input // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchCity implements SearchCity {
  const _$SearchCity(this.input);

  @override
  final String input;

  @override
  String toString() {
    return 'LocationEvent.searchCity(input: $input)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SearchCity &&
            (identical(other.input, input) ||
                const DeepCollectionEquality().equals(other.input, input)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(input);

  @JsonKey(ignore: true)
  @override
  $SearchCityCopyWith<SearchCity> get copyWith =>
      _$SearchCityCopyWithImpl<SearchCity>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getCurrentLocation,
    required TResult Function(String input) searchCity,
    required TResult Function(City city) saveCity,
    required TResult Function() getFavoriteCities,
  }) {
    return searchCity(input);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getCurrentLocation,
    TResult Function(String input)? searchCity,
    TResult Function(City city)? saveCity,
    TResult Function()? getFavoriteCities,
    required TResult orElse(),
  }) {
    if (searchCity != null) {
      return searchCity(input);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetCurrentLocation value) getCurrentLocation,
    required TResult Function(SearchCity value) searchCity,
    required TResult Function(SaveCity value) saveCity,
    required TResult Function(GetFavoriteCities value) getFavoriteCities,
  }) {
    return searchCity(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetCurrentLocation value)? getCurrentLocation,
    TResult Function(SearchCity value)? searchCity,
    TResult Function(SaveCity value)? saveCity,
    TResult Function(GetFavoriteCities value)? getFavoriteCities,
    required TResult orElse(),
  }) {
    if (searchCity != null) {
      return searchCity(this);
    }
    return orElse();
  }
}

abstract class SearchCity implements LocationEvent {
  const factory SearchCity(String input) = _$SearchCity;

  String get input => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchCityCopyWith<SearchCity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SaveCityCopyWith<$Res> {
  factory $SaveCityCopyWith(SaveCity value, $Res Function(SaveCity) then) =
      _$SaveCityCopyWithImpl<$Res>;
  $Res call({City city});
}

/// @nodoc
class _$SaveCityCopyWithImpl<$Res> extends _$LocationEventCopyWithImpl<$Res>
    implements $SaveCityCopyWith<$Res> {
  _$SaveCityCopyWithImpl(SaveCity _value, $Res Function(SaveCity) _then)
      : super(_value, (v) => _then(v as SaveCity));

  @override
  SaveCity get _value => super._value as SaveCity;

  @override
  $Res call({
    Object? city = freezed,
  }) {
    return _then(SaveCity(
      city == freezed
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as City,
    ));
  }
}

/// @nodoc

class _$SaveCity implements SaveCity {
  const _$SaveCity(this.city);

  @override
  final City city;

  @override
  String toString() {
    return 'LocationEvent.saveCity(city: $city)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SaveCity &&
            (identical(other.city, city) ||
                const DeepCollectionEquality().equals(other.city, city)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(city);

  @JsonKey(ignore: true)
  @override
  $SaveCityCopyWith<SaveCity> get copyWith =>
      _$SaveCityCopyWithImpl<SaveCity>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getCurrentLocation,
    required TResult Function(String input) searchCity,
    required TResult Function(City city) saveCity,
    required TResult Function() getFavoriteCities,
  }) {
    return saveCity(city);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getCurrentLocation,
    TResult Function(String input)? searchCity,
    TResult Function(City city)? saveCity,
    TResult Function()? getFavoriteCities,
    required TResult orElse(),
  }) {
    if (saveCity != null) {
      return saveCity(city);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetCurrentLocation value) getCurrentLocation,
    required TResult Function(SearchCity value) searchCity,
    required TResult Function(SaveCity value) saveCity,
    required TResult Function(GetFavoriteCities value) getFavoriteCities,
  }) {
    return saveCity(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetCurrentLocation value)? getCurrentLocation,
    TResult Function(SearchCity value)? searchCity,
    TResult Function(SaveCity value)? saveCity,
    TResult Function(GetFavoriteCities value)? getFavoriteCities,
    required TResult orElse(),
  }) {
    if (saveCity != null) {
      return saveCity(this);
    }
    return orElse();
  }
}

abstract class SaveCity implements LocationEvent {
  const factory SaveCity(City city) = _$SaveCity;

  City get city => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SaveCityCopyWith<SaveCity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetFavoriteCitiesCopyWith<$Res> {
  factory $GetFavoriteCitiesCopyWith(
          GetFavoriteCities value, $Res Function(GetFavoriteCities) then) =
      _$GetFavoriteCitiesCopyWithImpl<$Res>;
}

/// @nodoc
class _$GetFavoriteCitiesCopyWithImpl<$Res>
    extends _$LocationEventCopyWithImpl<$Res>
    implements $GetFavoriteCitiesCopyWith<$Res> {
  _$GetFavoriteCitiesCopyWithImpl(
      GetFavoriteCities _value, $Res Function(GetFavoriteCities) _then)
      : super(_value, (v) => _then(v as GetFavoriteCities));

  @override
  GetFavoriteCities get _value => super._value as GetFavoriteCities;
}

/// @nodoc

class _$GetFavoriteCities implements GetFavoriteCities {
  const _$GetFavoriteCities();

  @override
  String toString() {
    return 'LocationEvent.getFavoriteCities()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is GetFavoriteCities);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getCurrentLocation,
    required TResult Function(String input) searchCity,
    required TResult Function(City city) saveCity,
    required TResult Function() getFavoriteCities,
  }) {
    return getFavoriteCities();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getCurrentLocation,
    TResult Function(String input)? searchCity,
    TResult Function(City city)? saveCity,
    TResult Function()? getFavoriteCities,
    required TResult orElse(),
  }) {
    if (getFavoriteCities != null) {
      return getFavoriteCities();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetCurrentLocation value) getCurrentLocation,
    required TResult Function(SearchCity value) searchCity,
    required TResult Function(SaveCity value) saveCity,
    required TResult Function(GetFavoriteCities value) getFavoriteCities,
  }) {
    return getFavoriteCities(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetCurrentLocation value)? getCurrentLocation,
    TResult Function(SearchCity value)? searchCity,
    TResult Function(SaveCity value)? saveCity,
    TResult Function(GetFavoriteCities value)? getFavoriteCities,
    required TResult orElse(),
  }) {
    if (getFavoriteCities != null) {
      return getFavoriteCities(this);
    }
    return orElse();
  }
}

abstract class GetFavoriteCities implements LocationEvent {
  const factory GetFavoriteCities() = _$GetFavoriteCities;
}
