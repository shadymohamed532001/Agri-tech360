import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartsoil/Feature/auth/logic/login_cubite/login_cubit.dart';
import 'package:smartsoil/Feature/auth/logic/sign_up_cubite/sign_up_cubit.dart';
import 'package:smartsoil/Feature/auth/presentation/widgets/views/auth_view_body.dart';
import 'package:smartsoil/Feature/details/view/product_details_view.dart';
import 'package:smartsoil/Feature/details/view/review_and_rating_view_body.dart';
import 'package:smartsoil/Feature/plantClassifiction/logic/cubit/plant_classfiction_cubit.dart';
import 'package:smartsoil/Feature/plantClassifiction/presentation/views/plant_classsfiction_view.dart';
import 'package:smartsoil/Feature/details/view/plant_details_view.dart';
import 'package:smartsoil/Feature/home/presentation/views/recentaly_see_all_view.dart';
import 'package:smartsoil/Feature/layout/logic/cubit/layout_cubit.dart';
import 'package:smartsoil/Feature/layout/presentation/views/layout_views.dart';
import 'package:smartsoil/Feature/onbording/logic/cubit/onbording_cubit.dart';
import 'package:smartsoil/Feature/onbording/presentation/on_boarding_view.dart';
import 'package:smartsoil/Feature/search/presentation/search_view.dart';
import 'package:smartsoil/core/Di/service_locator.dart';
import 'package:smartsoil/core/helper/helper_const.dart';
import 'package:smartsoil/core/models/planr_model_class.dart';
import 'package:smartsoil/core/models/product_model_classs.dart';
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
            ),
          );
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

      case Routes.plantDetailsViewRoute:
        final args = routeSettings.arguments as PlantModelClass;
        return MaterialPageRoute(
          builder: (context) => PlantDetailsView(
            plant: args.plantModle,
          ),
        ); // save the product model later
      case Routes.traidmentProductDetailsViewRoute:
        final args = routeSettings.arguments as ProductModelClass;
        return MaterialPageRoute(
          builder: (context) => ProductDetailsView(
            productModel: args.productModel, // later
          ),
        );
      case Routes.plantCareViewRoute:
        return MaterialPageRoute(builder: (context) {
          return BlocProvider(
            create: (context) => serviceLocator.get<PlantClassfictionCubite>(),
            child: const PlantCareView(),
          );
        });

      case Routes.ratingAndReviewBodyRoute:
        return MaterialPageRoute(builder: (context) {
          return const RatingAndReviewBody();
        });

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
