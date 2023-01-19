
import 'package:flutter_modular/flutter_modular.dart';

import 'app_widget.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    // Bind.lazySingleton((i) => AppController()),
  ];

  @override
  final List<ModularRoute> routes = [
        ChildRoute('/', child: (context, args) => HomePage()),
  ];
}