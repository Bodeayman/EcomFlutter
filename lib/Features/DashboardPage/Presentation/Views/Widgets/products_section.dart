import 'package:ecomflutter/Features/DashboardPage/Data/Models/dashboard_product.dart';
import 'package:ecomflutter/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Manager/dashboard_cubit.dart';
import '../../Manager/dashboard_state.dart';

class ProductsSection extends StatefulWidget {
  const ProductsSection({super.key});

  @override
  State<ProductsSection> createState() => _ProductsSectionState();
}

class _ProductsSectionState extends State<ProductsSection> {
  @override
  void initState() {
    super.initState();
    context.read<DashboardCubit>().loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      buildWhen: (previous, current) {
        // Only rebuild for products-related states
        return current is ProductsLoading || 
               current is ProductsLoaded || 
               current is ProductOperationSuccess ||
               current is DashboardError;
      },
      builder: (context, state) {
        if (state is ProductsLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is ProductsLoaded) {
          return Column(
            children: [
              _buildHeader(context),
              Expanded(
                child:
                    state.products.isEmpty
                        ? const Center(child: Text('No products found'))
                        : _buildProductsList(context, state.products),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Products Management',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: appbarSec,
            ),
          ),
          ElevatedButton.icon(
            onPressed: () => _showAddProductDialog(context),
            icon: const Icon(Icons.add),
            label: const Text('Add Product'),
            style: ElevatedButton.styleFrom(
              backgroundColor: appbarSec,
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductsList(
    BuildContext context,
    List<DashboardProduct> products,
  ) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return _buildProductCard(context, product);
      },
    );
  }

  Widget _buildProductCard(BuildContext context, DashboardProduct product) {
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
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        product.description,
                        style: TextStyle(color: Colors.grey[600], fontSize: 14),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                PopupMenuButton<String>(
                  onSelected: (value) {
                    switch (value) {
                      case 'edit':
                        _showEditProductDialog(context, product);
                        break;
                      case 'delete':
                        _showDeleteConfirmation(context, product);
                        break;
                    }
                  },
                  itemBuilder:
                      (context) => [
                        const PopupMenuItem(
                          value: 'edit',
                          child: Row(
                            children: [
                              Icon(Icons.edit, size: 20),
                              SizedBox(width: 8),
                              Text('Edit'),
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
                  'Price',
                  '\$${product.price.toStringAsFixed(2)}',
                  Colors.green,
                ),
                _buildInfoChip(
                  'Quantity',
                  product.quantity.toString(),
                  product.quantity == 0 ? Colors.red : Colors.blue,
                ),
                _buildInfoChip('Category', product.cat, Colors.orange),
              ],
            ),
            if (product.quantity == 0) ...[
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => _showRestockDialog(context, product),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Restock Product'),
                ),
              ),
            ],
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

  void _showAddProductDialog(BuildContext context) {
    final nameController = TextEditingController();
    final descriptionController = TextEditingController();
    final priceController = TextEditingController();
    final quantityController = TextEditingController();
    final categoryController = TextEditingController();

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Add New Product'),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelText: 'Product Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: descriptionController,
                    decoration: const InputDecoration(
                      labelText: 'Description',
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 3,
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: priceController,
                    decoration: const InputDecoration(
                      labelText: 'Price',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: quantityController,
                    decoration: const InputDecoration(
                      labelText: 'Quantity',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: categoryController,
                    decoration: const InputDecoration(
                      labelText: 'Category',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  if (nameController.text.isNotEmpty &&
                      priceController.text.isNotEmpty &&
                      quantityController.text.isNotEmpty) {
                    final product = DashboardProduct(
                      id: 0, // Will be set by the database
                      name: nameController.text,
                      description: descriptionController.text,
                      price: double.tryParse(priceController.text) ?? 0.0,
                      quantity: int.tryParse(quantityController.text) ?? 0,
                      cat: categoryController.text,
                      location: 'Default Location', // Set a default location
                      url: "",
                    );
                    context.read<DashboardCubit>().createProduct(product);
                    Navigator.pop(context);
                  }
                },
                style: ElevatedButton.styleFrom(backgroundColor: appbarSec),
                child: const Text('Add Product'),
              ),
            ],
          ),
    );
  }

  void _showEditProductDialog(BuildContext context, DashboardProduct product) {
    final nameController = TextEditingController(text: product.name);
    final descriptionController = TextEditingController(
      text: product.description,
    );
    final priceController = TextEditingController(
      text: product.price.toString(),
    );
    final quantityController = TextEditingController(
      text: product.quantity.toString(),
    );
    final categoryController = TextEditingController(text: product.cat);

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Edit Product'),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelText: 'Product Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: descriptionController,
                    decoration: const InputDecoration(
                      labelText: 'Description',
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 3,
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: priceController,
                    decoration: const InputDecoration(
                      labelText: 'Price',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: quantityController,
                    decoration: const InputDecoration(
                      labelText: 'Quantity',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: categoryController,
                    decoration: const InputDecoration(
                      labelText: 'Category',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  if (nameController.text.isNotEmpty &&
                      priceController.text.isNotEmpty &&
                      quantityController.text.isNotEmpty) {
                    final updatedProduct = DashboardProduct(
                      id: product.id,
                      name: nameController.text,
                      description: descriptionController.text,
                      price: double.tryParse(priceController.text) ?? 0.0,
                      quantity: int.tryParse(quantityController.text) ?? 0,
                      cat: categoryController.text,
                      url: "",
                      location: "Default Location",
                    );
                    context.read<DashboardCubit>().updateProduct(
                      updatedProduct,
                    );
                    Navigator.pop(context);
                  }
                },
                style: ElevatedButton.styleFrom(backgroundColor: appbarSec),
                child: const Text('Update Product'),
              ),
            ],
          ),
    );
  }

  void _showRestockDialog(BuildContext context, DashboardProduct product) {
    final quantityController = TextEditingController();

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Restock Product'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Add quantity for ${product.name}'),
                const SizedBox(height: 16),
                TextField(
                  controller: quantityController,
                  decoration: const InputDecoration(
                    labelText: 'Quantity to Add',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
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
                  final quantityToAdd = int.tryParse(quantityController.text);
                  if (quantityToAdd != null && quantityToAdd > 0) {
                    final updatedProduct = DashboardProduct(
                      id: product.id,
                      name: product.name,
                      description: product.description,
                      price: product.price,
                      quantity: product.quantity + quantityToAdd,
                      cat: product.cat,
                      url: product.url,
                      location: product.location,
                    );
                    context.read<DashboardCubit>().updateProduct(
                      updatedProduct,
                    );
                    Navigator.pop(context);
                  }
                },
                style: ElevatedButton.styleFrom(backgroundColor: appbarSec),
                child: const Text('Restock'),
              ),
            ],
          ),
    );
  }

  void _showDeleteConfirmation(BuildContext context, DashboardProduct product) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Delete Product'),
            content: Text('Are you sure you want to delete "${product.name}"?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<DashboardCubit>().deleteProduct(product.id);
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text('Delete'),
              ),
            ],
          ),
    );
  }
}
