import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smartsoil/Feature/plantClassifiction/presentation/widgets/check_plant_clip_paht.dart';
import 'package:smartsoil/core/helper/helper_const.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/networking/end_boint.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';
import 'package:smartsoil/core/widgets/app_bottom.dart';
import 'package:http/http.dart' as http;

class PlantClassficationViewBody extends StatefulWidget {
  const PlantClassficationViewBody({super.key});

  @override
  State<PlantClassficationViewBody> createState() =>
      _PlantClassficationViewBodyState();
}

class _PlantClassficationViewBodyState
    extends State<PlantClassficationViewBody> {
  final ImagePicker picker = ImagePicker();
  File? image;

  pickedImage() async {
    XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      image = File(
        pickedFile!.path,
      );
    });
  }

  String? result;
  upload2() async {
    final request = http.MultipartRequest(
      "POST",
      Uri.parse('$baseUrl$classifyendPoint'),
    );
    final header = {"Content_type": "multipart/form-data"};

    // Add your bearer token to the headers
    request.headers.addAll({
      ...header,
      "Authorization": "Bearer $usertoken",
    });

    request.files.add(http.MultipartFile(
      'file',
      image!.readAsBytes().asStream(),
      image!.lengthSync(),
      filename: image!.path.split('/').last,
    ));

    final myRequest = await request.send();
    final res = await http.Response.fromStream(myRequest);

    if (myRequest.statusCode == 200) {
      final resJson = jsonDecode(res.body);
      print("response here: $resJson");
      result = resJson['data'];
    } else {
      print("Error ${myRequest.statusCode}");
    }

    setState(() {});
  }

  upload() async {
    final dio = Dio();
    final imageData = image!.readAsBytesSync();

    // Encode the image data to base64
    final imageDataBase64 = base64Encode(imageData);

    final requestData = {
      'file': imageDataBase64,
    };

    final headers = {
      "Content-Type": "application/json", // Set content type to JSON
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InNoYWR5c3RlaGE1M0BnbWFpbC5jb20iLCJleHAiOjE3MDgyOTIxODV9.cbFbUpLTD4wx9KoYUQFGCPFupWr6IvIOOHedbM648AA",
    };

    try {
      final response = await dio.post(
        '$baseUrl/classify',
        data: requestData,
        options: Options(
          headers: headers,
        ),
      );

      if (response.statusCode == 200) {
        final resJson = response.data;
        print("response here: $resJson");
        result = resJson['data'];
      } else {
        print("Error ${response.statusCode}");
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        print("Authentication error: ${e.message}");
        // Handle authentication error here
      } else {
        print("Error: ${e.message}");
      }
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: ChekPlantClipper(),
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
                  onPressed: () {
                    pickedImage();
                  },
                  bottomtext: 'Select From Gallary',
                  textBottomStyle: AppStyle.font12Whitebold,
                ),
                verticalSpacing(20),
                CustomBottom(
                  backgroundColor: ColorManger.primaryColor,
                  bottomWidth: 150.w,
                  onPressed: () {
                    upload2();
                  },
                  bottomtext: 'upload data',
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
                    child: image == null
                        ? const Text('')
                        : Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: FileImage(
                                  image!,
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
  }
}
