import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:smartsoil/Feature/explor/logic/cubit/explor_cubit.dart';
import 'package:smartsoil/Feature/explor/presentation/widgets/traidment_card.dart';

class ExplorTraidmentProductBody extends StatelessWidget {
  const ExplorTraidmentProductBody({super.key, required this.cubit});
  final ExplorCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FadeInRight(
        duration: const Duration(
          milliseconds: 700,
        ),
        child: GridView.count(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          childAspectRatio: 1 / 1.5,
          mainAxisSpacing: 20,
          physics: const NeverScrollableScrollPhysics(),
          children: List.generate(
            10,
            (index) {
              return const TraidmentProductCard();
            },
          ),
        ),
      ),
    );
  }
}
