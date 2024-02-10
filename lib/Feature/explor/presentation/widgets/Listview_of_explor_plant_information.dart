// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/explor/data/models/explor_data_models.dart';
import 'package:smartsoil/Feature/explor/logic/cubit/explor_cubit.dart';
import 'package:smartsoil/Feature/explor/presentation/explor_plant_details_view.dart';
import 'package:smartsoil/Feature/explor/presentation/widgets/explor_plant_information.dart';

class ListOfExplorPlantInformation extends StatelessWidget {
  final List<ExplorDataModel> explorData;

  const ListOfExplorPlantInformation({Key? key, required this.explorData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: explorData.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ExplorPlantDetailsView(
                    index: index,
                  ),
                ),
              );
            },
            child: ExplorPlantInformation(
              cubit: BlocProvider.of<ExplorCubit>(context),
              index: index,
            ),
          ),
        );
      },
    );
  }
}
