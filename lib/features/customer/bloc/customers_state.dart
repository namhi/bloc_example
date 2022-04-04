part of 'customers_bloc.dart';

@freezed
@Freezed(maybeWhen: false, maybeMap: false)
class CustomersState with _$CustomersState {
  factory CustomersState({
    @Default([]) List<Customer> customers,
    @Default(CustomersStatus.initial) CustomersStatus loadingStatus,
    String? lastError,
    @Default(false) isBusy,
    @Default([]) List<int> busyItem,
  }) = _CustomersState;
}

enum CustomersStatus {
  initial,
  loading,
  error,
  loaded,
}
