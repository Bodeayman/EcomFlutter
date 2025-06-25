import 'package:bloc/bloc.dart';
import 'package:ecomflutter/Features/HomePage/Data/Models/item.dart';
import 'package:ecomflutter/Features/HomePage/Data/Repo/home_repo_impl.dart';
import 'package:meta/meta.dart';

part 'main_products_state.dart';

class MainProductsCubit extends Cubit<MainProductsState> {
  MainProductsCubit() : super(MainProductsInitial()) {
    loadItems();
  }
  void loadItems() async {
    emit(MainProductsLoading());
    var result = await addItemsToList();
    result.fold(
      (failure) => emit(MainProductsFailure(failure)),
      (items) => emit(MainProductsSuccess(items)),
    );
  }
}
