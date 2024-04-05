import 'package:smartsoil/Feature/auth/data/login/models/user_model.dart';
import 'package:smartsoil/Feature/profile/data/datasources/profile_data_sources.dart';
import 'package:smartsoil/core/networking/api_services.dart';
import 'package:smartsoil/core/networking/end_boint.dart';
import 'package:smartsoil/core/networking/local_services.dart';

class ProfileDataSourcesImpl implements ProfileDataSources {
  @override
  Future<UserModel> getUserData() async {
    String token = LocalServices.getData(key: 'token');
    var response = await ApiServices.getData(
      endpoint: userDataendpoint,
      token: token,
    );
    UserModel user = UserModel.fromJson(response);

    return user;
  }
}
