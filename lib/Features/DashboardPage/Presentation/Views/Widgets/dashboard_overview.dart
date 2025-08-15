import 'package:ecomflutter/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Manager/dashboard_cubit.dart';
import '../../Manager/dashboard_state.dart';

class DashboardOverview extends StatefulWidget {
  const DashboardOverview({super.key});

  @override
  State<DashboardOverview> createState() => _DashboardOverviewState();
}

class _DashboardOverviewState extends State<DashboardOverview> {
  @override
  void initState() {
    super.initState();
    // Load dashboard stats when the widget is first created
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<DashboardCubit>().loadDashboardStats();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      buildWhen: (previous, current) {
        // Only rebuild for stats-related states
        return current is StatsLoading || 
               current is StatsLoaded || 
               current is DashboardError;
      },
      builder: (context, state) {
        if (state is StatsLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is StatsLoaded) {
          final stats = state.stats;
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Dashboard Overview',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: appbarSec,
                  ),
                ),
                const SizedBox(height: 20),
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.5,
                  children: [
                    _buildStatCard(
                      context,
                      'Total Products',
                      stats['totalProducts'].toString(),
                      Icons.inventory,
                      Colors.blue,
                    ),
                    _buildStatCard(
                      context,
                      'Total Orders',
                      stats['totalOrders'].toString(),
                      Icons.shopping_cart,
                      Colors.orange,
                    ),
                    _buildStatCard(
                      context,
                      'Pending Orders',
                      stats['pendingOrders'].toString(),
                      Icons.pending,
                      Colors.red,
                    ),
                    _buildStatCard(
                      context,
                      'Total Users',
                      stats['totalUsers'].toString(),
                      Icons.people,
                      Colors.green,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                _buildQuickActions(context),
              ],
            ),
          );
        }

        return const Center(child: Text('No data available'));
      },
    );
  }

  Widget _buildStatCard(
    BuildContext context,
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: color),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: appbarSec,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRevenueCard(BuildContext context, double revenue) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [appbarSec, Colors.purple],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: appbarSec.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.attach_money, color: Colors.white, size: 30),
                SizedBox(width: 8),
                Text(
                  'Total Revenue',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              '\$${revenue.toStringAsFixed(2)}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'From delivered orders',
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Quick Actions',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: appbarSec,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildActionButton(context, 'Add Product', Icons.add, () {
                // Navigate to products section and show add dialog
                // This will be handled by the parent widget
              }),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildActionButton(
                context,
                'View Orders',
                Icons.shopping_cart,
                () {
                  // Navigate to orders section
                  // This will be handled by the parent widget
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActionButton(
    BuildContext context,
    String title,
    IconData icon,
    VoidCallback onPressed,
  ) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: appbarSec,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Column(
        children: [
          Icon(icon, size: 24),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
