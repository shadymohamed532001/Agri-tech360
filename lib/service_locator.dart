import 'package:get_it/get_it.dart';
import 'package:smartsoil/core/Di/setup_for_datasources.dart';

import 'core/Di/setup_for_cubits.dart';
import 'core/Di/setup_for_repos.dart';

final GetIt serviceLocator = GetIt.instance;

class ServiceLocator {
  Future<void> setUpServiceLocator() async {
    SetupForDataSources().setupForDataSources();

    SetupForRepos().setupForRepos();

    SetupForCubits().setUpForCubits();
  }
}
