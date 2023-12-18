// import 'package:bag/Feature/OnBordingView/data/repositories/onbording_repo_impl.dart';
// import 'package:dio/dio.dart';
// import 'package:shared_preferences/shared_preferences.dart';

import 'package:get_it/get_it.dart';
import 'package:smartsoil/Feature/auth/data/login/repositories/login_repo.dart';
import 'package:smartsoil/Feature/auth/data/login/repositories/login_repo_impl.dart';
import 'package:smartsoil/Feature/auth/data/sign_up/repositories/sign_up_repo.dart';
import 'package:smartsoil/Feature/auth/data/sign_up/repositories/sign_up_repo_impl.dart';
import 'package:smartsoil/Feature/auth/logic/login_cubite/login_cubit.dart';
import 'package:smartsoil/Feature/auth/logic/sign_up_cubite/sign_up_cubit.dart';
import 'package:smartsoil/Feature/onbording/data/repositories/onbording_repo.dart';
import 'package:smartsoil/Feature/onbording/data/repositories/onbording_repo_impl.dart';
import 'package:smartsoil/Feature/onbording/logic/cubit/onbording_cubit.dart';

final GetIt serviceLocator = GetIt.instance;

class ServiceLocator {
  Future<void> setupServiceLocator() async {
    // await _setupForExternal();

    // _setupForCore();

    _setupForRepos();

    _setupForCubits();
  }

  // Future<void> _setupForExternal() async {
  //   serviceLocator.registerLazySingleton<InternetConnectionChecker>(
  //     () => InternetConnectionChecker(),
  //   );
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   serviceLocator
  //       .registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  //   serviceLocator.registerLazySingleton<Dio>(() => Dio());
  // }

  // void _setupForCore() {
  //   // serviceLocator.registerLazySingleton<NetworkInfo>(
  //   //   () => NetworkInfoImpl(
  //   //     connectionChecker: serviceLocator.get<InternetConnectionChecker>(),
  //   //   ),
  //   // );

  //   serviceLocator.registerLazySingleton<CacheHelper>(
  //     () => CacheHelper(serviceLocator<SharedPreferences>()),
  //   );

  //   // serviceLocator.registerLazySingleton<ApiServices>(() => );
  // }

  void _setupForRepos() {
    serviceLocator
        .registerLazySingleton<OnBoardingRepo>(() => OnBoardingRepoImpl());
    serviceLocator.registerLazySingleton<LoginRepo>(() => LoginRepoImpl());
    serviceLocator.registerLazySingleton<SignUpRepo>(() => SignUpRepoImpl());
    // serviceLocator.registerLazySingleton<ForgetPasswordRepo>(
    //     () => ForgetPasswordRepoImpl(dioConsumer: serviceLocator.get()));
    // serviceLocator.registerLazySingleton<SignUpRepo>(
    //     () => SingUpRepoImpl(dioConsumer: serviceLocator.get<DioConsumer>()));
    // serviceLocator.registerLazySingleton<VerificationRepo>(() =>
    //     VerificationRepoImpl(dioConsumer: serviceLocator.get<DioConsumer>()));
  }

  void _setupForCubits() {
    serviceLocator.registerFactory<OnbordingCubit>(
      () =>
          OnbordingCubit(onBoardingRepo: serviceLocator.get<OnBoardingRepo>()),
    );
    serviceLocator.registerFactory<LoginCubit>(
        () => LoginCubit(loginRepo: serviceLocator.get<LoginRepo>()));
    serviceLocator.registerFactory<SignUpCubit>(
        () => SignUpCubit(signUpRepo: serviceLocator.get<SignUpRepo>()));

    // serviceLocator.registerFactory<ForgetPasswordCubit>(() =>
    //     ForgetPasswordCubit(
    //         forgetPasswordRepo: serviceLocator.get<ForgetPasswordRepo>()));

    // serviceLocator.registerFactory<SignUpCubit>(
    //     () => SignUpCubit(registerRepo: serviceLocator.get<SignUpRepo>()));
    // serviceLocator.registerFactory<VerificationCubit>(() => VerificationCubit(
    //     verificationRepo: serviceLocator.get<VerificationRepo>()));
  }
}
