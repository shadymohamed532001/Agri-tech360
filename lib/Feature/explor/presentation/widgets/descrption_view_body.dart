import 'package:flutter/material.dart';
import 'package:smartsoil/Feature/explor/presentation/widgets/information_sliver_app_bar.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';

class DescriptionViewBody extends StatelessWidget {
  const DescriptionViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        const InformationSliverAppBar(),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Text(
                  'Description',
                  style: AppStyle.font22BlackBold,
                ),
                const SizedBox(height: 10),
                const Text(
                  'The apple tree (Malus domestica) is a deciduous tree belonging to the rose family (Rosaceae). Renowned for its iconic fruits and ornamental beauty, the apple tree holds a significant cultural and culinary importance worldwide. This perennial tree boasts a striking appearance, characterized by a spreading canopy of branches adorned with glossy green leaves during the growing season. In spring, delicate blossoms emerge, painting the landscape with hues of white, pink, or red, depending on the cultivar.\n\n'
                  'Fruit:\n'
                  'Apples, the quintessential fruit of the apple tree, come in a diverse array of colors, shapes, sizes, and flavors, offering a culinary delight for every palate. From the crisp sweetness of the Fuji apple to the tartness of the Granny Smith, each variety boasts unique characteristics prized by chefs, bakers, and consumers alike. Beyond their delectable taste, apples are a rich source of essential nutrients, including dietary fiber, vitamins, and antioxidants, contributing to overall health and well-being.\n\n'
                  'Cultural Significance:\n'
                  'Throughout history, the apple tree has held symbolic significance across cultures and civilizations. From ancient mythology and folklore to religious texts and artistic depictions, the apple tree has been revered as a symbol of fertility, abundance, temptation, and knowledge. In literature, the apple often serves as a metaphor for love, temptation, and the pursuit of wisdom, resonating with readers through timeless tales such as the Garden of Eden and the myth of the golden apple.\n\n'
                  'Cultivation and Care:\n'
                  'Successfully cultivating an apple tree requires careful attention to site selection, soil preparation, planting, and ongoing maintenance. Apple trees thrive in temperate climates with well-drained soil and ample sunlight, although specific cultivars may exhibit varying tolerances to climate conditions. Prior to planting, it is advisable to conduct a soil test to assess pH levels and fertility, amending the soil as needed to optimize growing conditions.\n\n'
                  'Careful pruning and training are essential to shape the tree, promote proper airflow and light penetration, and maximize fruit production. Pruning should be performed during the dormant season to remove dead, damaged, or crossing branches and encourage vigorous new growth. Additionally, regular irrigation, fertilization, and pest management practices are crucial to support the tree\'s health and vitality throughout the growing season.\n',
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
