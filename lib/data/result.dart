import 'package:freezed_annotation/freezed_annotation.dart';

import 'network_exceptions.dart';

part 'result.freezed.dart';

@freezed
abstract class Result<T> with _$Result<T> {
  const factory Result.success({required T data}) = Success<T>;

  const factory Result.failure({required dynamic error}) = Failure<T>;
}
