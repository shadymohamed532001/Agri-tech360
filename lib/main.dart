import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartsoil/app.dart';
import 'package:smartsoil/bloc_observer.dart.dart';
import 'package:smartsoil/core/Di/service_locator.dart';
import 'package:smartsoil/core/api/api_services.dart';
import 'package:smartsoil/core/networking/local_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator().setupServiceLocator();
  Bloc.observer = MyBlocObserver();
  ApiServices.init();
  await LocalServices.init();
  runApp(const MyApp());
}
