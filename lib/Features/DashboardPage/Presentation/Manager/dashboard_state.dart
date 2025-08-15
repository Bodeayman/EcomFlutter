import 'package:equatable/equatable.dart';
import '../../Data/Models/dashboard_product.dart';
import '../../Data/Models/dashboard_order.dart';
import '../../Data/Models/dashboard_user.dart';

abstract class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object?> get props => [];
}

class DashboardInitial extends DashboardState {}

class DashboardLoading extends DashboardState {}

class DashboardError extends DashboardState {
  final String message;

  const DashboardError(this.message);

  @override
  List<Object?> get props => [message];
}

// Products States
class ProductsLoading extends DashboardState {}

class ProductsLoaded extends DashboardState {
  final List<DashboardProduct> products;

  const ProductsLoaded(this.products);

  @override
  List<Object?> get props => [products];
}

class ProductOperationSuccess extends DashboardState {
  final String message;
  final List<DashboardProduct> products;

  const ProductOperationSuccess(this.message, this.products);

  @override
  List<Object?> get props => [message, products];
}

// Orders States
class OrdersLoading extends DashboardState {}

class OrdersLoaded extends DashboardState {
  final List<DashboardOrder> orders;
  final String selectedStatus;

  const OrdersLoaded(this.orders, {this.selectedStatus = 'all'});

  @override
  List<Object?> get props => [orders, selectedStatus];
}

class OrderOperationSuccess extends DashboardState {
  final String message;
  final List<DashboardOrder> orders;

  const OrderOperationSuccess(this.message, this.orders);

  @override
  List<Object?> get props => [message, orders];
}

// Users States
class UsersLoading extends DashboardState {}

class UsersLoaded extends DashboardState {
  final List<DashboardUser> users;

  const UsersLoaded(this.users);

  @override
  List<Object?> get props => [users];
}

class UserOperationSuccess extends DashboardState {
  final String message;
  final List<DashboardUser> users;

  const UserOperationSuccess(this.message, this.users);

  @override
  List<Object?> get props => [message, users];
}

// Dashboard Stats States
class StatsLoading extends DashboardState {}

class StatsLoaded extends DashboardState {
  final Map<String, dynamic> stats;

  const StatsLoaded(this.stats);

  @override
  List<Object?> get props => [stats];
}

// Access Control States
class AccessChecking extends DashboardState {}

class AccessGranted extends DashboardState {}

class AccessDenied extends DashboardState {
  final String message;

  const AccessDenied(this.message);

  @override
  List<Object?> get props => [message];
} 