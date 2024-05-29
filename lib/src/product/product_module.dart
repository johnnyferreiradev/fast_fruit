import 'package:fast_fruit/src/product/data/services/product_in_memory_service.dart';
import 'package:fast_fruit/src/product/domain/controllers/product_controller.dart';
import 'package:fast_fruit/src/product/domain/services/product_service.dart';
import 'package:fast_fruit/src/product/ui/pages/product_list.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProductModule extends Module {
  @override
  void exportedBinds(Injector i) {}

  @override
  void binds(Injector i) {
    i.addSingleton<ProductService>(ProductServiceImpl.new);
    i.addSingleton(ProductController.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const ProductList());
  }
}
