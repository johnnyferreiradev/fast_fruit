import 'package:fast_fruit/src/product/domain/state/product_state.dart';

abstract class ProductService {
  Future<ProductState> fetchProducts(ProductState state);
  Future<ProductState> searchProductsByName(ProductState state, String search);
}
