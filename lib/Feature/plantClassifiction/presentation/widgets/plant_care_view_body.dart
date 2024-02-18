import 'dart:io';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smartsoil/Feature/plantClassifiction/logic/cubit/plant_care_cubit.dart';
import 'package:smartsoil/Feature/plantClassifiction/presentation/widgets/plant_care_clip_paht.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';
import 'package:smartsoil/core/widgets/app_bottom.dart';

class PlantCareViewBody extends StatelessWidget {
  const PlantCareViewBody({super.key});

  final File? image = null;

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
                height: 650.h,
                color: ColorManger.lightpinkColor,
              ),
            ),
            Positioned(
              top: 160,
              right: 0,
              child: FadeInRight(
                child: Image.asset(
                  'assets/images/sapar_tree.png',
                  height: 270.h,
                  width: 230.w,
                ),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpacing(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'There’s a Plant\nfor everyone',
                          style: AppStyle.font22BlackBold,
                        ),
                        Image.asset(
                          'assets/images/menu.png',
                          height: 30.h,
                          color: Colors.grey[900],
                        ),
                      ],
                    ),
                    verticalSpacing(20),
                    CustomBottom(
                      backgroundColor: ColorManger.primaryColor,
                      bottomWidth: 150.w,
                      onPressed: () async {
                        await cubit.uploadImageFromGalleryModel(
                          picke: ImagePicker(),
                        );
                        await cubit.uploadImageToModel(image: cubit.image!);
                        // await upload();
                        // cubit.uploadImageFromGalleryModel(picke: ImagePicker());
                      },
                      bottomtext: 'Select From Gallary',
                      textBottomStyle: AppStyle.font12Whitebold,
                    ),
                    verticalSpacing(200),
                    Container(
                        padding: const EdgeInsets.all(10),
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          gradient: LinearGradient(colors: [
                            ColorManger.primaryColor,
                            ColorManger.greyColor
                          ]),
                          color: ColorManger.greyColor,
                        ),
                        child: cubit.image == null
                            ? const Text('')
                            : Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: FileImage(
                                      cubit.image!,
                                    ),
                                  ),
                                ),
                              ))
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
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