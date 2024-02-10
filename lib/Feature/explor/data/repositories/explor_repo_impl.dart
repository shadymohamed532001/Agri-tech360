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
        plantName: 'Tomato',
        plantShortDescription:
            'An apple is a round, edible fruit produced by\nan apple tree.',
        plantimagepath: 'assets/images/explor_image/tommeto.png',
        plantMediumDescription: '',
        plantCareInstruct: '',
      ),
      ExplorDataModel(
        numberOfWater: '8',
        stateofTemperature: 'Sunny',
        maxmumdegrees: '60',
        minimumdegrees: '15',
        plantLongDescription:
            'The apple tree (Malus domestica) is a deciduous tree belonging to the rose family (Rosaceae). Renowned for its iconic fruits and ornamental beauty, the apple tree holds a significant cultural and culinary importance worldwide. This perennial tree boasts a striking appearance, characterized by a spreading canopy of branches adorned with glossy green leaves during the growing season. In spring, delicate blossoms emerge, painting the landscape with hues of white, pink, or red, depending on the cultivar.\n\n'
            'Fruit:\n'
            'Apples, the quintessential fruit of the apple tree, come in a diverse array of colors, shapes, sizes, and flavors, offering a culinary delight for every palate. From the crisp sweetness of the Fuji apple to the tartness of the Granny Smith, each variety boasts unique characteristics prized by chefs, bakers, and consumers alike. Beyond their delectable taste, apples are a rich source of essential nutrients, including dietary fiber, vitamins, and antioxidants, contributing to overall health and well-being.\n\n'
            'Cultural Significance:\n'
            'Throughout history, the apple tree has held symbolic significance across cultures and civilizations. From ancient mythology and folklore to religious texts and artistic depictions, the apple tree has been revered as a symbol of fertility, abundance, temptation, and knowledge. In literature, the apple often serves as a metaphor for love, temptation, and the pursuit of wisdom, resonating with readers through timeless tales such as the Garden of Eden and the myth of the golden apple.\n\n'
            'Cultivation and Care:\n'
            'Successfully cultivating an apple tree requires careful attention to site selection, soil preparation, planting, and ongoing maintenance. Apple trees thrive in temperate climates with well-drained soil and ample sunlight, although specific cultivars may exhibit varying tolerances to climate conditions. Prior to planting, it is advisable to conduct a soil test to assess pH levels and fertility, amending the soil as needed to optimize growing conditions.\n\n'
            'Careful pruning and training are essential to shape the tree, promote proper airflow and light penetration, and maximize fruit production. Pruning should be performed during the dormant season to remove dead, damaged, or crossing branches and encourage vigorous new growth. Additionally, regular irrigation, fertilization, and pest management practices are crucial to support the tree\'s health and vitality throughout the growing season.\n',
        plantName: 'Mango',
        plantShortDescription:
            'An apple is a round, edible fruit produced by\nan apple tree.',
        plantimagepath: 'assets/images/flower_shadow.png',
        plantMediumDescription:
            'An apple is a round, edible fruit produced by an apple tree. Apple trees are cultivated worldwide and are the most widely grown species in the genus Malus. The tree originated in Central Asia, where its wild ancestor, he apple is a deciduous tree, generally standing 2 to 4.5 m (6 to 15 ft) tall.1 to 1.5 inches of water per week 6 to 8 hours of direct sunlight daily 60°F (15°C)',
        plantCareInstruct:
            'Location: Choose a sunny spot with well-drained soil for planting your apple tree. '
            'Ensure adequate spacing between trees to allow for good air circulation and sunlight penetration.\n'
            'Soil Preparation: Before planting, amend the soil with organic matter such as compost to improve fertility and drainage. '
            'Apple trees prefer slightly acidic to neutral soil pH.\n'
            'Planting: Plant apple trees in late winter or early spring while they are still dormant. '
            'Dig a hole twice as wide and deep as the root ball, and backfill with soil, firming it gently around the roots.\n'
            'Watering: Keep the soil evenly moist, especially during the first few years of growth. '
            'Water deeply and regularly, especially during dry spells and hot weather.\n'
            'Fertilization: Apply a balanced fertilizer formulated for fruit trees in spring before new growth begins. '
            'Follow the manufacturer\'s recommendations for dosage and application.\n'
            'Pruning: Prune apple trees annually to remove dead, diseased, or crossing branches and to shape the tree for better light exposure and air circulation. '
            'Pruning is typically done in late winter or early spring before bud break.\n'
            'Disease and Pest Control: Monitor your apple tree regularly for signs of pests and diseases such as apple scab, fire blight, powdery mildew, and codling moth. '
            'Apply appropriate treatments as needed, including cultural practices, organic sprays, and, if necessary, chemical pesticides.\n'
            'Harvesting: Apple fruits are typically ready for harvest in late summer or early fall, depending on the variety. '
            'Harvest apples when they are fully ripe and have reached their characteristic color and flavor. '
            'Gently twist or lift the fruit to detach it from the tree, taking care not to damage the surrounding branches or fruit.\n'
            'Storage: Store harvested apples in a cool, dry place such as a root cellar or refrigerator to extend their shelf life. '
            'Apples can also be stored in airtight containers or bags to prevent moisture loss and spoilage.\n'
            'Enjoying Your Apples: Apples can be enjoyed in a variety of ways, including fresh eating, baking, cooking, juicing, and making cider and applesauce. '
            'Experiment with different apple varieties and recipes to discover your favorites.',
      ),
    ];
  }
}
