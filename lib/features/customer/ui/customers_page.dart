import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tdental_example/features/customer/bloc/customers_bloc.dart';
import 'package:tdental_example/models/customer.dart';

class CustomersPage extends StatefulWidget {
  const CustomersPage({Key? key}) : super(key: key);

  @override
  State<CustomersPage> createState() => _CustomersPageState();
}

class _CustomersPageState extends State<CustomersPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CustomersBloc>(
      create: (context) => CustomersBloc(
        customerRepository: GetIt.I(),
      )..add(CustomersLoaded()),
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildScaffoldBody(),
      ),
    );
  }

  PreferredSize _buildAppBar() {
    return PreferredSize(
      preferredSize: const Size(
        double.infinity,
        kToolbarHeight,
      ),
      child: Builder(builder: (context) {
        return AppBar(
          title: const Text('Khách hàng'),
          actions: [
            IconButton(
              onPressed: () {
                context.read<CustomersBloc>().add(
                      CustomerAdded(
                        const Customer(
                          name: 'Vinh',
                          id: 100,
                        ),
                      ),
                    );
              },
              icon: const Icon(Icons.add),
            ),
          ],
        );
      }),
    );
  }

  Widget _buildScaffoldBody() {
    return BlocConsumer<CustomersBloc, CustomersState>(
      listenWhen: (previous, current) =>
          previous.lastError != current.lastError,
      listener: (context, state) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(state.lastError ?? ''),
          ),
        );
      },
      buildWhen: (previous, current) =>
          previous.loadingStatus != current.loadingStatus ||
          previous.isBusy != current.isBusy,
      builder: (context, state) {
        if (state.loadingStatus == CustomersStatus.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state.loadingStatus == CustomersStatus.error) {
          return Center(
            child: Text(state.lastError ?? ''),
          );
        }
        return _BusyIndicator(
          busy: state.isBusy,
          child: _buildList(),
        );
      },
    );
  }

  Widget _buildList() {
    return BlocBuilder<CustomersBloc, CustomersState>(
        builder: (context, state) {
      if (state.customers.isEmpty) {
        return const Center(
          child: Text('Danh sách trống'),
        );
      }
      return ListView.separated(
        itemBuilder: (context, index) {
          final item = state.customers[index];
          return _CustomerItem(
            item: item,
            isBusy: state.busyItem.contains(item.id),
          );
        },
        separatorBuilder: (context, index) => Divider(),
        itemCount: state.customers.length,
      );
    });
  }
}

class _BusyIndicator extends StatelessWidget {
  const _BusyIndicator({
    Key? key,
    required this.child,
    required this.busy,
  }) : super(key: key);

  final Widget child;
  final bool busy;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (busy)
          Container(
            color: Colors.grey.withOpacity(0.2),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
      ],
    );
  }
}

class _CustomerItemWidget extends StatelessWidget {
  const _CustomerItemWidget({
    Key? key,
    required this.name,
    this.onMenuPressed,
    required this.status,
    this.busy = false,
  }) : super(key: key);

  final String name;
  final String status;
  final VoidCallback? onMenuPressed;
  final bool busy;
  @override
  Widget build(BuildContext context) {
    return _BusyIndicator(
      busy: busy,
      child: ListTile(
        title: Text(name),
        trailing: IconButton(
          onPressed: onMenuPressed,
          icon: const Icon(Icons.more_vert),
        ),
        subtitle: Text(status),
      ),
    );
  }
}

class _CustomerItem extends StatelessWidget {
  const _CustomerItem({
    Key? key,
    required this.item,
    this.isBusy = false,
  }) : super(key: key);
  final Customer item;
  final bool isBusy;

  @override
  Widget build(BuildContext context) {
    return _CustomerItemWidget(
      name: item.name,
      status: item.status,
      busy: isBusy,
      onMenuPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (_) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: const Text('Xóa'),
                  onTap: () {
                    Navigator.pop(context);
                    context.read<CustomersBloc>().add(CustomerDeleted(item.id));
                  },
                ),
                ListTile(
                  title: const Text('Đổi trạng thái'),
                  onTap: () {
                    Navigator.pop(context);
                    context.read<CustomersBloc>().add(
                          CustomersStatusChanged(
                            status: 'Khách VIP',
                            customer: item,
                          ),
                        );
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }
}
