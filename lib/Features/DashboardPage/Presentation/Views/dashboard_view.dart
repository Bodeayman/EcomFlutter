import 'package:ecomflutter/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../Manager/dashboard_cubit.dart';
import '../Manager/dashboard_state.dart';
import '../../Data/Repo/dashboard_repo.dart';
import 'Widgets/dashboard_overview.dart';
import 'Widgets/products_section.dart';
import 'Widgets/orders_section.dart';
import 'Widgets/users_section.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    // Check access when the page loads
    context.read<DashboardCubit>().checkDashboardAccess();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardCubit, DashboardState>(
      listener: (context, state) {
        if (state is AccessDenied) {
          showTopSnackBar(
            Overlay.of(context),
            CustomSnackBar.error(message: state.message),
          );
          // Redirect to home page
          context.go('/home');
        } else if (state is DashboardError) {
          showTopSnackBar(
            Overlay.of(context),
            CustomSnackBar.error(message: state.message),
          );
        } else if (state is ProductOperationSuccess) {
          showTopSnackBar(
            Overlay.of(context),
            CustomSnackBar.success(message: state.message),
          );
        } else if (state is OrderOperationSuccess) {
          showTopSnackBar(
            Overlay.of(context),
            CustomSnackBar.success(message: state.message),
          );
        } else if (state is UserOperationSuccess) {
          showTopSnackBar(
            Overlay.of(context),
            CustomSnackBar.success(message: state.message),
          );
        }
      },
      builder: (context, state) {
        if (state is AccessChecking) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (state is AccessDenied) {
          return const Scaffold(body: Center(child: Text('Access Denied')));
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Admin Dashboard',
              style: TextStyle(color: Colors.black),
            ),
            elevation: 0,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: IndexedStack(
              index: _currentIndex,
              children: [
                DashboardOverview(),
                ProductsSection(),
                OrdersSection(),
                UsersSection(),
              ],
            ),
          ),
          bottomNavigationBar: Theme(
            data: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 5.0,
                  vertical: 10,
                ),
                child: Material(
                  color: Colors.white,
                  elevation: 0,
                  child: BottomNavigationBar(
                    selectedItemColor: appbarSec,
                    unselectedItemColor: Colors.grey.shade600,
                    showUnselectedLabels: false,
                    type: BottomNavigationBarType.fixed,
                    selectedFontSize: 0,
                    elevation: 0,
                    unselectedFontSize: 12,
                    currentIndex: _currentIndex,
                    onTap: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    items: const [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.dashboard),
                        label: "Overview",
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.inventory),
                        label: "Products",
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.shopping_cart),
                        label: "Orders",
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.people),
                        label: "Users",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
