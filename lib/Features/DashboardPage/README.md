# Dashboard Page Feature

This feature provides a comprehensive admin dashboard for managing the e-commerce application.

## Features

### 1. Access Control
- Only users with "dashboard" or "admin" role can access the dashboard
- Automatic redirect to home page for unauthorized users
- Role-based access control using Supabase authentication

### 2. Dashboard Overview
- Statistics cards showing total products, orders, users, and revenue
- Quick action buttons for common tasks
- Real-time data from Supabase backend

### 3. Products Management
- **View Products**: Display all products with name, price, quantity, and category
- **Add Product**: Create new products with name, description, price, quantity, and category
- **Edit Product**: Modify existing product details
- **Delete Product**: Remove products from the system
- **Restock**: Special functionality to add quantity to out-of-stock products

### 4. Orders Management
- **View Orders**: Display all orders with customer information and order details
- **Filter Orders**: Filter by status (pending, approved, shipped, delivered, cancelled)
- **Order Actions**: 
  - Approve pending orders
  - Mark approved orders as shipped
  - Mark shipped orders as delivered
  - Cancel orders at any stage
- **Order Details**: View order items, customer information, and order history

### 5. Users Management
- **View Users**: Display all registered users with their information
- **Change User Roles**: Modify user roles (user, admin, dashboard)
- **Delete Users**: Remove users from the system
- **User Information**: View user details including registration date and last login

## Architecture

### Data Models
- `DashboardProduct`: Product management model
- `DashboardOrder`: Order management model with items
- `DashboardUser`: User management model

### Repository Pattern
- `DashboardRepo`: Handles all Supabase operations
- CRUD operations for products, orders, and users
- Statistics and access control methods

### State Management
- `DashboardCubit`: BLoC pattern implementation
- `DashboardState`: State classes for different UI states
- Proper error handling and loading states

### UI Components
- `DashboardView`: Main dashboard view with navigation
- `DashboardOverview`: Statistics and overview section
- `ProductsSection`: Products management interface
- `OrdersSection`: Orders management interface
- `UsersSection`: Users management interface

## Navigation

The dashboard uses a bottom navigation bar with four sections:
1. **Overview**: Dashboard statistics and quick actions
2. **Products**: Product management
3. **Orders**: Order management
4. **Users**: User management

## Supabase Integration

All data operations are performed through Supabase:
- Products table: `products`
- Orders table: `orders` with related `order_items`
- Users table: `users`
- Role-based access control using user roles

## Usage

To access the dashboard, navigate to `/dashboard` route. The system will automatically check user permissions and redirect unauthorized users to the home page.

## Dependencies

- `flutter_bloc`: State management
- `supabase_flutter`: Backend operations
- `hive`: Local data storage
- `go_router`: Navigation
- `top_snackbar_flutter`: User notifications

## Security

- Role-based access control
- Input validation for all forms
- Confirmation dialogs for destructive actions
- Proper error handling and user feedback 