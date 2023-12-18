import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartsoil/core/helper/extentaions.dart';
import 'package:smartsoil/core/routing/routes.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_image_assets.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    // _navigateToHome();
    _navigateToOnBording();

    super.initState();
  }

  @override
  void didChangeDependencies() {
    _setSystemUIOverlayStyle();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManger.backGroundSplahColor,
      child: Stack(
        children: [
          Image.asset(
            ImagesAssetsManger.splashBackGroundShape,
            height: double.infinity,
          ),
          Center(
            child: Image.asset(
              ImagesAssetsManger.splashLogo,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
        ],
      ),
    );
  }

// make the wifi and power icons disappear when the device start with spash screen
  void _setSystemUIOverlayStyle() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    final double bottomPadding = View.of(context).viewPadding.bottom;

    // Set the color based on the presence of the system navigation bar
    final Color? systemNavigationBarColor =
        bottomPadding > 0 ? null : Colors.transparent;
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: systemNavigationBarColor,
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }

  void _navigateToOnBording() {
    Future.delayed(const Duration(seconds: 1), (() {
      context.pushNamedAndRemoveUntil(
        Routes.onBordingViewRoute,
        routePredicate: (route) => false,
      );
    }));
  }
  // void _navigateToHome() {
  //   Future.delayed(const Duration(seconds: 2), (() {
  //     if (onBording != null) {
  //       if (token != null) {
  //         pushAndFinsh(context, pageName: Routes.homeViewRoute);
  //       } else {
  //         pushAndFinsh(context, pageName: Routes.authViewRoute);
  //       }
  //     } else {
  //       pushAndFinsh(context, pageName: Routes.onBoardingViewRoute);
  //     }
  //   }));
  // }
}
