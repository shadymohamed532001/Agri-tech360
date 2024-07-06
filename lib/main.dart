import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:smartsoil/app.dart';
import 'package:smartsoil/bloc_observer.dart.dart';
import 'package:smartsoil/core/helper/fuctions_helper.dart';
import 'package:smartsoil/core/helper/helper_const.dart';
import 'package:smartsoil/core/helper/local_notification_services.dart';
import 'package:smartsoil/core/networking/api_services.dart';
import 'package:smartsoil/core/helper/local_services.dart';
import 'package:smartsoil/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  Stripe.publishableKey = ApiKeys.stripePublishableKey;
  await LocalNotificationService.init();
  Bloc.observer = MyBlocObserver();
  ApiServices.init();
  await LocalServices.init();
  ServiceLocator().setUpServiceLocator();
  fetchDataFromLocalStorage();
  runApp(const MyApp());
}
// Natria 706230A Insecticidal 
// NSECT KILLER: Kills Aphids, Mealybugs, Mites, Whiteflies, and more FAST ACTING: Kills listed insects in minutes! Effective against adult, larvae, and nymph stages of pests EASY TO USE: Ready-to-Use bottle makes application easy USE ON: For indoor or outdoor use on roses, flowers, fruits, vegetables, and even houseplants
// 9 
// apple  

// wheat
// cotton