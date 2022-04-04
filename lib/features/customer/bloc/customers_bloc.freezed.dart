// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'customers_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CustomersStateTearOff {
  const _$CustomersStateTearOff();

  _CustomersState call(
      {List<Customer> customers = const [],
      CustomersStatus loadingStatus = CustomersStatus.initial,
      String? lastError,
      dynamic isBusy = false,
      List<int> busyItem = const []}) {
    return _CustomersState(
      customers: customers,
      loadingStatus: loadingStatus,
      lastError: lastError,
      isBusy: isBusy,
      busyItem: busyItem,
    );
  }
}

/// @nodoc
const $CustomersState = _$CustomersStateTearOff();

/// @nodoc
mixin _$CustomersState {
  List<Customer> get customers => throw _privateConstructorUsedError;
  CustomersStatus get loadingStatus => throw _privateConstructorUsedError;
  String? get lastError => throw _privateConstructorUsedError;
  dynamic get isBusy => throw _privateConstructorUsedError;
  List<int> get busyItem => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CustomersStateCopyWith<CustomersState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomersStateCopyWith<$Res> {
  factory $CustomersStateCopyWith(
          CustomersState value, $Res Function(CustomersState) then) =
      _$CustomersStateCopyWithImpl<$Res>;
  $Res call(
      {List<Customer> customers,
      CustomersStatus loadingStatus,
      String? lastError,
      dynamic isBusy,
      List<int> busyItem});
}

/// @nodoc
class _$CustomersStateCopyWithImpl<$Res>
    implements $CustomersStateCopyWith<$Res> {
  _$CustomersStateCopyWithImpl(this._value, this._then);

  final CustomersState _value;
  // ignore: unused_field
  final $Res Function(CustomersState) _then;

  @override
  $Res call({
    Object? customers = freezed,
    Object? loadingStatus = freezed,
    Object? lastError = freezed,
    Object? isBusy = freezed,
    Object? busyItem = freezed,
  }) {
    return _then(_value.copyWith(
      customers: customers == freezed
          ? _value.customers
          : customers // ignore: cast_nullable_to_non_nullable
              as List<Customer>,
      loadingStatus: loadingStatus == freezed
          ? _value.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as CustomersStatus,
      lastError: lastError == freezed
          ? _value.lastError
          : lastError // ignore: cast_nullable_to_non_nullable
              as String?,
      isBusy: isBusy == freezed
          ? _value.isBusy
          : isBusy // ignore: cast_nullable_to_non_nullable
              as dynamic,
      busyItem: busyItem == freezed
          ? _value.busyItem
          : busyItem // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
abstract class _$CustomersStateCopyWith<$Res>
    implements $CustomersStateCopyWith<$Res> {
  factory _$CustomersStateCopyWith(
          _CustomersState value, $Res Function(_CustomersState) then) =
      __$CustomersStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<Customer> customers,
      CustomersStatus loadingStatus,
      String? lastError,
      dynamic isBusy,
      List<int> busyItem});
}

/// @nodoc
class __$CustomersStateCopyWithImpl<$Res>
    extends _$CustomersStateCopyWithImpl<$Res>
    implements _$CustomersStateCopyWith<$Res> {
  __$CustomersStateCopyWithImpl(
      _CustomersState _value, $Res Function(_CustomersState) _then)
      : super(_value, (v) => _then(v as _CustomersState));

  @override
  _CustomersState get _value => super._value as _CustomersState;

  @override
  $Res call({
    Object? customers = freezed,
    Object? loadingStatus = freezed,
    Object? lastError = freezed,
    Object? isBusy = freezed,
    Object? busyItem = freezed,
  }) {
    return _then(_CustomersState(
      customers: customers == freezed
          ? _value.customers
          : customers // ignore: cast_nullable_to_non_nullable
              as List<Customer>,
      loadingStatus: loadingStatus == freezed
          ? _value.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as CustomersStatus,
      lastError: lastError == freezed
          ? _value.lastError
          : lastError // ignore: cast_nullable_to_non_nullable
              as String?,
      isBusy: isBusy == freezed ? _value.isBusy : isBusy,
      busyItem: busyItem == freezed
          ? _value.busyItem
          : busyItem // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc

class _$_CustomersState implements _CustomersState {
  _$_CustomersState(
      {this.customers = const [],
      this.loadingStatus = CustomersStatus.initial,
      this.lastError,
      this.isBusy = false,
      this.busyItem = const []});

  @JsonKey()
  @override
  final List<Customer> customers;
  @JsonKey()
  @override
  final CustomersStatus loadingStatus;
  @override
  final String? lastError;
  @JsonKey()
  @override
  final dynamic isBusy;
  @JsonKey()
  @override
  final List<int> busyItem;

  @override
  String toString() {
    return 'CustomersState(customers: $customers, loadingStatus: $loadingStatus, lastError: $lastError, isBusy: $isBusy, busyItem: $busyItem)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CustomersState &&
            const DeepCollectionEquality().equals(other.customers, customers) &&
            const DeepCollectionEquality()
                .equals(other.loadingStatus, loadingStatus) &&
            const DeepCollectionEquality().equals(other.lastError, lastError) &&
            const DeepCollectionEquality().equals(other.isBusy, isBusy) &&
            const DeepCollectionEquality().equals(other.busyItem, busyItem));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(customers),
      const DeepCollectionEquality().hash(loadingStatus),
      const DeepCollectionEquality().hash(lastError),
      const DeepCollectionEquality().hash(isBusy),
      const DeepCollectionEquality().hash(busyItem));

  @JsonKey(ignore: true)
  @override
  _$CustomersStateCopyWith<_CustomersState> get copyWith =>
      __$CustomersStateCopyWithImpl<_CustomersState>(this, _$identity);
}

abstract class _CustomersState implements CustomersState {
  factory _CustomersState(
      {List<Customer> customers,
      CustomersStatus loadingStatus,
      String? lastError,
      dynamic isBusy,
      List<int> busyItem}) = _$_CustomersState;

  @override
  List<Customer> get customers;
  @override
  CustomersStatus get loadingStatus;
  @override
  String? get lastError;
  @override
  dynamic get isBusy;
  @override
  List<int> get busyItem;
  @override
  @JsonKey(ignore: true)
  _$CustomersStateCopyWith<_CustomersState> get copyWith =>
      throw _privateConstructorUsedError;
}
