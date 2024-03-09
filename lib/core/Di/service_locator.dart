import 'package:get_it/get_it.dart';
import 'package:smartsoil/Feature/auth/data/login/repositories/login_repo.dart';
import 'package:smartsoil/Feature/auth/data/login/repositories/login_repo_impl.dart';
import 'package:smartsoil/Feature/auth/data/sign_up/repositories/sign_up_repo.dart';
import 'package:smartsoil/Feature/auth/data/sign_up/repositories/sign_up_repo_impl.dart';
import 'package:smartsoil/Feature/auth/logic/login_cubite/login_cubit.dart';
import 'package:smartsoil/Feature/auth/logic/sign_up_cubite/sign_up_cubit.dart';
import 'package:smartsoil/Feature/explor/data/datasources/explor_data_sources.dart';
import 'package:smartsoil/Feature/explor/data/datasources/explor_data_sources_impl.dart';
import 'package:smartsoil/Feature/explor/data/repositories/explor_repo_impl.dart';
import 'package:smartsoil/Feature/explor/domain/repositories/explor_repo.dart';
import 'package:smartsoil/Feature/explor/logic/cubit/explor_cubit.dart';
import 'package:smartsoil/Feature/favorites/data/datasources/favorite_data_soureces.dart';
import 'package:smartsoil/Feature/favorites/data/datasources/favorite_data_soureces_impl.dart';
import 'package:smartsoil/Feature/favorites/data/repositories/favorite_repo_impl.dart';
import 'package:smartsoil/Feature/favorites/domain/repositories/favorites_repo.dart';
import 'package:smartsoil/Feature/favorites/logic/cubit/favorites_cubit.dart';
import 'package:smartsoil/Feature/home/data/datasources/home_data_sources.dart';
import 'package:smartsoil/Feature/home/data/datasources/home_data_sources_impl.dart';
import 'package:smartsoil/Feature/home/domain/repositories/home_repo.dart';
import 'package:smartsoil/Feature/home/data/repositories/home_repo_impl.dart';
import 'package:smartsoil/Feature/home/logic/cubit/home_cubit.dart';
import 'package:smartsoil/Feature/layout/data/datasources/layout_datasource.dart';
import 'package:smartsoil/Feature/layout/data/datasources/layout_datasource_impl.dart';
import 'package:smartsoil/Feature/layout/data/repositories/layout_repo_impl.dart';
import 'package:smartsoil/Feature/layout/domain/repositories/layout_repo.dart';
import 'package:smartsoil/Feature/layout/logic/cubit/layout_cubit.dart';
import 'package:smartsoil/Feature/onbording/data/repositories/onbording_repo.dart';
import 'package:smartsoil/Feature/onbording/data/repositories/onbording_repo_impl.dart';
import 'package:smartsoil/Feature/onbording/logic/cubit/onbording_cubit.dart';
import 'package:smartsoil/Feature/plantClassifiction/data/datasources/plant_classfiction_data_sources.dart';
import 'package:smartsoil/Feature/plantClassifiction/data/datasources/plant_classfiction_data_sources_impl.dart';
import 'package:smartsoil/Feature/plantClassifiction/data/repositories/plant_classfiction_repo_impl.dart';
import 'package:smartsoil/Feature/plantClassifiction/domain/repositories/plant_classfictaion_repo.dart';
import 'package:smartsoil/Feature/plantClassifiction/logic/cubit/plant_classfiction_cubit.dart';
import 'package:smartsoil/Feature/store/data/datasources/store_dara_sources_impl.dart';
import 'package:smartsoil/Feature/store/data/datasources/store_data_sources.dart';
import 'package:smartsoil/Feature/store/data/repositories/store_repo_impl.dart';
import 'package:smartsoil/Feature/store/domain/repositories/store_repo.dart';
import 'package:smartsoil/Feature/store/logic/cubit/store_cubit.dart';

final GetIt serviceLocator = GetIt.instance;

class ServiceLocator {
  Future<void> setupServiceLocator() async {
    // await _setupForExternal();

    // _setupForCore();
    _setupForDataSources();

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

    serviceLocator.registerLazySingleton<HomeRepo>(() =>
        HomeRepooImpl(homeDataSource: serviceLocator.get<HomeDataSource>()));

    serviceLocator.registerLazySingleton<ExplorRepo>(() => ExplorRepoImpl(
        explorDataSources: serviceLocator.get<ExplorDataSources>()));

    serviceLocator.registerLazySingleton<LayOutRepo>(() => LayoutRepoImpl(
        layoutDataSource: serviceLocator.get<LayoutDataSource>()));

    serviceLocator.registerLazySingleton<PlantCareRepo>(() => PlantCareRepoImpl(
        plantClassficationDataSource:
            serviceLocator.get<PlantClassficationDataSource>()));

    serviceLocator.registerLazySingleton<StoreRepo>(() => StoreRepoImpl(
        storeDataSources: serviceLocator.get<StoreDataSources>()));

    serviceLocator.registerLazySingleton<FavoritesRepo>(() => FavoritesRepoImpl(
        favoriteDataSource: serviceLocator.get<FavoriteDataSource>()));
  }

  void _setupForDataSources() {
    serviceLocator.registerLazySingleton<LayoutDataSource>(
      () => LayoutDataSourceImpl(),
    );

    serviceLocator.registerLazySingleton<ExplorDataSources>(
      () => ExplorDataSourcesImpl(),
    );

    serviceLocator.registerLazySingleton<HomeDataSource>(
      () => HomeDatSourceImpl(),
    );
    serviceLocator.registerLazySingleton<PlantClassficationDataSource>(
      () => PlantClassfictionDataSourceImpl(),
    );

    serviceLocator.registerLazySingleton<StoreDataSources>(
      () => StoreDataSourcesImpl(),
    );

    serviceLocator.registerLazySingleton<FavoriteDataSource>(
      () => FavoritesDataSoureceImpl(),
    );
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
    serviceLocator.registerFactory<LayoutCubit>(
        () => LayoutCubit(layOutRepo: serviceLocator.get<LayOutRepo>()));
    serviceLocator.registerFactory<HomeCubit>(
        () => HomeCubit(homeRepo: serviceLocator.get<HomeRepo>()));
    serviceLocator.registerFactory<ExplorCubit>(
        () => ExplorCubit(explorRepo: serviceLocator.get<ExplorRepo>()));

    serviceLocator.registerFactory<PlantClassfictionCubite>(() =>
        PlantClassfictionCubite(
            plantCareRepo: serviceLocator.get<PlantCareRepo>()));

    serviceLocator.registerFactory<StoreCubit>(
        () => StoreCubit(storeRepo: serviceLocator.get<StoreRepo>()));

    serviceLocator.registerFactory<FavoritesCubit>(() =>
        FavoritesCubit(favoritesRepo: serviceLocator.get<FavoritesRepo>()));
  }
}
