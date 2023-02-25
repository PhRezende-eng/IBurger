import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iburger/app/core/ui/helpers/loader.dart';
import 'package:iburger/app/core/ui/helpers/messages.dart';
import 'package:iburger/app/core/ui/widgets/delivery_appbar.dart';
import 'package:iburger/app/models/product_model.dart';
import 'package:iburger/app/pages/home/home_controller.dart';
import 'package:iburger/app/pages/home/home_state.dart';
import 'package:iburger/app/pages/home/widgets/delivery_product_tile.dart';
import 'package:iburger/app/repository/products/products_repository_impl.dart';

// final product = ProductModel(
//   id: 0,
//   description: 'Description',
//   image:
//       'http://www.saboresajinomoto.com.br/uploads/images/recipes/sanduiche-de-churrasco.jpg',
//   name: 'Product name',
//   price: 5,
// );

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with Loader, Messages {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<ProductsRepositoryImpl>().loadProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppBar(),
      body: BlocConsumer<HomeController, HomeState>(
        listener: (context, state) => {},
        builder: (context, state) => Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: state.products.length,
                itemBuilder: (context, index) {
                  var product = state.products[index];
                  return Column(
                    children: [
                      DeliveryProductTile(
                        key: ObjectKey(product.id),
                        product: product,
                      ),
                      const Divider()
                    ],
                  );
                },
              ),
            ),
            // Expanded(
            //   child: ListView(
            //     children: [
            //       // Spread operator, inserting/spreading elements into a collection
            //       // I could be map the products directly by children, removindo the list...
            //       ...state.products.map(
            //         (product) => Column(
            //           children: [
            //             DeliveryProductTile(
            //               key: ObjectKey(product.id),
            //               product: product,
            //             ),
            //             const Divider()
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
