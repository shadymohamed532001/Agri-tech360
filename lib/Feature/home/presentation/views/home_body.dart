import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/home/presentation/widgets/heal_your_crop_and_plant_text.dart';
import 'package:smartsoil/Feature/home/presentation/widgets/list_of_recntly_viewed_item.dart';
import 'package:smartsoil/Feature/home/presentation/widgets/list_of_weather_degree_item.dart';
import 'package:smartsoil/Feature/layout/logic/cubit/layout_cubit.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/widgets/custom_error_widget.dart';
import 'package:smartsoil/core/widgets/line_back_ground.dart';
import 'package:smartsoil/core/widgets/precious_app_bar.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  void initState() {
    BlocProvider.of<LayoutCubit>(context).getWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        LayoutCubit cubit = LayoutCubit.getObject(context);

        if (state is GetweatherDataLoadingState) {
          return Center(
            child: CircularProgressIndicator(
              color: ColorManger.primaryColor,
            ),
          );
        } else if (state is GetweatherDataSuccessState) {
          return Scaffold(
            body: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Stack(
                    children: [
                      const LineBackGround(),
                      SafeArea(
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 12.h, left: 20.w, right: 20.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const PreciousAppBar(),
                              verticalSpacing(40),
                              const HealYourCropAndPlantText(),
                              verticalSpacing(40),
                              FadeInLeft(
                                child: ListOfWeatherDegreeItem(
                                  weathermodelData: cubit.weatherResult,
                                ),
                              ),
                              verticalSpacing(35),
                              FadeInUp(
                                child: const ListOfRecntlyViewedItem(),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        } else if (state is GetweatherDataErrorState) {
          return CustomErrorWidget(
            error: state.errormassage,
            onPressed: () => cubit.getWeather(),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: ColorManger.primaryColor,
            ),
          );
        }
      },
    );
  }
}
