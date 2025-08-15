import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../Data/Repo/dashboard_repo.dart';
import '../../Data/Models/dashboard_product.dart';
import '../../Data/Models/dashboard_order.dart';
import '../../Data/Models/dashboard_user.dart';
import 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  final DashboardRepo _dashboardRepo;
  String _selectedOrderStatus = 'all';

  DashboardCubit(this._dashboardRepo) : super(DashboardInitial());

  // Access Control
  Future<void> checkDashboardAccess() async {
    emit(AccessChecking());
    try {
      final user = Supabase.instance.client.auth.currentUser;
      if (user == null) {
        emit(const AccessDenied('User not authenticated'));
        return;
      }

      final hasAccess = await _dashboardRepo.hasDashboardAccess(user.id);
      if (hasAccess) {
        emit(AccessGranted());
        await loadDashboardStats();
      } else {
        emit(const AccessDenied('Access denied. Dashboard role required.'));
      }
    } catch (e) {
      emit(AccessDenied('Error checking access: $e'));
    }
  }

  // Dashboard Stats
  Future<void> loadDashboardStats() async {
    emit(StatsLoading());
    try {
      final stats = await _dashboardRepo.getDashboardStats();
      emit(StatsLoaded(stats));
    } catch (e) {
      emit(DashboardError('Failed to load dashboard stats: $e'));
    }
  }

  // Products Management
  Future<void> loadProducts() async {
    emit(ProductsLoading());
    try {
      final products = await _dashboardRepo.getAllProducts();
      emit(ProductsLoaded(products));
    } catch (e) {
      emit(DashboardError('Failed to load products: $e'));
    }
  }

  Future<void> createProduct(DashboardProduct product) async {
    try {
      await _dashboardRepo.createProduct(product);
      final products = await _dashboardRepo.getAllProducts();
      emit(ProductOperationSuccess('Product created successfully', products));
    } catch (e) {
      emit(DashboardError('Failed to create product: $e'));
    }
  }
  // Why when the product is updated ,and i get all the products , it returns no data available?

  Future<void> updateProduct(DashboardProduct product) async {
    try {
      await _dashboardRepo.updateProduct(product);
      final products = await _dashboardRepo.getAllProducts();
      emit(ProductOperationSuccess('Product updated successfully', products));
    } catch (e) {
      emit(DashboardError('Failed to update product: $e'));
    }
  }

  Future<void> deleteProduct(int productId) async {
    try {
      await _dashboardRepo.deleteProduct(productId);
      final products = await _dashboardRepo.getAllProducts();
      emit(ProductOperationSuccess('Product deleted successfully', products));
    } catch (e) {
      emit(DashboardError('Failed to delete product: $e'));
    }
  }

  // Orders Management
  Future<void> loadOrders() async {
    emit(OrdersLoading());
    try {
      _selectedOrderStatus = 'all';
      final orders = await _dashboardRepo.getAllOrders();
      emit(OrdersLoaded(orders, selectedStatus: _selectedOrderStatus));
    } catch (e) {
      emit(DashboardError('Failed to load orders: $e'));
    }
  }

  Future<void> loadOrdersByStatus(String status) async {
    emit(OrdersLoading());
    try {
      _selectedOrderStatus = status;
      final orders = await _dashboardRepo.getOrdersByStatus(status);
      emit(OrdersLoaded(orders, selectedStatus: _selectedOrderStatus));
    } catch (e) {
      emit(DashboardError('Failed to load orders: $e'));
    }
  }

  Future<void> updateOrderStatus(int orderId, String status) async {
    try {
      await _dashboardRepo.updateOrderStatus(orderId, status);
      final orders = await _dashboardRepo.getAllOrders();
      emit(OrderOperationSuccess('Order status updated successfully', orders));
      // Reload orders with current filter
      if (_selectedOrderStatus == 'all') {
        await loadOrders();
      } else {
        await loadOrdersByStatus(_selectedOrderStatus);
      }
    } catch (e) {
      emit(DashboardError('Failed to update order status: $e'));
    }
  }

  // Users Management
  Future<void> loadUsers() async {
    emit(UsersLoading());
    try {
      final users = await _dashboardRepo.getAllUsers();
      emit(UsersLoaded(users));
    } catch (e) {
      emit(DashboardError('Failed to load users: $e'));
    }
  }

  Future<void> deleteUser(String userId) async {
    try {
      await _dashboardRepo.deleteUser(userId);
      final users = await _dashboardRepo.getAllUsers();
      emit(UserOperationSuccess('User deleted successfully', users));
    } catch (e) {
      emit(DashboardError('Failed to delete user: $e'));
    }
  }

  Future<void> updateUserRole(String userId, String role) async {
    try {
      await _dashboardRepo.updateUserRole(userId, role);
      final users = await _dashboardRepo.getAllUsers();
      emit(UserOperationSuccess('User role updated successfully', users));
    } catch (e) {
      emit(DashboardError('Failed to update user role: $e'));
    }
  }
}
