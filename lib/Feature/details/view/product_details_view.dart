import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/details/widgets/product_image_slider.dart';
import 'package:smartsoil/Feature/details/widgets/rating_and_description.dart';
import 'package:smartsoil/Feature/details/widgets/review_all_comment.dart';
import 'package:smartsoil/Feature/store/data/models/store_product_model.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';
import 'package:smartsoil/core/widgets/app_bottom.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({
    Key? key,
    required this.productModel,
  }) : super(key: key);

  final StoreProductModel productModel;

  @override
  // ignore: library_private_types_in_public_api
  _ProductDetailsViewState createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  int _selectedImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProductImageSlider(
              productModel: widget.productModel,
              selectedIndex: _selectedImageIndex,
            ),
            RatingAndDescription(
              productModel: widget.productModel,
              onImageSelected: (index) {
                setState(() {
                  _selectedImageIndex = index;
                });
              },
            ),
            verticalSpacing(30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Container(
                width: double.infinity,
                height: 65.h,
                decoration: BoxDecoration(
                  color: const Color(0xffE5E5E5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Row(
                    children: [
                      Text(
                        'Valration: ',
                        style: AppStyle.font22BlackBold.copyWith(
                          fontSize: 19.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      horizontalSpacing(20),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(
                                'price',
                                style: AppStyle.font12Blackmedium,
                              ),
                              horizontalSpacing(5),
                              Text(
                                '${widget.productModel.price}\$ ',
                                style: AppStyle.font14Blacksemibold,
                              )
                            ],
                          ),
                          verticalSpacing(5),
                          Row(
                            children: [
                              Text(
                                'saller:',
                                style: AppStyle.font12Blackmedium,
                              ),
                              horizontalSpacing(3),
                              Text(
                                widget.productModel.seller.fullName.toString(),
                                style: AppStyle.font14Blacksemibold,
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            verticalSpacing(20),
            const ReviewAllComment(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: CustomBottom(
                onPressed: () {},
                bottomtext: 'Checkout',
                backgroundColor: ColorManger.primaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
