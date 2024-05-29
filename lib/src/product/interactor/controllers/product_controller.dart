import 'package:fast_fruit/src/product/interactor/services/product_service.dart';
import 'package:fast_fruit/src/product/interactor/state/product_state.dart';
import 'package:flutter/material.dart';

class ProductController extends ChangeNotifier {
  final ProductService service;

  var _state = ProductState.start();
  ProductState get state => _state;

  ProductController(this.service);

  Future<void> fetchProducts() async {
    _state = state.setLoading();
    notifyListeners();

    _state = await service.fetchProducts(state);
    notifyListeners();
  }
}
