import 'package:flutter/material.dart';
import 'package:smartsoil/Feature/explor/presentation/widgets/information_sliver_app_bar.dart';

class DescriptionViewBody extends StatelessWidget {
  const DescriptionViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: <Widget>[
        InformationSliverAppBar(),
        SliverToBoxAdapter(
          child: Column(
            children: [Text('sdnlsandlknslk')],
          ),
        )
      ],
    );
  }
}
