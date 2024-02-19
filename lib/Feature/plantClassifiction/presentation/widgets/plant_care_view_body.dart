import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smartsoil/Feature/plantClassifiction/logic/cubit/plant_care_cubit.dart';
import 'package:smartsoil/Feature/plantClassifiction/presentation/widgets/plant_care_clip_paht.dart';
import 'package:smartsoil/Feature/plantClassifiction/presentation/widgets/show_image_piker_dilaog.dart';
import 'package:smartsoil/core/helper/helper_const.dart';
import 'package:smartsoil/core/helper/naviagtion_extentaions.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_image_assets.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';

class PlantCareViewBody extends StatefulWidget {
  const PlantCareViewBody({super.key});

  @override
  State<PlantCareViewBody> createState() => _PlantCareViewBodyState();
}

class _PlantCareViewBodyState extends State<PlantCareViewBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlantCareCubite, PlantCareState>(
      builder: (context, state) {
        PlantCareCubite cubit = PlantCareCubite.getObject(context);
        return Stack(
          children: [
            ClipPath(
              clipper: PlantCareClipper(),
              child: Container(
                width: double.infinity,
                height: 600.h,
                color: ColorManger.lightpinkColor,
              ),
            ),
            SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          verticalSpacing(15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'There’s a Plant\nfor everyone',
                                style: AppStyle.font22BlackBold,
                              ),
                              InkWell(
                                onTap: () {
                                  showImagePikerDialog(
                                    context,
                                    cameraFUC: () {},
                                    gallaryFUC: () async {
                                      await cubit.uploadImageFromGalleryModel(
                                        picke: ImagePicker(),
                                      );
                                      setState(() {
                                        context.pop();
                                      });
                                      await cubit.uploadImageToModel(
                                          image: cubit.image!);
                                    },
                                    removeFUC: () {},
                                  );
                                },
                                child: Image.asset(
                                  ImagesAssetsManger.menuiconImage,
                                  height: 30.h,
                                  color: Colors.grey[900],
                                ),
                              ),
                            ],
                          ),
                          verticalSpacing(20),
                          Text(
                            plantCareDescription,
                            style: AppStyle.font13Blackregular,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 6.3,
                          ),
                          Text(
                            'Plant Results',
                            style: AppStyle.font22BlackBold,
                          ),
                          verticalSpacing(10),
                          Container(
                              width: double.infinity,
                              height: 500.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(32),
                                color: ColorManger.whiteColor,
                              ),
                              child: cubit.image != null
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 200.h,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(32),
                                                    topRight:
                                                        Radius.circular(32)),
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
                                                'Plant Disease : ............................ ',
                                                style: AppStyle
                                                    .font17Blacksemibold,
                                              ),
                                              verticalSpacing(10),
                                              Text(
                                                'confidence : ............................ ',
                                                style: AppStyle
                                                    .font17Blacksemibold,
                                              ),
                                            ],
                                          ),
                                        ),
                                        verticalSpacing(10),
                                        Expanded(
                                          child: ListView.separated(
                                            itemCount: 10,
                                            separatorBuilder:
                                                (context, index) => Divider(
                                              height: 10,
                                            ),
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.all(16),
                                                child: Container(
                                                  height: 100,
                                                  width: double.infinity,
                                                  color:
                                                      ColorManger.primaryColor,
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
                                                ImagesAssetsManger
                                                    .onBordingimage3,
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
                                    ))
                        ])),
              ),
            )
          ],
        );
      },
    );
  }
}

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
//     await cubit.uploadImageToModel(image: cubit.image!);
//     // await upload();
//     // cubit.uploadImageFromGalleryModel(picke: ImagePicker());
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
