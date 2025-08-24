import 'package:ecomflutter/Features/ProductsPage/Presentation/Manager/main_products_cubit.dart';
import 'package:ecomflutter/Features/DetailsPage/details.dart';
import 'package:ecomflutter/utils/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class NewItemsWidget extends StatelessWidget {
  const NewItemsWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainProductsCubit, MainProductsState>(
      builder: (context, state) {
        if (state is MainProductsLoading) {
          return SizedBox(
            height: 282,
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (state is MainProductsFailure) {
          return Center(child: Text(state.errMessage));
        } else if (state is MainProductsSuccess) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              height: 282,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemCount: state.data.length < 5 ? state.data.length : 5,

                itemBuilder: (BuildContext context, int index) {
                  final item = state.data[index];
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(4, 4, 12, 4),
                    child: ProductCard(item: item),
                  );
                },
              ),
            ),
          );
        } else {
          return Center(child: Text("Try restart the program"));
        }
      },
    );
  }
}
