import 'package:dog_test/src/app.dart';
import 'package:flutter/material.dart';

import 'global.dart';

Future<void> main() async {
  await Global.init();
  runApp(const MyApp());
}

