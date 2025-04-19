import 'package:bloc/bloc.dart';
import 'package:ecomflutter/constants/endpoints.dart';
import 'package:ecomflutter/model/item.dart';
import 'package:meta/meta.dart';

part 'main_products_state.dart';

class MainProductsCubit extends Cubit<MainProductsState> {
  MainProductsCubit() : super(MainProductsInitial()) {
    loadItems();
  }
  void loadItems() async {
    emit(MainProductsLoading());
    List<Item> items = await addItemsToList("${baseUrl}products");
    if (items.isEmpty) {
      emit(MainProductsFailure("A problem happened, Check your connection"));
    } else {
      emit(MainProductsSuccess(items));
    }
  }
}
