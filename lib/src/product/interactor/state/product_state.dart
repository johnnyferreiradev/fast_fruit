import 'package:fast_fruit/src/product/interactor/exceptions/product_exception.dart';
import 'package:fast_fruit/src/product/interactor/models/product_model.dart';

sealed class ProductState {
  final List<ProductModel> products;
  final bool loading;
  final ProductException? exception;

  ProductState({
    required this.products,
    this.loading = false,
    this.exception,
  });

  factory ProductState.start() => ProductInitialState();

  ProductState setProducts(List<ProductModel> products) {
    return GettedProductState(products: products);
  }

  ProductState setLoading() {
    return ProductLoadingState(products: products);
  }

  ProductState setError(ProductException productException) {
    return ProductFailureState(products: products, exception: productException);
  }
}

class ProductInitialState extends ProductState {
  ProductInitialState() : super(products: const []);
}

class GettedProductState extends ProductState {
  GettedProductState({required super.products});
}

class ProductLoadingState extends ProductState {
  ProductLoadingState({required super.products}) : super(loading: true);
}

class ProductFailureState extends ProductState {
  ProductFailureState({
    required super.products,
    required super.exception,
  }) : super(loading: false);
}
