import 'package:flutter/material.dart';
import 'package:smartsoil/Feature/home/presentation/widgets/see_all_items.dart';
import 'package:smartsoil/core/widgets/custom_sliver_app_bar.dart';

class RecentlySeeAllView extends StatelessWidget {
  const RecentlySeeAllView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: <Widget>[
            CustomSliverAppBar(
              titleText: 'Recently Viewed',
              centerTitle: false,
            ),
            SliverToBoxAdapter(
              child: SeeAllItems(),
            ),
          ],
        ),
      ),
    );
  }
}
