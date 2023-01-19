import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_example/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';


import 'package:flutter/material.dart';

import 'app_widget.dart';

void main(){
  return runApp(ModularApp(module: AppModule(), child: AppWidget()));
}


