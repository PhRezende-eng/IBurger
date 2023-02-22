import 'package:flutter/material.dart';
import 'package:iburger/app/core/config/env/env.dart';

import 'app/pages/delivery_app.dart';

Future<void> main() async {
  await Env.instance.load;
  runApp(const DeliveryApp());
}
