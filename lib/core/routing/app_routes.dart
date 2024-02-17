import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartsoil/Feature/auth/logic/login_cubite/login_cubit.dart';
import 'package:smartsoil/Feature/auth/logic/sign_up_cubite/sign_up_cubit.dart';
import 'package:smartsoil/Feature/auth/presentation/widgets/views/auth_view_body.dart';
import 'package:smartsoil/Feature/checkplant/presentation/check_plant_vie.dart';
import 'package:smartsoil/Feature/details/view/details_view.dart';
import 'package:smartsoil/Feature/home/presentation/views/recentaly_see_all_view.dart';
import 'package:smartsoil/Feature/layout/logic/cubit/layout_cubit.dart';
import 'package:smartsoil/Feature/layout/presentation/views/layout_views.dart';
import 'package:smartsoil/Feature/onbording/logic/cubit/onbording_cubit.dart';
import 'package:smartsoil/Feature/onbording/presentation/on_boarding_view.dart';
import 'package:smartsoil/Feature/search/presentation/search_view.dart';
import 'package:smartsoil/core/Di/service_locator.dart';
import 'package:smartsoil/core/helper/helper_const.dart';
import 'package:smartsoil/core/models/planr_model_class.dart';
import 'package:smartsoil/core/routing/routes.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';

class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        if (onBording != null) {
          if (usertoken != null) {
            return MaterialPageRoute(
              builder: (context) => BlocProvider(
                create: (context) => serviceLocator.get<LayoutCubit>(),
                child: const LayOutViews(),
              ),
            );
          } else {
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
          }
        } else {
          return MaterialPageRoute(
              builder: (context) => BlocProvider(
                    create: (context) => serviceLocator.get<OnbordingCubit>(),
                    child: const OnBordingView(),
                  ));
        }

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

      case Routes.layOutViewsRoute:
        return MaterialPageRoute(
          builder: (context) {
            return const LayOutViews();
          },
        );

      case Routes.searchViewRoute:
        return MaterialPageRoute(
          builder: (context) => const SearchView(),
        );

      case Routes.recentlySeeAllViewViewRoute:
        return MaterialPageRoute(
          builder: (context) => const RecentlySeeAllView(),
        );
      case Routes.detailsViewRoute:
        final args = routeSettings.arguments as PlantModelClass;
        return MaterialPageRoute(
          builder: (context) => DetailsView(
            plant: args.plantModle,
          ),
        );
      // case Routes.homeViewRoute:
      //   return MaterialPageRoute(
      //     builder: (context) => BlocProvider(
      //       create: (context) => serviceLocator.get<HomeCubit>(),
      //       child: const HomeView(),
      //     ),
      //   );
      // case Routes.explorPlantDetailsViewRoute:
      //   return MaterialPageRoute(
      //       builder: (context) => BlocProvider(
      //             create: (context) => serviceLocator.get<ExplorCubit>(),
      //             child: const ExplorPlantDetailsView(),
      //           ));

      // case Routes.informationAboutPlantRoute:
      //   return MaterialPageRoute(
      //       builder: (context) => BlocProvider(
      //             create: (context) => serviceLocator.get<ExplorCubit>(),
      //             child:  InformationAboutPlant(),
      //           ));

      case Routes.checkPlantViewRoute:
        return MaterialPageRoute(builder: (context) => const CheckPlantView());

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
