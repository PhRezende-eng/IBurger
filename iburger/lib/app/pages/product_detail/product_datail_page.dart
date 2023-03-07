import 'package:flutter/material.dart';
import 'package:iburger/app/core/ui/styles/text_styles.dart';
import 'package:iburger/app/core/ui/widgets/delivery_appbar.dart';
import 'package:iburger/app/models/product_model.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context)!.settings.arguments as Map;
    ProductModel product = arg['product'];
    return Scaffold(
      appBar: DeliveryAppBar(),
      body: Column(
        children: [
          Hero(
            tag: product.id,
            child: FadeInImage.assetNetwork(
              placeholder: 'assets/images/loading.gif',
              image: product.image,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Hero(
              tag: '${product.id}${product.name}',
              child: Material(
                child: Text(
                  product.name,
                  style:
                      context.textStyles.textExtraBold.copyWith(fontSize: 16),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Hero(
              tag: '${product.id}${product.description}',
              child: Material(
                child: Text(
                  product.description,
                  style: context.textStyles.textRegular.copyWith(fontSize: 14),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
