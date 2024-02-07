import 'package:smartsoil/Feature/explor/data/models/explor_data_models.dart';
import 'package:smartsoil/core/helper/size_config.dart';

String? token;
bool? onBording;
List<ExplorDataModel> explorationData = [];

int? indexOfExploration;

double rw(double width) => SizeConfig.setWidth(width);
double rh(double height) => SizeConfig.setHeight(height);
double rf(double size) => SizeConfig.setSp(size);
