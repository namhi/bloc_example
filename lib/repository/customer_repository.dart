import 'package:tdental_example/models/customer.dart';

abstract class CustomerRepository {
  Future<List<Customer>> gets();
  Future<Customer> getById(int id);
  Future<void> delete(int id);
  Future<void> update(Customer customer);
  Future<void> insert(Customer customer);
  Future<void> changeStatus({
    required int customerId,
    required String newStatus,
  });
}
