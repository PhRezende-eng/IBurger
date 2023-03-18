// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iburger/app/core/ui/base_state/base_state.dart';
import 'package:iburger/app/core/ui/widgets/delivery_appbar.dart';
import 'package:iburger/app/pages/home/home_controller.dart';
import 'package:iburger/app/pages/home/home_state.dart';
import 'package:iburger/app/pages/home/widgets/delivery_product_tile.dart';
import 'package:iburger/app/pages/home/widgets/shopping_bag_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage, HomeController> {
  @override
  void onReady() {
    controller.loadProducts();
    super.onReady();
  }

  @override
  Widget build(BuildContext context) {
    //TODO: create reload screen when error state
    return Scaffold(
      appBar: DeliveryAppBar(),
      body: BlocConsumer<HomeController, HomeState>(
        listener: (context, state) => state.status.matchAny(
          any: () => hideLoader(),
          loading: () => showLoader('Carregando produtos'),
          error: () {
            hideLoader();
            showError(state.errorMessage ?? 'Erro não informado');
          },
        ),
        buildWhen: (previousState, state) => state.status.matchAny(
          any: () => false,
          initial: () => true,
          loaded: () => true,
        ),
        builder: (context, state) => Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: state.products.length,
                itemBuilder: (context, index) {
                  final product = state.products[index];
                  final orders = state.shoppingBag.where(
                    (order) => order.product == product,
                  );

                  return Column(
                    children: [
                      DeliveryProductTile(
                        key: ObjectKey(product.id),
                        product: product,
                        orderProduct: orders.isNotEmpty ? orders.first : null,
                      ),
                      const Divider(),
                    ],
                  );
                },
              ),
            ),
            Visibility(
              visible: state.shoppingBag.isNotEmpty,
              child: ShoppingBagWidget(bag: state.shoppingBag),
            ),
          ],
        ),
      ),
    );
  }
}
