import 'package:smartsoil/Feature/auth/data/login/repositories/login_repo.dart';
import 'package:smartsoil/Feature/auth/data/sign_up/repositories/sign_up_repo.dart';
import 'package:smartsoil/Feature/auth/logic/login_cubite/login_cubit.dart';
import 'package:smartsoil/Feature/auth/logic/sign_up_cubite/sign_up_cubit.dart';
import 'package:smartsoil/Feature/checkout/data/repo/checkout_repo.dart';
import 'package:smartsoil/Feature/checkout/logic/cubit/check_out_cubit.dart';
import 'package:smartsoil/Feature/comments/domain/repositories/comment_repo.dart';
import 'package:smartsoil/Feature/comments/logic/comment_cubite/comment_cubit.dart';
import 'package:smartsoil/Feature/explor/domain/repositories/explor_repo.dart';
import 'package:smartsoil/Feature/explor/logic/cubit/explor_cubit.dart';
import 'package:smartsoil/Feature/favorites/domain/repositories/favorites_repo.dart';
import 'package:smartsoil/Feature/favorites/logic/cubit/favorites_cubit.dart';
import 'package:smartsoil/Feature/home/domain/repositories/home_repo.dart';
import 'package:smartsoil/Feature/home/logic/cubit/home_cubit.dart';
import 'package:smartsoil/Feature/layout/domain/repositories/layout_repo.dart';
import 'package:smartsoil/Feature/layout/logic/cubit/layout_cubit.dart';
import 'package:smartsoil/Feature/onbording/data/repositories/onbording_repo.dart';
import 'package:smartsoil/Feature/onbording/logic/cubit/onbording_cubit.dart';
import 'package:smartsoil/Feature/plantClassifiction/domain/repositories/plant_classfictaion_repo.dart';
import 'package:smartsoil/Feature/plantClassifiction/logic/cubit/plant_classfiction_cubit.dart';
import 'package:smartsoil/Feature/profile/domain/repositories/profile_repo.dart';
import 'package:smartsoil/Feature/profile/logic/cubit/profile_cubit.dart';
import 'package:smartsoil/Feature/recommendNextCrop/domain/recommend_next_crop_repo_impl.dart';
import 'package:smartsoil/Feature/recommendNextCrop/logic/recommend_next_crop_cubit.dart';
import 'package:smartsoil/Feature/store/domain/repositories/store_repo.dart';
import 'package:smartsoil/Feature/store/logic/store_cubit.dart';
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

    serviceLocator.registerFactory<CommentCubit>(
        () => CommentCubit(commentRepo: serviceLocator.get<CommentRepo>()));

    serviceLocator.registerFactory<RecommendNextCropCubit>(() =>
        RecommendNextCropCubit(
            recommendNextCropRepo:
                serviceLocator.get<RecommendNextCropRepo>()));

    serviceLocator.registerFactory<ProfileCubit>(
        () => ProfileCubit(profileRepo: serviceLocator.get<ProfileRepo>()));

    serviceLocator.registerFactory<CheckOutCubit>(
        () => CheckOutCubit(checkOutRepo: serviceLocator.get<CheckOutRepo>()));
  }
}
