import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/plantClassifiction/logic/cubit/plant_care_cubit.dart';
import 'package:smartsoil/Feature/plantClassifiction/presentation/widgets/classfiction_product_list_view.dart';
import 'package:smartsoil/Feature/plantClassifiction/presentation/widgets/plant_care_clip_paht.dart';
import 'package:smartsoil/Feature/plantClassifiction/presentation/widgets/plant_classfiction_option.dart';
import 'package:smartsoil/core/helper/helper_const.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';
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
    return BlocConsumer<PlantCareCubite, PlantCareState>(
      listener: (BuildContext context, PlantCareState state) {
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
        PlantCareCubite cubit = PlantCareCubite.getObject(context);

        return Stack(
          children: [
            ClipPath(
              clipper: PlantCareClipper(),
              child: Container(
                width: double.infinity,
                height: 550.h,
                color: ColorManger.primaryColor,
              ),
            ),
            SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpacing(5),
                      Text(
                        'Classify Your Plant',
                        style: AppStyle.font22Whitebold,
                      ),
                      verticalSpacing(5),
                      Text(
                        plantCareDescription,
                        style: AppStyle.font12Whiteregular,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      const PlantClassfictionOptions(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                      cubit.image == null
                          ? const EmptyPlantClassfiction()
                          : PlantClassfictionResultBody(cubit: cubit),
                    ],
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}

class PlantClassfictionResultBody extends StatelessWidget {
  const PlantClassfictionResultBody({
    super.key,
    required this.cubit,
  });

  final PlantCareCubite cubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: cubit.classfictionModel?.data.products.isEmpty ?? true
          ? MediaQuery.of(context).size.height * .3
          : MediaQuery.of(context).size.height * .8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: ColorManger.whiteColor,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: -60,
            child: CircleAvatar(
              radius: 60,
              backgroundColor: ColorManger.whiteColor,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: FileImage(cubit.image!),
              ),
            ),
          ),
          Positioned(
            top: 70,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                height: 1,
                width: double.infinity,
                color: const Color.fromARGB(255, 223, 221, 220),
              ),
            ),
          ),
          Positioned(
            top: 90,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 40.h,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.h),
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Text(
                            'Plant Name : ',
                            style: AppStyle.font14Blacksemibold,
                          ),
                          Expanded(
                            child: Text(
                              cubit.classfictionModel?.data.predictions
                                      .split(' ')
                                      .first ??
                                  '',
                              style: AppStyle.font14Blacksemibold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Text(
                            'Plant disease : ',
                            style: AppStyle.font14Blacksemibold,
                          ),
                          Expanded(
                            child: Text(
                              cubit.classfictionModel?.data.predictions ?? '',
                              style: AppStyle.font14Blacksemibold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 150,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                height: 1,
                width: double.infinity,
                color: const Color.fromARGB(255, 223, 221, 220),
              ),
            ),
          ),
          cubit.classfictionModel?.data.products.isEmpty ?? true
              ? Positioned.fill(
                  top: 140.h,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Text(
                      'No Product Related To this Plant',
                      style: AppStyle.font17Blacksemibold,
                    ),
                  ),
                )
              : Positioned.fill(
                  top: 160,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: ClassfictionProductListView(
                    cubit: cubit,
                  ),
                ),
        ],
      ),
    );
  }
}

class EmptyPlantClassfiction extends StatelessWidget {
  const EmptyPlantClassfiction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * .5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: ColorManger.whiteColor,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: -60,
            child: CircleAvatar(
              radius: 60,
              backgroundColor: ColorManger.whiteColor,
              child: const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(
                  'assets/images/women_hold_tree.jpg',
                ),
              ),
            ),
          ),
          Positioned(
            top: 70,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                height: 1,
                width: double.infinity,
                color: const Color.fromARGB(255, 223, 221, 220),
              ),
            ),
          ),
          Positioned(
            top: 90,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 40.h,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.h),
                child: Column(
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          'Please Upload Image ',
                          style: AppStyle.font22BlackBold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 150,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                height: 1,
                width: double.infinity,
                color: const Color.fromARGB(255, 223, 221, 220),
              ),
            ),
          ),
          Positioned.fill(
            top: 150,
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Image.asset(
                'assets/images/no_product.jpg',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/*
  Visibility(
                        visible: false,
                        child: Container(
                          width: double.infinity,
                          height: 500.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                            color: ColorManger.whiteColor,
                          ),
                          child: cubit.image != null
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 200.h,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(32),
                                          topRight: Radius.circular(32),
                                        ),
                                        image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: FileImage(
                                            cubit.image!,
                                          ),
                                        ),
                                      ),
                                    ),
                                    verticalSpacing(10),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Plant Disease : '
                                            '............................ ',
                                            style: AppStyle.font17Blacksemibold,
                                          ),
                                          verticalSpacing(10),
                                          Text(
                                            'confidence : '
                                            '............................ ',
                                            style: AppStyle.font17Blacksemibold,
                                          ),
                                        ],
                                      ),
                                    ),
                                    verticalSpacing(10),
                                    Expanded(
                                      child: ListView.separated(
                                        itemCount: 10,
                                        separatorBuilder: (context, index) =>
                                            const Divider(
                                          height: 10,
                                        ),
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.all(16),
                                            child: Container(
                                              height: 100,
                                              width: double.infinity,
                                              color: ColorManger.primaryColor,
                                            ),
                                          );
                                        },
                                      ),
                                    )
                                  ],
                                )
                              : Column(
                                  children: [
                                    Container(
                                      height: 200.h,
                                      width: double.infinity,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(32),
                                            topRight: Radius.circular(32)),
                                        image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage(
                                            ImagesAssetsManger.onBordingimage3,
                                          ),
                                        ),
                                      ),
                                    ),
                                    verticalSpacing(10),
                                    Row(
                                      children: [
                                        Text(
                                          'Plant Results',
                                          style: AppStyle.font22BlackBold,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                        ),
                      )*/



//  cubit.image == null
//                             ? const Text('gcghcgchcgchg')
//                             : Container(
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(24),
//                                   image: DecorationImage(
//                                     fit: BoxFit.cover,
//                                     image: FileImage(
//                                       cubit.image!,
//                                     ),
//                                   ),
//                                 ),
//                               ),

// CustomBottom(
//   backgroundColor: ColorManger.primaryColor,
//   bottomWidth: 150.w,
//   onPressed: () async {
//     await cubit.uploadImageFromGalleryModel(
//       picke: ImagePicker(),
//     );
    // await cubit.uploadImageToModel(image: cubit.image!);
    // // await upload();
    // // cubit.uploadImageFromGalleryModel(picke: ImagePicker());
//   },
//   bottomtext: 'Select From Gallary',
//   textBottomStyle: AppStyle.font12Whitebold,
// ),

/*  pickedImage() async {
    XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      image = File(
        pickedFile!.path,
      );
    });
  }

  Future<void> upload2() async {
    final dio = Dio();
    dio.options.baseUrl = baseUrl;

    try {
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          image!.path,
          filename: image!.path.split('/').last,
        ),
      });

      final response = await dio.post(
        classifyendPoint,
        data: formData,
        options: Options(
          headers: {
            "Authorization": "Bearer $usertoken",
            "Content-Type": "multipart/form-data",
          },
        ),
      );

      if (response.statusCode == 200) {
        final resJson = response.data;
        setState(() {
          result = resJson['data']['predictions'];
          print(result);
        });
      } else {
        print("Error ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
    }
  } */
// InkWell(
                          //   onTap: () {
                              // showImagePikerDialog(
                              //   context,
                              //   cameraFUC: () {},
                              //   gallaryFUC: () async {
                              //     await cubit.uploadImageFromGalleryModel(
                              //       picke: ImagePicker(),
                              //     );
                              //     setState(() {
                              //       context.pop();
                              //     });
                              //     await cubit.uploadImageToModel(
                              //         image: cubit.image!);
                              //   },
                              //   removeFUC: () {},
                              // );
                          //   },
                          //   child: Image.asset(
                          //     ImagesAssetsManger.menuiconImage,
                          //     height: 30.h,
                          //     color: Colors.grey[900],
                          //   ),
                          // ),