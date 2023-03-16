import 'package:equatable/equatable.dart';
import 'package:iburger/app/dto/order_product_dto.dart';
import 'package:iburger/app/models/product_model.dart';
import 'package:match/match.dart';

part 'home_state.g.dart';

@match
enum HomeStateStatus {
  initial,
  loading,
  loaded,
  error,
}

class HomeState extends Equatable {
  final HomeStateStatus status;
  final List<ProductModel> products;
  //TODO: Could be change bellow type to MAP<String, OrderProductDto>, it will make query as O(1) which order transfer for next page (product_tile)
  final List<OrderProductDto> shoppingBag;
  final String? errorMessage;

  const HomeState({
    required this.status,
    required this.products,
    required this.shoppingBag,
    this.errorMessage,
  });

  const HomeState.initial()
      : status = HomeStateStatus.initial,
        products = const [],
        shoppingBag = const [],
        errorMessage = null;

  @override
  List<Object?> get props => [status, products, errorMessage];

  //design partern prototype
  HomeState copyWith({
    HomeStateStatus? status,
    List<ProductModel>? products,
    List<OrderProductDto>? shoppingBag,
    String? errorMessage,
  }) {
    return HomeState(
      errorMessage: errorMessage ?? this.errorMessage,
      shoppingBag: shoppingBag ?? this.shoppingBag,
      status: status ?? this.status,
      products: products ?? this.products,
    );
  }
}
