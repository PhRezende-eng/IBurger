// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:iburger/app/core/ui/widgets/delivery_button.dart';
import 'package:iburger/app/models/product_model.dart';
import 'package:iburger/app/pages/home/widgets/delivery_product_tile.dart';

// Just Used as Example to diff ListView with spread operator
ListView? _diffListViewCreationWithColumn(
    String opt, List<ProductModel> products) {
  if (opt == 'LsitView.builder') {
    //
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        var product = products[index];
        return DeliveryProductTile(
          key: ObjectKey(product.id),
          product: product,
        );
      },
    );
    //
  } else if (opt == 'ListView') {
    //
    return ListView(
      children: products
          .map(
            (product) => DeliveryProductTile(
              key: ObjectKey(product.id),
              product: product,
            ),
          )
          .toList(),
    );
    //
  } else if (opt ==
      'ListView with Column by spread operator into children and button at end List') {
    //
    // Spread operator, inserting/spreading elements into a collection
    // I could be map the products directly by children, removindo the list...
    return ListView(
      children: [
        ...products.map(
          (product) => DeliveryProductTile(
            key: ObjectKey(product.id),
            product: product,
          ),
        ),
        DeliveryButton(
          onPressed: () {},
          child: const Text("Limpar Carrinho"),
        )
      ],
    );
    //
  }
  return null;
}
