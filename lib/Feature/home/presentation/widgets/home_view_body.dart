import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/home/logic/cubit/home_cubit.dart';
import 'package:smartsoil/Feature/home/presentation/widgets/guidance_user_to_heal_his_crop.dart';
import 'package:smartsoil/Feature/home/presentation/widgets/heal_your_crop_and_plant_text.dart';
import 'package:smartsoil/Feature/home/presentation/widgets/list_of_recntly_viewed_item.dart';
import 'package:smartsoil/Feature/home/presentation/widgets/list_of_weather_degree_item.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';
import 'package:smartsoil/core/widgets/precious_app_bar.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    context.read<HomeCubit>().getWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Stack(
            children: [
              Row(
                children: [
                  const Spacer(),
                  Container(
                    width: 120.w,
                    height: double.infinity,
                    color: ColorManger.lightpinkColor,
                  ),
                ],
              ),
              SafeArea(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w)
                          .copyWith(bottom: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const PreciousAppBar(),
                      verticalSpacing(40),
                      const HealYourCropAndPlantText(),
                      verticalSpacing(16),
                      FadeInRight(child: const GuidanceUserToHealHisCrop()),
                      verticalSpacing(40),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Daily Forecast',
                          style: AppStyle.font22BlackBold,
                        ),
                      ),
                      verticalSpacing(24),
                      FadeInLeft(child: ListOfWeatherDegreeItem()),
                      verticalSpacing(40),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Recently viewed',
                          style: AppStyle.font22BlackBold,
                        ),
                      ),
                      verticalSpacing(24),
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
    );
  }
}

// import 'package:animate_do/animate_do.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:smartsoil/Feature/home/presentation/widgets/guidance_user_to_heal_his_crop.dart';
// import 'package:smartsoil/Feature/home/presentation/widgets/heal_your_crop_and_plant_text.dart';
// import 'package:smartsoil/Feature/home/presentation/widgets/list_of_recntly_viewed_item.dart';
// import 'package:smartsoil/Feature/home/presentation/widgets/list_of_weather_degree_item.dart';
// import 'package:smartsoil/core/helper/spacing.dart';
// import 'package:smartsoil/core/themaing/app_colors.dart';
// import 'package:smartsoil/core/themaing/app_styles.dart';
// import 'package:smartsoil/core/widgets/precious_app_bar.dart';

// class HomeViewBody extends StatefulWidget {
//   const HomeViewBody({
//     super.key,
//   });

//   @override
//   State<HomeViewBody> createState() => _HomeViewBodyState();
// }

// class _HomeViewBodyState extends State<HomeViewBody> {
//   @override
//   Widget build(BuildContext context) {
// return CustomScrollView(
//   slivers: [
//     SliverFillRemaining(
//       hasScrollBody: false,
//       child: Stack(
//         children: [
//           Row(
//             children: [
//               const Spacer(),
//               Container(
//                 width: 120.w,
//                 height: double.infinity,
//                 color: ColorManger.lightpinkColor,
//               ),
//             ],
//           ),
//           SafeArea(
//             child: Padding(
//               padding:
//                   EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w)
//                       .copyWith(bottom: 0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   const PreciousAppBar(),
//                   verticalSpacing(40),
//                   const HealYourCropAndPlantText(),
//                   verticalSpacing(16),
//                   FadeInRight(child: const GuidanceUserToHealHisCrop()),
//                   verticalSpacing(40),
//                   Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text(
//                       'Daily Forecast',
//                       style: AppStyle.font22BlackBold,
//                     ),
//                   ),
//                   verticalSpacing(24),
//                   FadeInLeft(child: const ListOfWeatherDegreeItem()),
//                   verticalSpacing(40),
//                   Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text(
//                       'Recently viewed',
//                       style: AppStyle.font22BlackBold,
//                     ),
//                   ),
//                   verticalSpacing(24),
//                   FadeInUp(
//                     child: const ListOfRecntlyViewedItem(),
//                   )
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     )
//   ],
// );
//   }
// }

// //Fuction of Open Gallery
// // ----------------------------------------------------------------
//   // final ImagePicker picker = ImagePicker();
//   // File? image;

//   // pickedImage() async {
//   //   XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
//   //   setState(() {
//   //     image = File(pickedFile!.path);
//   //   });
//   // }
//   // pickedImage();
