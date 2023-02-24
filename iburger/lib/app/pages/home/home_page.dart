import 'package:flutter/material.dart';
import 'package:iburger/app/core/ui/helpers/loader.dart';
import 'package:iburger/app/core/ui/helpers/messages.dart';
import 'package:iburger/app/core/ui/widgets/delivery_appbar.dart';
import 'package:iburger/app/models/product_model.dart';
import 'package:iburger/app/pages/home/widgets/delivery_product_tile.dart';

final product = ProductModel(
  id: 0,
  description: 'Description',
  image:
      'http://www.saboresajinomoto.com.br/uploads/images/recipes/sanduiche-de-churrasco.jpg',
  name: 'Product name',
  price: 5,
);

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with Loader, Messages {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          showLoader('Carregando produtos');
          await Future.delayed(const Duration(seconds: 3));
          hideLoader();
          showError('Error ...');
          await Future.delayed(const Duration(seconds: 2));
          showSuccess('Sucesso ...');
          await Future.delayed(const Duration(seconds: 2));
          showInfo('Aviso ...');
        },
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) => Column(
                children: [
                  DeliveryProductTile(
                    key: ObjectKey(product.id),
                    product: product,
                  ),
                  const Divider()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
