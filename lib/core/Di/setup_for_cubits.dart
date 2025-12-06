import 'package:smartsoil/Feature/auth/data/login/repositories/login_repo.dart';
import 'package:smartsoil/Feature/auth/data/sign_up/repositories/sign_up_repo.dart';
import 'package:smartsoil/Feature/auth/logic/login_cubite/login_cubit.dart';
import 'package:smartsoil/Feature/auth/logic/sign_up_cubite/sign_up_cubit.dart';

import 'package:smartsoil/Feature/onbording/data/repositories/onbording_repo.dart';
import 'package:smartsoil/Feature/onbording/logic/cubit/onbording_cubit.dart';

import 'package:smartsoil/service_locator.dart';

class SetupForCubits {
  void setUpForCubits() {
    serviceLocator.registerFactory<OnbordingCubit>(
      () =>
          OnbordingCubit(onBoardingRepo: serviceLocator.get<OnBoardingRepo>()),
    );
    serviceLocator.registerFactory<LoginCubit>(
        () => LoginCubit(loginRepo: serviceLocator.get<LoginRepo>()));
    serviceLocator.registerFactory<SignUpCubit>(
        () => SignUpCubit(signUpRepo: serviceLocator.get<SignUpRepo>()));
  }
}
