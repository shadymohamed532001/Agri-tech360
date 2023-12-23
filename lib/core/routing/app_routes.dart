import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartsoil/Feature/auth/logic/login_cubite/login_cubit.dart';
import 'package:smartsoil/Feature/auth/logic/sign_up_cubite/sign_up_cubit.dart';
import 'package:smartsoil/Feature/auth/presentation/auth_view_body.dart';
import 'package:smartsoil/Feature/explor/presentation/explor_plant_details_view.dart';
import 'package:smartsoil/Feature/helper_view/logic/helper_view_cubite.dart';
import 'package:smartsoil/Feature/helper_view/presentation/helper_view.dart';
import 'package:smartsoil/Feature/home/presentation/home_view.dart';
import 'package:smartsoil/Feature/onbording/logic/cubit/onbording_cubit.dart';
import 'package:smartsoil/Feature/onbording/presentation/on_boarding_view.dart';
import 'package:smartsoil/core/Di/service_locator.dart';
import 'package:smartsoil/core/routing/routes.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';

class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => serviceLocator.get<OnbordingCubit>(),
                  child: const OnBordingView(),
                ));

      case Routes.authViewRoute:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => serviceLocator.get<LoginCubit>(),
              ),
              BlocProvider(
                create: (context) => serviceLocator.get<SignUpCubit>(),
              ),
            ],
            child: const AuthViewBody(),
          ),
        );

      case Routes.helperViewRoute:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => serviceLocator.get<HelperViewCubit>(),
                  child: const HelperView(),
                ));

      case Routes.homeViewRoute:
        return MaterialPageRoute(builder: (context) => const HomeView());
      case Routes.explorPlantDetailsViewRoute:
        return MaterialPageRoute(
            builder: (context) => const ExplorPlantDetailsView());

      default:
        return _unFoundRoute();
    }
  }

  static Route<dynamic> _unFoundRoute() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        body: Center(
          child: Text(
            'Not Found this Route',
            style: AppStyle.font14Blacksemibold,
          ),
        ),
      ),
    );
  }
}
