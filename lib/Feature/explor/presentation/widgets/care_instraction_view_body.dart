import 'package:flutter/material.dart';
import 'package:smartsoil/Feature/explor/presentation/widgets/information_sliver_app_bar.dart';

class CareInstractionViewBody extends StatelessWidget {
  const CareInstractionViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: <Widget>[
        InformationSliverAppBar(),
        SliverToBoxAdapter(
          child: Column(
            children: [
              Text('sdnlsandlknslk'),
            ],
          ),
        )
      ],
    );
  }
}
