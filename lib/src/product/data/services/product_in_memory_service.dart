import 'package:fast_fruit/src/product/interactor/models/product_model.dart';
import 'package:fast_fruit/src/product/interactor/models/product_variant_model.dart';
import 'package:fast_fruit/src/product/interactor/services/product_service.dart';
import 'package:fast_fruit/src/product/interactor/state/product_state.dart';

class ProductServiceImpl implements ProductService {
  List<ProductModel> products = [];

  ProductServiceImpl() {
    products = [
      ProductModel(
        id: '1',
        name: 'Alface',
        variants: [
          ProductVariantModel(id: '11', name: 'Alface Roxo', price: 10.80),
          ProductVariantModel(id: '12', name: 'Alface Verde', price: 11.80),
        ],
      ),
    ];
  }

  @override
  Future<ProductState> fetchProducts(ProductState state) async {
    await Future.delayed(const Duration(seconds: 2));
    return state.setProducts(products);
  }
}
