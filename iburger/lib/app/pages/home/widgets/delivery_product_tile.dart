import 'package:flutter/material.dart';
import 'package:iburger/app/core/extensions/formatter_extension.dart';
import 'package:iburger/app/core/ui/styles/colors_app.dart';
import 'package:iburger/app/core/ui/styles/text_styles.dart';
import 'package:iburger/app/models/product_model.dart';

class DeliveryProductTile extends StatelessWidget {
  final ProductModel product;
  const DeliveryProductTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // Like GestureDetector
      onTap: () async {
        await Navigator.of(context).pushNamed(
          '/productDetail',
          arguments: {'product': product},
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Hero(
                      tag: '${product.id}${product.name}',
                      child: Material(
                        color: context.colors.whiteColor,
                        child: Text(
                          product.name,
                          style: context.textStyles.textExtraBold
                              .copyWith(fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Hero(
                      tag: '${product.id}${product.description}',
                      child: Material(
                        color: context.colors.whiteColor,
                        child: Text(
                          product.description,
                          style: context.textStyles.textRegular
                              .copyWith(fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    product.price.currencyPTBR,
                    style: context.textStyles.textMedium.copyWith(
                      fontSize: 14,
                      color: context.colors.secondary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Hero(
              tag: product.id,
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/images/loading.gif',
                image: product.image,
                height: 100,
                width: 100,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
