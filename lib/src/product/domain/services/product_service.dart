import 'package:fast_fruit/src/product/domain/state/product_state.dart';

abstract class ProductService {
  Future<ProductState> fetchProducts(ProductState state);
}
