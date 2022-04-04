part of 'customers_bloc.dart';

@immutable
abstract class CustomersEvent {}

class CustomersLoaded extends CustomersEvent {
  /// Create a new [CustomersEvent] added when the UI is loaded
  CustomersLoaded();
}

class CustomersRefreshed extends CustomersEvent {}

class CustomerDeleted extends CustomersEvent {
  CustomerDeleted(this.customerId);
  final int customerId;
}

class CustomerAdded extends CustomersEvent {
  CustomerAdded(this.customer);
  final Customer customer;
}

class CustomersStatusChanged extends CustomersEvent {
  /// Tạo mới một [CustomersEvent] được gọi khi muốn thay đổi trạng thái một
  /// khách hàng.
  CustomersStatusChanged({
    required this.customer,
    required this.status,
  }) : assert(status != '');
  final String status;
  final Customer customer;
}
