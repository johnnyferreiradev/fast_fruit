import 'package:fast_fruit/src/product/data/services/product_in_memory_service.dart';
import 'package:fast_fruit/src/product/domain/controllers/product_controller.dart';
import 'package:fast_fruit/src/product/domain/services/product_service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class AppProviders {
  static List<SingleChildWidget> providers = [
    Provider<ProductService>(
      create: (ctx) => ProductServiceImpl(),
    ),
    ChangeNotifierProvider<ProductController>(
      create: (ctx) => ProductController(ctx.read<ProductService>()),
    ),
  ];
}
