import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/plantClassifiction/logic/cubit/plant_classfiction_cubit.dart';
import 'package:smartsoil/Feature/plantClassifiction/presentation/widgets/classfiction_response_body.dart';
import 'package:smartsoil/Feature/plantClassifiction/presentation/widgets/custom_bottom_sheet.dart';
import 'package:smartsoil/Feature/plantClassifiction/presentation/widgets/empty_uploaded_image.dart';
import 'package:smartsoil/core/helper/helper_const.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_image_assets.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';
import 'package:smartsoil/core/widgets/primary_header_continer.dart';
import 'package:smartsoil/core/widgets/shows_toust_color.dart';

class PlantCareViewBody extends StatefulWidget {
  const PlantCareViewBody({super.key});

  @override
  State<PlantCareViewBody> createState() => _PlantCareViewBodyState();
}

class _PlantCareViewBodyState extends State<PlantCareViewBody> {
  bool isTabSelected = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlantClassfictionCubite, PlantClasfictionState>(
      listener: (BuildContext context, PlantClasfictionState state) {
        if (state is UploadAndGetResponseToModelLoadingState) {
          showDialog(
            context: context,
            builder: (_) => Center(
              child: CircularProgressIndicator(
                color: ColorManger.whiteColor,
              ),
            ),
          );
        } else if (state is UploadAndGetResponseToModelSucsesState) {
          if (state.plantCareModle.status == true) {
            Navigator.of(context)
                .pop(); // close the dialog if successfully logged in
            showTouster(
              massage: state.plantCareModle.message,
              state: ToustState.SUCCESS,
            );
          }
        }
        if (state is UploadAndGetResponseToModelErrorState) {
          Navigator.of(context).pop(); // close the dialog if login fails
          showTouster(
            massage: state.errorMessage,
            state: ToustState.ERROR,
          );
        }
      },
      builder: (context, state) {
        PlantClassfictionCubite cubit =
            PlantClassfictionCubite.getObject(context);

        return SingleChildScrollView(
          child: Column(
            children: [
              PrimaryHeaderContiner(
                height: MediaQuery.of(context).size.height * 0.18,
                child: SafeArea(
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Good afternoon,shady',
                                  style: AppStyle.font18Whitesemibold,
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text(
                                  'Let’s take care of the plants together',
                                  style: AppStyle.font14Whiteregular,
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                    backgroundColor: Colors.transparent,
                                    isScrollControlled: true,
                                    context: context,
                                    builder: (context) {
                                      return CustomBottomSheet(cubit: cubit);
                                    });
                              },
                              child: Image.asset(
                                'assets/images/menu_1.png',
                                height: 30.h,
                                width: 27.w,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Column(
                  children: [
                    Image.asset(
                      ImagesAssetsManger.appLogo,
                      height: 80.h,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'Smart Soil',
                      style: AppStyle.font20blacksemibold,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      plantCareDescription,
                      style: AppStyle.font13Greymedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 66,
                    ),
                    cubit.classfictionModel != null
                        ? ClassfictionResponseBody(
                            classfictionModel: cubit.classfictionModel!,
                          )
                        : const EmptyUploadedImage()
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}









// /*
//   Visibility(
//                         visible: false,
//                         child: Container(
//                           width: double.infinity,
//                           height: 500.h,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(32),
//                             color: ColorManger.whiteColor,
//                           ),
//                           child: cubit.image != null
//                               ? Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Container(
//                                       height: 200.h,
//                                       width: double.infinity,
//                                       decoration: BoxDecoration(
//                                         borderRadius: const BorderRadius.only(
//                                           topLeft: Radius.circular(32),
//                                           topRight: Radius.circular(32),
//                                         ),
//                                         image: DecorationImage(
//                                           fit: BoxFit.fill,
//                                           image: FileImage(
//                                             cubit.image!,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     verticalSpacing(10),
//                                     Padding(
//                                       padding: const EdgeInsets.all(8.0),
//                                       child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           Text(
//                                             'Plant Disease : '
//                                             '............................ ',
//                                             style: AppStyle.font17Blacksemibold,
//                                           ),
//                                           verticalSpacing(10),
//                                           Text(
//                                             'confidence : '
//                                             '............................ ',
//                                             style: AppStyle.font17Blacksemibold,
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     verticalSpacing(10),
//                                     Expanded(
//                                       child: ListView.separated(
//                                         itemCount: 10,
//                                         separatorBuilder: (context, index) =>
//                                             const Divider(
//                                           height: 10,
//                                         ),
//                                         itemBuilder: (context, index) {
//                                           return Padding(
//                                             padding: const EdgeInsets.all(16),
//                                             child: Container(
//                                               height: 100,
//                                               width: double.infinity,
//                                               color: ColorManger.primaryColor,
//                                             ),
//                                           );
//                                         },
//                                       ),
//                                     )
//                                   ],
//                                 )
//                               : Column(
//                                   children: [
//                                     Container(
//                                       height: 200.h,
//                                       width: double.infinity,
//                                       decoration: const BoxDecoration(
//                                         borderRadius: BorderRadius.only(
//                                             topLeft: Radius.circular(32),
//                                             topRight: Radius.circular(32)),
//                                         image: DecorationImage(
//                                           fit: BoxFit.fill,
//                                           image: AssetImage(
//                                             ImagesAssetsManger.onBordingimage3,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     verticalSpacing(10),
//                                     Row(
//                                       children: [
//                                         Text(
//                                           'Plant Results',
//                                           style: AppStyle.font22BlackBold,
//                                         ),
//                                       ],
//                                     )
//                                   ],
//                                 ),
//                         ),
//                       )*/



// //  cubit.image == null
// //                             ? const Text('gcghcgchcgchg')
// //                             : Container(
// //                                 decoration: BoxDecoration(
// //                                   borderRadius: BorderRadius.circular(24),
// //                                   image: DecorationImage(
// //                                     fit: BoxFit.cover,
// //                                     image: FileImage(
// //                                       cubit.image!,
// //                                     ),
// //                                   ),
// //                                 ),
// //                               ),

// // CustomBottom(
// //   backgroundColor: ColorManger.primaryColor,
// //   bottomWidth: 150.w,
// //   onPressed: () async {
// //     await cubit.uploadImageFromGalleryModel(
// //       picke: ImagePicker(),
// //     );
//     // await cubit.uploadImageToModel(image: cubit.image!);
//     // // await upload();
//     // // cubit.uploadImageFromGalleryModel(picke: ImagePicker());
// //   },
// //   bottomtext: 'Select From Gallary',
// //   textBottomStyle: AppStyle.font12Whitebold,
// // ),

// /*  pickedImage() async {
//     XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
//     setState(() {
//       image = File(
//         pickedFile!.path,
//       );
//     });
//   }

//   Future<void> upload2() async {
//     final dio = Dio();
//     dio.options.baseUrl = baseUrl;

//     try {
//       final formData = FormData.fromMap({
//         'file': await MultipartFile.fromFile(
//           image!.path,
//           filename: image!.path.split('/').last,
//         ),
//       });

//       final response = await dio.post(
//         classifyendPoint,
//         data: formData,
//         options: Options(
//           headers: {
//             "Authorization": "Bearer $usertoken",
//             "Content-Type": "multipart/form-data",
//           },
//         ),
//       );

//       if (response.statusCode == 200) {
//         final resJson = response.data;
//         setState(() {
//           result = resJson['data']['predictions'];
//           print(result);
//         });
//       } else {
//         print("Error ${response.statusCode}");
//       }
//     } catch (e) {
//       print("Error: $e");
//     }
//   } */
// // InkWell(
//                           //   onTap: () {
//                               // showImagePikerDialog(
//                               //   context,
//                               //   cameraFUC: () {},
//                               //   gallaryFUC: () async {
//                               //     await cubit.uploadImageFromGalleryModel(
//                               //       picke: ImagePicker(),
//                               //     );
//                               //     setState(() {
//                               //       context.pop();
//                               //     });
//                               //     await cubit.uploadImageToModel(
//                               //         image: cubit.image!);
//                               //   },
//                               //   removeFUC: () {},
//                               // );
//                           //   },
//                           //   child: Image.asset(
//                           //     ImagesAssetsManger.menuiconImage,
//                           //     height: 30.h,
//                           //     color: Colors.grey[900],
//                           //   ),
//                           // ),