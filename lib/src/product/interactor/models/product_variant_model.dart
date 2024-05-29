class ProductVariantModel {
  final String id;
  final String name;
  final double price;
  final String? unit;

  ProductVariantModel({
    required this.id,
    required this.name,
    required this.price,
    this.unit,
  });
}
