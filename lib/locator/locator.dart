import 'package:get_it/get_it.dart';
import 'package:tdental_example/fake/repository/fake_customer_repository_impl.dart';
import 'package:tdental_example/repository/customer_repository.dart';

final locator = GetIt.I;

void setupLocator() {
  locator
      .registerFactory<CustomerRepository>(() => FakeCustomerRepositoryImpl());
}

/// Không phụ thuộc
/// Phụ thuộc vào 1 dependecy khác
/// Phụ thuộc lẫn nhau
///
/// Bloc/ViewModel
