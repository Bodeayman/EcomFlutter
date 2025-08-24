import 'package:ecomflutter/Features/DashboardPage/Data/Models/dashboard_order.dart';
import 'package:ecomflutter/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Manager/dashboard_cubit.dart';
import '../../Manager/dashboard_state.dart';

class OrdersSection extends StatefulWidget {
  const OrdersSection({super.key});

  @override
  State<OrdersSection> createState() => _OrdersSectionState();
}

class _OrdersSectionState extends State<OrdersSection> {
  @override
  void initState() {
    super.initState();
    context.read<DashboardCubit>().loadOrders();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      buildWhen: (previous, current) {
        // Only rebuild for orders-related states
        return current is OrdersLoading ||
            current is OrdersLoaded ||
            current is OrderOperationSuccess ||
            current is DashboardError;
      },
      builder: (context, state) {
        if (state is OrdersLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is OrdersLoaded) {
          return Column(
            children: [
              _buildHeader(context),
              _buildStatusFilter(context),
              Expanded(
                child:
                    state.orders.isEmpty
                        ? const Center(child: Text('No orders found'))
                        : _buildOrdersList(context, state.orders),
              ),
            ],
          );
        }

        return const Center(child: Text('No data available'));
      },
    );
  }
}

Widget _buildHeader(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(16.0),
    child: const Row(
      children: [
        Text(
          'Orders Management',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: appbarSec,
          ),
        ),
      ],
    ),
  );
}

Widget _buildStatusFilter(BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildFilterChip('all', 'All Orders'),
          const SizedBox(width: 8),
          _buildFilterChip('pending', 'Pending'),
          const SizedBox(width: 8),
          _buildFilterChip('approved', 'Approved'),
          const SizedBox(width: 8),
          _buildFilterChip('shipped', 'Shipped'),
          const SizedBox(width: 8),
          _buildFilterChip('delivered', 'Delivered'),
          const SizedBox(width: 8),
          _buildFilterChip('cancelled', 'Cancelled'),
        ],
      ),
    ),
  );
}

Widget _buildFilterChip(String status, String label) {
  return BlocBuilder<DashboardCubit, DashboardState>(
    builder: (context, state) {
      final isSelected =
          state is OrdersLoaded && state.selectedStatus == status;
      return FilterChip(
        label: Text(label),
        selected: isSelected,
        onSelected: (selected) {
          if (status == 'all') {
            context.read<DashboardCubit>().loadOrders();
          } else {
            context.read<DashboardCubit>().loadOrdersByStatus(status);
          }
        },
        selectedColor: appbarSec.withOpacity(0.2),
        checkmarkColor: appbarSec,
        labelStyle: TextStyle(
          color: isSelected ? appbarSec : Colors.grey[600],
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      );
    },
  );
}

Widget _buildOrdersList(BuildContext context, List<DashboardOrder> orders) {
  return ListView.builder(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    itemCount: orders.length,
    itemBuilder: (context, index) {
      final order = orders[index];
      return _buildOrderCard(context, order);
    },
  );
}

Widget _buildOrderCard(BuildContext context, DashboardOrder order) {
  return Card(
    margin: const EdgeInsets.only(bottom: 12.0),
    elevation: 2,
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Order #${order.id}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'User ID: ${order.userId.substring(0, 8)}',
                      style: TextStyle(color: Colors.grey[600], fontSize: 14),
                    ),
                    Text(
                      'Address: ${order.address}',
                      style: TextStyle(color: Colors.grey[600], fontSize: 14),
                    ),
                  ],
                ),
              ),
              _buildStatusChip(order.status),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildInfoChip(
                'Status',
                order.status.toUpperCase(),
                _getStatusColor(order.status),
              ),
              _buildInfoChip(
                'Shipped',
                (order.shippedDate != null)
                    ? _formatDate(order.shippedDate!)
                    : "Not yet",
                Colors.purple,
              ),

              _buildInfoChip(
                'Delivered',
                (order.deliveryDate != null)
                    ? _formatDate(order.deliveryDate!)
                    : "Not yet",
                Colors.green,
              ),
            ],
          ),
          if (order.orderConfirmed != null) ...[
            const SizedBox(height: 12),
            Row(
              children: [
                _buildInfoChip(
                  'Approved',
                  _formatDate(order.orderConfirmed!),
                  Colors.blue,
                ),
              ],
            ),
          ],
          const SizedBox(height: 12),
          _buildOrderActions(context, order),
        ],
      ),
    ),
  );
}

Widget _buildStatusChip(String status) {
  Color color;
  String label;

  switch (status) {
    case 'pending':
      color = Colors.orange;
      label = 'Pending';
      break;
    case 'approved':
      color = Colors.blue;
      label = 'Approved';
      break;
    case 'shipped':
      color = Colors.purple;
      label = 'Shipped';
      break;
    case 'delivered':
      color = Colors.green;
      label = 'Delivered';
      break;
    case 'cancelled':
      color = Colors.red;
      label = 'Cancelled';
      break;
    default:
      color = Colors.grey;
      label = status;
  }

  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    decoration: BoxDecoration(
      color: color.withOpacity(0.1),
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: color),
    ),
    child: Text(
      label,
      style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.bold),
    ),
  );
}

Widget _buildInfoChip(String label, String value, Color color) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    decoration: BoxDecoration(
      color: color.withOpacity(0.1),
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: color.withOpacity(0.3)),
    ),
    child: Column(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: color,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 12,
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}

Color _getStatusColor(String status) {
  switch (status) {
    case 'pending':
      return Colors.orange;
    case 'approved':
      return Colors.blue;
    case 'shipped':
      return Colors.purple;
    case 'delivered':
      return Colors.green;
    case 'cancelled':
      return Colors.red;
    default:
      return Colors.grey;
  }
}

Widget _buildOrderActions(BuildContext context, DashboardOrder order) {
  if (order.status == 'delivered' || order.status == 'cancelled') {
    return const SizedBox.shrink();
  }

  return Row(
    children: [
      if (order.status == 'pending') ...[
        Expanded(
          child: ElevatedButton(
            onPressed: () => _updateOrderStatus(context, order.id, 'approved'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
            ),
            child: const Text('Approve'),
          ),
        ),
        const SizedBox(width: 8),
      ],
      if (order.status == 'approved') ...[
        Expanded(
          child: ElevatedButton(
            onPressed: () => _updateOrderStatus(context, order.id, 'shipped'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple,
              foregroundColor: Colors.white,
            ),
            child: const Text('Ship'),
          ),
        ),
        const SizedBox(width: 8),
      ],
      if (order.status == 'shipped') ...[
        Expanded(
          child: ElevatedButton(
            onPressed: () => _updateOrderStatus(context, order.id, 'delivered'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
            ),
            child: const Text('Mark Delivered'),
          ),
        ),
        const SizedBox(width: 8),
      ],
      Expanded(
        child: ElevatedButton(
          onPressed: () => _updateOrderStatus(context, order.id, 'cancelled'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
          ),
          child: const Text('Cancel'),
        ),
      ),
    ],
  );
}

void _updateOrderStatus(BuildContext context, int orderId, String status) {
  String message;
  switch (status) {
    case 'approved':
      message = 'Approve this order?';
      break;
    case 'shipped':
      message = 'Mark this order as shipped?';
      break;
    case 'delivered':
      message = 'Mark this order as delivered?';
      break;
    case 'cancelled':
      message = 'Cancel this order?';
      break;
    default:
      message = 'Update order status?';
  }

  showDialog(
    context: context,
    builder:
        (context) => AlertDialog(
          title: const Text('Confirm Action'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<DashboardCubit>().updateOrderStatus(
                  orderId,
                  status,
                );
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(backgroundColor: appbarSec),
              child: const Text('Confirm'),
            ),
          ],
        ),
  );
}

String _formatDate(DateTime date) {
  return '${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute}';
}
