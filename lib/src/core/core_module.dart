import 'package:fast_fruit/src/core/ui/pages/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CoreModule extends Module {
  @override
  void exportedBinds(Injector i) {}

  @override
  void binds(Injector i) {}

  @override
  void routes(r) {
    r.child('/', child: (context) => const HomePage());
  }
}
