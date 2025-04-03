import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'main_products_state.dart';

class MainProductsCubit extends Cubit<MainProductsState> {
  MainProductsCubit() : super(MainProductsInitial());
}
