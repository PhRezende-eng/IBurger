import 'package:equatable/equatable.dart';
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
  final String? errorMessage;

  const HomeState({
    required this.status,
    required this.products,
    this.errorMessage,
  });

  //could be static?
  const HomeState.initial()
      : status = HomeStateStatus.initial,
        products = const [],
        errorMessage = null;

  @override
  List<Object?> get props => [status, products, errorMessage];

  //design partern prototype
  HomeState copyWith({
    HomeStateStatus? status,
    List<ProductModel>? products,
    String? errorMessage,
  }) {
    return HomeState(
      errorMessage: errorMessage ?? this.errorMessage,
      status: status ?? this.status,
      products: products ?? this.products,
    );
  }
}
