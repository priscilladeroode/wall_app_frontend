import 'dart:io';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_module.dart';
import 'app_widget.dart';
import 'config/env.dart';

void main() {
  FlavorConfig(
    name: "develop",
    variables: {
      "baseUrl": kIsWeb
          ? EnvConfig.dev
          : Platform.isAndroid
              ? EnvConfig.devAndroid
              : EnvConfig.dev,
    },
  );
  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}
