import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:iburger/app/pages/home/home_state.dart';
import 'package:iburger/app/repository/products/products_repository.dart';

class HomeController extends Cubit<HomeState> {
  final ProductsRepository _productsRepository;

  HomeController(this._productsRepository) : super(const HomeState.initial());

  Future<void> loadProducts() async {
    emit(state.copyWith(status: HomeStateStatus.loading));
    try {
      final products = await _productsRepository.loadProducts();
      emit(state.copyWith(status: HomeStateStatus.loaded, products: products));
    } catch (e, s) {
      log('Erro ao buscar produtos', error: e, stackTrace: s);
      emit(
        state.copyWith(
          status: HomeStateStatus.error,
          errorMessage: 'Error ao busca produtos',
        ),
      );
    }
  }
}
