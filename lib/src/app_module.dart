import 'package:fast_fruit/src/core/core_module.dart';
import 'package:fast_fruit/src/product/product_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [CoreModule(), ProductModule()];

  @override
  void binds(i) {}

  @override
  void routes(RouteManager r) {
    r.module('/', module: ProductModule());
    r.module('/product', module: ProductModule());
  }
}
