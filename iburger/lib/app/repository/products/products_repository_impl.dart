import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:iburger/app/core/exception/repository_exception.dart';
import 'package:iburger/app/core/rest_client/custom_dio.dart';
import 'package:iburger/app/models/product_model.dart';
import 'package:iburger/app/repository/products/products_repository.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  CustomDio dio;
  ProductsRepositoryImpl(this.dio);

  @override
  Future<List<ProductModel>> loadProducts() async {
    try {
      final response = await dio.unAuth().get('/products');
      final responseData = response.data;
      List<ProductModel> listProducts = [];

      for (var product in responseData) {
        listProducts.add(ProductModel.fromMap(product));
      }

      return listProducts;
    } on DioError catch (e, s) {
      const errorMessage = 'Erro ao buscar produtos';
      log(errorMessage, error: errorMessage, stackTrace: s);
      throw RepositoryException(message: errorMessage);
    }
  }
}
