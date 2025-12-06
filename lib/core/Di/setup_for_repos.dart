import 'package:smartsoil/Feature/auth/data/login/repositories/login_repo.dart';
import 'package:smartsoil/Feature/auth/data/login/repositories/login_repo_impl.dart';
import 'package:smartsoil/Feature/auth/data/sign_up/repositories/sign_up_repo.dart';
import 'package:smartsoil/Feature/auth/data/sign_up/repositories/sign_up_repo_impl.dart';

import 'package:smartsoil/Feature/onbording/data/repositories/onbording_repo.dart';
import 'package:smartsoil/Feature/onbording/data/repositories/onbording_repo_impl.dart';

import 'package:smartsoil/service_locator.dart';

class SetupForRepos {
  void setupForRepos() {
    serviceLocator
        .registerLazySingleton<OnBoardingRepo>(() => OnBoardingRepoImpl());

    serviceLocator.registerLazySingleton<LoginRepo>(() => LoginRepoImpl());
    serviceLocator.registerLazySingleton<SignUpRepo>(() => SignUpRepoImpl());



  }
}
