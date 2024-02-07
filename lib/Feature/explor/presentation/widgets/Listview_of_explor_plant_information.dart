// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/explor/logic/cubit/explor_cubit.dart';
import 'package:smartsoil/Feature/explor/presentation/widgets/explor_plant_information.dart';
import 'package:smartsoil/core/helper/helper_const.dart';

class ListOfExplorPlantInformation extends StatelessWidget {
  const ListOfExplorPlantInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExplorCubit, ExplorState>(
      builder: (context, state) {
        return ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: BlocProvider.of<ExplorCubit>(context).explorData().length,
          itemBuilder: (context, index) {
            indexOfExploration = index;
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: ExplorPlantInformation(
                cubit: BlocProvider.of<ExplorCubit>(context),
                index: index,
              ),
            );
          },
        );
      },
    );
  }
}
