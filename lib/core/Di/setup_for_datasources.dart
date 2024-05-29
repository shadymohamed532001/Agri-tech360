import 'package:smartsoil/Feature/comments/data/datasources/comment_data_sources.dart';
import 'package:smartsoil/Feature/comments/data/datasources/comment_data_sources_impl.dart';
import 'package:smartsoil/service_locator.dart';

class  SetupForDataSources{
  void setupForDataSources() {
   

 

  

   
    serviceLocator.registerLazySingleton<CommentDataSources>(
      () => CommentDataSourcesImpl(),
    );

    
  }
}
