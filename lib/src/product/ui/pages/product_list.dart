import 'dart:async';

import 'package:fast_fruit/src/product/domain/controllers/product_controller.dart';
import 'package:fast_fruit/src/product/domain/state/product_state.dart';
import 'package:fast_fruit/src/product/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  Timer? _debounce;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<ProductController>().fetchProducts();
    });
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    context.read<ProductController>();
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    if (_debounce?.isActive ?? false) {
      _debounce?.cancel();
    }
    _debounce = Timer(const Duration(seconds: 1), () {
      final controller = context.read<ProductController>();
      controller.searchProductsByName(_searchController.text);
    });
  }

  Widget _buildBodyContent(ProductState state) {
    if (state.loading) {
      return const Align(
        alignment: Alignment.topCenter,
        child: LinearProgressIndicator(),
      );
    }

    if (!state.loading && state.products.isEmpty) {
      return const Center(
        child: Text('Não há produtos.'),
      );
    }

    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: state.products.length,
      itemBuilder: (context, index) {
        final model = state.products[index];
        return ProductCard(
          model: model,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ProductController>();
    final state = controller.state;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Produtos'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_back),
                    )
                  ],
                ),
                const SizedBox(height: 10.0),
                const Text(
                  'Vegetais',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10.0),
                TextField(
                  controller: _searchController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Buscar...',
                    prefixIcon: Icon(Icons.search),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: _buildBodyContent(state),
          ),
        ],
      ),
    );
  }
}
