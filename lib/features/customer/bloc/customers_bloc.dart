import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:tdental_example/repository/customer_repository.dart';

import '../../../models/customer.dart';

part 'customers_event.dart';
part 'customers_state.dart';
part 'customers_bloc.freezed.dart';

class CustomersBloc extends Bloc<CustomersEvent, CustomersState> {
  CustomersBloc({
    required CustomerRepository customerRepository,
  })  : _customerRepository = customerRepository,
        super(CustomersState()) {
    on<CustomersLoaded>(_onLoaded);
    on<CustomerDeleted>(_onDeleted);
    on<CustomersStatusChanged>(_onStatusChanged);
    on<CustomerAdded>(_onAdded);
  }

  late final CustomerRepository _customerRepository;

  FutureOr<void> _onLoaded(
    CustomersLoaded event,
    Emitter<CustomersState> emit,
  ) async {
    emit(
      CustomersState(
        loadingStatus: CustomersStatus.loading,
      ),
    );
    try {
      final customers = await _customerRepository.gets();
      //throw Exception('error rổi');
      emit(
        CustomersState(
          loadingStatus: CustomersStatus.loaded,
          customers: customers,
        ),
      );
    } catch (e, s) {
      print(e); //TODO add logs
      emit(
        CustomersState(
          customers: [],
          loadingStatus: CustomersStatus.error,
          lastError: e.toString(),
        ),
      );
    }
  }

  FutureOr<void> _onDeleted(
    CustomerDeleted event,
    Emitter<CustomersState> emit,
  ) async {
    try {
      // throw Exception('On errr');
      await _customerRepository.delete(event.customerId);

      final customers = state.customers.toList();
      customers.removeWhere((element) => element.id == event.customerId);
      emit(
        state.copyWith(customers: customers),
      );
    } catch (e, s) {
      print(e);

      emit(
        state.copyWith(
          lastError: e.toString(),
        ),
      );
    }
  }

  FutureOr<void> _onStatusChanged(
    CustomersStatusChanged event,
    Emitter<CustomersState> emit,
  ) async {
    emit(
      state.copyWith(
        busyItem: state.busyItem.toList()..add(event.customer.id),
      ),
    );
    try {
      await _customerRepository.changeStatus(
        customerId: event.customer.id,
        newStatus: event.status,
      );

      final customers = state.customers.toList();

      final customerIndex =
          customers.indexWhere((element) => element.id == event.customer.id);

      customers[customerIndex] = event.customer.copyWith(
        status: event.status,
      );

      emit(
        state.copyWith(
          customers: customers,
          isBusy: false,
          busyItem: state.busyItem.toList()..remove(event.customer.id),
        ),
      );
    } catch (e, s) {}
  }

  FutureOr<void> _onAdded(
    CustomerAdded event,
    Emitter<CustomersState> emit,
  ) async {
    await _customerRepository.insert(event.customer);
    final customers = state.customers.toList();
    customers.add(event.customer);
    emit(
      state.copyWith(
        customers: customers,
      ),
    );
  }
}
