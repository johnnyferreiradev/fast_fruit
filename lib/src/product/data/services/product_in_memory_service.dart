import 'package:fast_fruit/src/product/domain/models/product_model.dart';
import 'package:fast_fruit/src/product/domain/models/product_variant_model.dart';
import 'package:fast_fruit/src/product/domain/services/product_service.dart';
import 'package:fast_fruit/src/product/domain/state/product_state.dart';

class ProductServiceImpl implements ProductService {
  static final ProductServiceImpl _instance = ProductServiceImpl._internal();

  factory ProductServiceImpl() {
    return _instance;
  }

  ProductServiceImpl._internal() {
    products = storedProducts;
  }

  List<ProductModel> products = [];

  // Simulates the data stored in the database.
  List<ProductModel> storedProducts = [
    ProductModel(
      id: '1',
      name: 'Alface',
      variants: [
        ProductVariantModel(id: '11', name: 'Alface Roxo', price: 10.80),
        ProductVariantModel(id: '12', name: 'Alface Verde', price: 11.80),
      ],
    ),
    ProductModel(
      id: '2',
      name: 'Tomate',
      variants: [
        ProductVariantModel(id: '21', name: 'Tomate Cereja', price: 12.00),
        ProductVariantModel(id: '22', name: 'Tomate Italiano', price: 15.00),
      ],
    ),
    ProductModel(
      id: '3',
      name: 'Cenoura',
      variants: [
        ProductVariantModel(id: '31', name: 'Cenoura Orgânica', price: 9.00),
        ProductVariantModel(
          id: '32',
          name: 'Cenoura Convencional',
          price: 7.00,
        ),
      ],
    ),
    ProductModel(
      id: '4',
      name: 'Batata',
      variants: [
        ProductVariantModel(id: '41', name: 'Batata Doce', price: 8.50),
        ProductVariantModel(id: '42', name: 'Batata Inglesa', price: 6.00),
      ],
    ),
    ProductModel(
      id: '5',
      name: 'Maçã',
      variants: [
        ProductVariantModel(id: '51', name: 'Maçã Gala', price: 5.00),
        ProductVariantModel(id: '52', name: 'Maçã Fuji', price: 6.00),
      ],
    ),
  ];

  @override
  Future<ProductState> fetchProducts(ProductState state) async {
    await Future.delayed(const Duration(seconds: 2));
    return state.setProducts(storedProducts);
  }

  @override
  Future<ProductState> searchProductsByName(
      ProductState state, String search) async {
    await Future.delayed(const Duration(seconds: 2));

    if (search.isEmpty) {
      return state.setProducts(storedProducts);
    }

    List<ProductModel> filteredProducts = products.where((product) {
      return product.name.toLowerCase().contains(search.toLowerCase());
    }).toList();

    return state.setProducts(filteredProducts);
  }
}
