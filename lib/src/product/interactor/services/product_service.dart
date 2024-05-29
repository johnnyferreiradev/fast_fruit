import 'package:fast_fruit/src/product/interactor/state/product_state.dart';

abstract class ProductService {
  Future<ProductState> fetchProducts(ProductState state);
}
