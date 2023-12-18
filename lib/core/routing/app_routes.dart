
import 'package:flutter/material.dart';
import 'package:smartsoil/Feature/splash/splash_view.dart';
import 'package:smartsoil/core/routing/routes.dart';

class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (context) => const SplashView());
      // case Routes.loginViewRoute:
      //   return MaterialPageRoute(builder: (context) => const LoginView());
      // case Routes.signupViewRoute:
      //   return MaterialPageRoute(builder: (context) => const SignUpView());

      // case Routes.authViewRoute:
      //   return MaterialPageRoute(
      //       builder: (context) => MultiBlocProvider(providers: [
      //             BlocProvider(
      //               create: (context) => serviceLocator.get<LoginCubit>(),
      //             ),
      //             BlocProvider(
      //               create: (context) => RegisterCubit(),
      //             ),
      //           ], child: const AuthViewBody()));
      // case Routes.homeViewRoute:
      //   return MaterialPageRoute(builder: (context) => const HomeView());

      default:
        return _unFoundRoute();
    }
  }

  static Route<dynamic> _unFoundRoute() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(
          child: Text(
            'Not Found this Route',
           style:TextStyle(
            color: Colors.black,
            fontSize: 22
           )
          ),
        ),
      ),
    );
  }
}