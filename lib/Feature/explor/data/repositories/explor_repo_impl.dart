import 'package:smartsoil/Feature/explor/data/models/explor_data_models.dart';
import 'package:smartsoil/Feature/explor/domain/repositories/explor_repo.dart';

class ExplorRepoImpl extends ExplorRepo {
  @override
  List<ExplorDataModel> getExplorData() {
    return <ExplorDataModel>[
      ExplorDataModel(
        numberOfWater: '8',
        stateofTemperature: 'Sunny',
        maxmumdegrees: '60',
        minimumdegrees: '15',
        plantLongDescription:
            'An apple is a round, edible fruit produced by an apple tree. Apple trees are cultivated worldwide and are the most widely grown species in the genus Malus. The tree originated in Central Asia, where its wild ancestor, he apple is a deciduous tree, generally standing 2 to 4.5 m (6 to 15 ft) tall.1 to 1.5 inches of water per week 6 to 8 hours of direct sunlight daily 60°F (15°C)',
        plantName: 'Apple',
        plantShortDescription:
            'An apple is a round, edible fruit produced by\nan apple tree.',
        plantimagepath: 'assets/images/flower_shadow.png',
        plantMediumDescription: '',
        plantCareInstruct: '',
      ),
    ];
  }
}
