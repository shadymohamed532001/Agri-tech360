import 'package:flutter/material.dart';
import 'package:smartsoil/app.dart';
import 'package:smartsoil/core/Di/service_locator.dart';
import 'package:smartsoil/core/networking/local_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator().setupServiceLocator();
  await LocalServices.init();

  runApp(const MyApp());
}
