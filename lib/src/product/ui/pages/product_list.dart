import 'package:fast_fruit/src/product/interactor/controllers/product_controller.dart';
import 'package:fast_fruit/src/product/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ProductController>();
    final state = controller.state;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Produtos'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: state.products.length,
            itemBuilder: (context, index) {
              final model = state.products[index];
              return ProductCard(
                model: model,
              );
            },
          ),
          if (state.loading)
            const Align(
              alignment: Alignment.topCenter,
              child: LinearProgressIndicator(),
            ),
        ],
      ),
    );
  }
}
