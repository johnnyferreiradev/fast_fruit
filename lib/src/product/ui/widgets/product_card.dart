import 'package:fast_fruit/src/product/domain/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final ProductModel model;
  final void Function()? onTap;

  const ProductCard({
    super.key,
    required this.model,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 7,
        child: Column(
          children: [
            Container(
              height: 45,
              width: double.infinity,
              padding: const EdgeInsets.only(bottom: 2, left: 8, right: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(model.variants.length.toString()),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
