import 'package:fast_fruit/src/product/interactor/models/product_variant_model.dart';

class ProductModel {
  final String id;
  final String name;
  final List<ProductVariantModel> variants;

  ProductModel({
    required this.id,
    required this.name,
    required this.variants,
  });
}
