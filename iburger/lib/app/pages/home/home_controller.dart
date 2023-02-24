import 'package:bloc/bloc.dart';
import 'package:iburger/app/pages/home/home_state.dart';
import 'package:iburger/app/repository/products/products_repository.dart';

class HomeController extends Cubit<HomeState> {
  final ProductsRepository _productsRepository;

  HomeController(this._productsRepository) : super(const HomeState.initial());

  Future<void> loadProducts() async {
    try {
      final products = await _productsRepository.findAllProducts();
      state.copyWith(status: HomeStateStatus.loaded, products: products);
    } catch (e) {}
  }
}
