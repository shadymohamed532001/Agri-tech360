import 'package:smartsoil/Feature/auth/data/login/repositories/login_repo.dart';
import 'package:smartsoil/Feature/auth/data/login/repositories/login_repo_impl.dart';
import 'package:smartsoil/Feature/auth/data/sign_up/repositories/sign_up_repo.dart';
import 'package:smartsoil/Feature/auth/data/sign_up/repositories/sign_up_repo_impl.dart';
import 'package:smartsoil/Feature/checkout/data/repo/checkout_repo.dart';
import 'package:smartsoil/Feature/checkout/data/repo/checkout_repo_impl.dart';
import 'package:smartsoil/Feature/comments/data/datasources/comment_data_sources.dart';
import 'package:smartsoil/Feature/comments/data/repositories/comment_repo_impl.dart';
import 'package:smartsoil/Feature/comments/domain/repositories/comment_repo.dart';
import 'package:smartsoil/Feature/explor/data/datasources/explor_data_sources.dart';
import 'package:smartsoil/Feature/explor/data/repositories/explor_repo_impl.dart';
import 'package:smartsoil/Feature/explor/domain/repositories/explor_repo.dart';
import 'package:smartsoil/Feature/favorites/data/datasources/favorite_data_soureces.dart';
import 'package:smartsoil/Feature/favorites/data/repositories/favorite_repo_impl.dart';
import 'package:smartsoil/Feature/favorites/domain/repositories/favorites_repo.dart';
import 'package:smartsoil/Feature/home/data/datasources/home_data_sources.dart';
import 'package:smartsoil/Feature/home/data/repositories/home_repo_impl.dart';
import 'package:smartsoil/Feature/home/domain/repositories/home_repo.dart';
import 'package:smartsoil/Feature/layout/data/datasources/layout_datasource.dart';
import 'package:smartsoil/Feature/layout/data/repositories/layout_repo_impl.dart';
import 'package:smartsoil/Feature/layout/domain/repositories/layout_repo.dart';
import 'package:smartsoil/Feature/onbording/data/repositories/onbording_repo.dart';
import 'package:smartsoil/Feature/onbording/data/repositories/onbording_repo_impl.dart';
import 'package:smartsoil/Feature/plantClassifiction/data/datasources/plant_classfiction_data_sources.dart';
import 'package:smartsoil/Feature/plantClassifiction/data/repositories/plant_classfiction_repo_impl.dart';
import 'package:smartsoil/Feature/plantClassifiction/domain/repositories/plant_classfictaion_repo.dart';
import 'package:smartsoil/Feature/profile/data/datasources/profile_data_sources.dart';
import 'package:smartsoil/Feature/profile/data/repositories/profile_repo_impl.dart';
import 'package:smartsoil/Feature/profile/domain/repositories/profile_repo.dart';
import 'package:smartsoil/Feature/recommendNextCrop/data/datasources/recommend_next_crop_data_sources.dart';
import 'package:smartsoil/Feature/recommendNextCrop/data/repositories/recommend_next_crop_repo_impl.dart';
import 'package:smartsoil/Feature/recommendNextCrop/domain/recommend_next_crop_repo_impl.dart';
import 'package:smartsoil/Feature/store/data/datasources/store_data_sources.dart';
import 'package:smartsoil/Feature/store/data/repositories/store_repo_impl.dart';
import 'package:smartsoil/Feature/store/domain/repositories/store_repo.dart';
import 'package:smartsoil/service_locator.dart';

class SetupForRepos {
  void setupForRepos() {
    serviceLocator
        .registerLazySingleton<OnBoardingRepo>(() => OnBoardingRepoImpl());
    serviceLocator
        .registerLazySingleton<CheckOutRepo>(() => CheckOutRepoImpl());
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

    serviceLocator.registerLazySingleton<CommentRepo>(() => CommentRepoImpl(
        commentDataSources: serviceLocator.get<CommentDataSources>()));

    serviceLocator.registerLazySingleton<RecommendNextCropRepo>(() =>
        RecommendNextCropRepoImpl(
            recommendNextCropDataSources:
                serviceLocator.get<RecommendNextCropDataSources>()));

    serviceLocator.registerLazySingleton<ProfileRepo>(() => ProfileRepoImpl(
        profileDataSources: serviceLocator.get<ProfileDataSources>()));
  }
}