// ignore: file_names
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/store/data/models/store_product_model.dart';
import 'package:smartsoil/core/networking/end_boint.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({
    Key? key,
    required this.productModel,
    required this.selectedIndex,
  }) : super(key: key);
  final StoreProductModel productModel;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManger.whiteColor,
      child: Stack(
        children: [
          SizedBox(
            height: 300.h,
            child: Center(
              child: Padding(
                padding:
                    EdgeInsets.only(left: 20.h, right: 20.w, top: 20.h * 3.3),
                child: CachedNetworkImage(
                  imageUrl: '$baseUrl${productModel.images[selectedIndex]}',
                ),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: ColorManger.blackColor,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite_border,
                      color: ColorManger.redColor,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
