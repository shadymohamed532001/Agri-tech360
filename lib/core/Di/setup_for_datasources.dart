import 'package:smartsoil/Feature/comments/data/datasources/comment_data_sources.dart';
import 'package:smartsoil/Feature/comments/data/datasources/comment_data_sources_impl.dart';
import 'package:smartsoil/Feature/favorites/data/datasources/favorite_data_soureces.dart';
import 'package:smartsoil/Feature/favorites/data/datasources/favorite_data_soureces_impl.dart';
import 'package:smartsoil/Feature/home/data/datasources/home_data_sources.dart';
import 'package:smartsoil/Feature/home/data/datasources/home_data_sources_impl.dart';
import 'package:smartsoil/Feature/profile/data/datasources/profile_data_sources.dart';
import 'package:smartsoil/Feature/profile/data/datasources/profile_data_sources_impl.dart';
import 'package:smartsoil/Feature/recommendNextCrop/data/datasources/recommend_next_crop_data_sources.dart';
import 'package:smartsoil/Feature/recommendNextCrop/data/datasources/recommend_next_crop_data_sources_impl.dart';
import 'package:smartsoil/service_locator.dart';

class  SetupForDataSources{
  void setupForDataSources() {
   

 

    serviceLocator.registerLazySingleton<HomeDataSource>(
      () => HomeDatSourceImpl(),
    );
  

    serviceLocator.registerLazySingleton<FavoriteDataSource>(
      () => FavoritesDataSoureceImpl(),
    );

    serviceLocator.registerLazySingleton<CommentDataSources>(
      () => CommentDataSourcesImpl(),
    );

    serviceLocator.registerLazySingleton<RecommendNextCropDataSources>(
      () => RecommendNextCropDataSourcesImpl(),
    );
    serviceLocator.registerLazySingleton<ProfileDataSources>(
      () => ProfileDataSourcesImpl(),
    );
  }
}
