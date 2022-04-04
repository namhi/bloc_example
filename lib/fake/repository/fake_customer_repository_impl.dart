import 'package:flutter/cupertino.dart';
import 'package:tdental_example/models/customer.dart';
import 'package:tdental_example/repository/customer_repository.dart';
import 'package:collection/collection.dart';

class FakeCustomerRepositoryImpl implements CustomerRepository {
  final List<Customer> _customers = [
    const Customer(id: 1, name: 'Huỳnh Tấn Vinh'),
    const Customer(id: 2, name: 'Lương Quốc Tiệp'),
    const Customer(id: 3, name: 'Trần Thúy Vy'),
    const Customer(id: 4, name: 'Đào Duy Hậu'),
    const Customer(id: 5, name: 'Đào Trọng Hậu'),
    const Customer(id: 6, name: 'Đào Duy Trọng'),
  ];
  @override
  Future<void> delete(int id) async {
    if (!_customers.any((element) => element.id == id)) {
      throw Exception('Id does not exists');
    }
    _customers.removeWhere((element) => element.id == id);
  }

  @override
  Future<Customer> getById(int id) async {
    final result = _customers.firstWhereOrNull((element) => element.id == id);
    if (result == null) {
      throw Exception('Item does not exists');
    }
    return result;
  }

  @override
  Future<List<Customer>> gets() async {
    await Future<void>.delayed(const Duration(seconds: 3));
    return _customers.toList();
  }

  @override
  Future<void> insert(Customer customer) async {
    _customers.add(customer);
  }

  @override
  Future<void> update(Customer customer) async {
    final item =
        _customers.firstWhereOrNull((element) => element.id == customer.id);
    if (item == null) {
      throw Exception('Customer does not exists');
    }

    final indexOfItem = _customers.indexOf(item);
    _customers[indexOfItem] = customer;
  }

  @override
  Future<void> changeStatus({
    required int customerId,
    required String newStatus,
  }) async {
    final item =
        _customers.firstWhereOrNull((element) => element.id == customerId);
    if (item == null) {
      throw Exception('Customer does not exists');
    }
    await Future<void>.delayed(const Duration(seconds: 3));
    final indexOfItem = _customers.indexOf(item);
    _customers[indexOfItem] = item.copyWith(status: newStatus);
  }
}
