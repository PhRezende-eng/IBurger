import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:iburger/app/dto/order_product_dto.dart';
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

  void addOrUpdateBag(OrderProductDto orderProductDto) {
    final shoppingBag = [...state.shoppingBag];
    final orderIndex = shoppingBag
        .indexWhere((order) => order.product == orderProductDto.product);

    if (orderIndex > -1) {
      if (orderProductDto.amount == 0) {
        shoppingBag.removeAt(orderIndex);
      } else {
        shoppingBag[orderIndex] = orderProductDto;
      }
    } else {
      shoppingBag.add(orderProductDto);
    }

    emit(state.copyWith(shoppingBag: shoppingBag));
  }
}
