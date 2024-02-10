import 'package:flutter/material.dart';
import 'package:smartsoil/Feature/explor/presentation/widgets/information_sliver_app_bar.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';

class CareInstractionViewBody extends StatelessWidget {
  const CareInstractionViewBody({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        InformationSliverAppBar(
          index: index,
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpacing(10),
                Text(
                  'Care Instructions',
                  style: AppStyle.font22BlackBold,
                ),
                verticalSpacing(10),
                const Text(
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
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
