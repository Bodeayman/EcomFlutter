import 'package:ecomflutter/Features/DashboardPage/Data/Models/dashboard_user.dart';
import 'package:ecomflutter/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Manager/dashboard_cubit.dart';
import '../../Manager/dashboard_state.dart';

class UsersSection extends StatefulWidget {
  const UsersSection({super.key});

  @override
  State<UsersSection> createState() => _UsersSectionState();
}

class _UsersSectionState extends State<UsersSection> {
  @override
  void initState() {
    super.initState();
    context.read<DashboardCubit>().loadUsers();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      buildWhen: (previous, current) {
        // Only rebuild for users-related states
        return current is UsersLoading ||
            current is UsersLoaded ||
            current is UserOperationSuccess ||
            current is DashboardError;
      },
      builder: (context, state) {
        if (state is UsersLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is UsersLoaded) {
          return Column(
            children: [
              _buildHeader(context),
              Expanded(
                child:
                    state.users.isEmpty
                        ? const Center(child: Text('No users found'))
                        : _buildUsersList(context, state.users),
              ),
            ],
          );
        }
        if (state is UserOperationSuccess) {
          return Column(
            children: [
              _buildHeader(context),
              Expanded(
                child:
                    state.users.isEmpty
                        ? const Center(child: Text('No users found'))
                        : _buildUsersList(context, state.users),
              ),
            ],
          );
        }

        return const Center(child: Text('No data available'));
      },
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: const Row(
        children: [
          Text(
            'Users Management',
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

  Widget _buildUsersList(BuildContext context, List<DashboardUser> users) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        return _buildUserCard(context, user);
      },
    );
  }

  Widget _buildUserCard(BuildContext context, DashboardUser user) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12.0),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        user.email,
                        style: TextStyle(color: Colors.grey[600], fontSize: 14),
                      ),
                    ],
                  ),
                ),
                PopupMenuButton<String>(
                  onSelected: (value) {
                    switch (value) {
                      case 'change_role':
                        _showChangeRoleDialog(context, user);
                        break;
                      case 'delete':
                        _showDeleteConfirmation(context, user);
                        break;
                    }
                  },
                  itemBuilder:
                      (context) => [
                        const PopupMenuItem(
                          value: 'change_role',
                          child: Row(
                            children: [
                              Icon(Icons.admin_panel_settings, size: 20),
                              SizedBox(width: 8),
                              Text('Change Role'),
                            ],
                          ),
                        ),
                        const PopupMenuItem(
                          value: 'delete',
                          child: Row(
                            children: [
                              Icon(Icons.delete, size: 20, color: Colors.red),
                              SizedBox(width: 8),
                              Text(
                                'Delete',
                                style: TextStyle(color: Colors.red),
                              ),
                            ],
                          ),
                        ),
                      ],
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildInfoChip(
                  'Role',
                  _getRoleLabel(user.role),
                  _getRoleColor(user.role),
                ),
              ],
            ),
          ],
        ),
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
              fontSize: 14,
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  String _getRoleLabel(String role) {
    switch (role) {
      case 'dashboard':
        return 'Admin';
      case 'admin':
        return 'Admin';
      case 'user':
        return 'User';
      default:
        return role;
    }
  }

  Color _getRoleColor(String role) {
    switch (role) {
      case 'dashboard':
        return Colors.purple;
      case 'admin':
        return Colors.blue;
      case 'user':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  void _showChangeRoleDialog(BuildContext context, DashboardUser user) {
    String selectedRole = user.role;

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Change User Role'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Change role for ${user.name}'),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: selectedRole,
                  decoration: const InputDecoration(
                    labelText: 'Role',
                    border: OutlineInputBorder(),
                  ),
                  items: const [
                    DropdownMenuItem(value: 'user', child: Text('User')),
                    DropdownMenuItem(value: 'admin', child: Text('Admin')),
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      selectedRole = value;
                    }
                  },
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  if (selectedRole != user.role) {
                    context.read<DashboardCubit>().updateUserRole(
                      user.authId,
                      selectedRole,
                    );
                  }
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(backgroundColor: appbarSec),
                child: const Text('Update Role'),
              ),
            ],
          ),
    );
  }

  void _showDeleteConfirmation(BuildContext context, DashboardUser user) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Delete User'),
            content: Text(
              'Are you sure you want to delete "${user.name}"?\n\nThis action cannot be undone.',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<DashboardCubit>().deleteUser(user.authId);
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text('Delete'),
              ),
            ],
          ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
