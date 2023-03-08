// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iburger/app/core/ui/base_state/base_state.dart';
import 'package:iburger/app/core/ui/widgets/delivery_appbar.dart';
import 'package:iburger/app/pages/home/home_controller.dart';
import 'package:iburger/app/pages/home/home_state.dart';
import 'package:iburger/app/pages/home/widgets/delivery_product_tile.dart';

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
              child: ListView(
                children: [
                  // Spread operator, inserting/spreading elements into a collection
                  // I could be map the products directly by children, removindo the list...
                  ...state.products.map(
                    (product) => Column(
                      children: [
                        DeliveryProductTile(
                          key: ObjectKey(product.id),
                          product: product,
                        ),
                        const Divider(),
                      ],
                    ),
                  ),
                  if (state.status == HomeStateStatus.loaded)
                    const Center(child: Text('List Products ends here')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
