import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/checkout/data/repo/checkout_repo_impl.dart';
import 'package:smartsoil/Feature/checkout/logic/cubit/check_out_cubit.dart';
import 'package:smartsoil/Feature/checkout/presenation/widgets/card_Info_item.dart';
import 'package:smartsoil/Feature/checkout/presenation/widgets/payment_method_bottom_sheet.dart';
import 'package:smartsoil/Feature/checkout/presenation/widgets/total_price_info.dart';
import 'package:smartsoil/Feature/store/data/models/store_product_model.dart';
import 'package:smartsoil/core/networking/end_boint.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/widgets/app_bottom.dart';

class MyCardViewBody extends StatelessWidget {
  const MyCardViewBody({Key? key, required this.storeProductModel})
      : super(key: key);
  final StoreProductModel storeProductModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 18),
          Expanded(
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              child: Stack(
                children: [
                  Image.asset('assets/images/empty card.png'),
                  ...List.generate(
                    storeProductModel.images.length - 1,
                    (index) {
                      final random = Random();
                      final screenWidth = MediaQuery.of(context).size.width;
                      final screenHeight = MediaQuery.of(context).size.height;
                      // Ensure random positions are within the card area
                      final left = double.parse(
                          max(0, random.nextDouble() * (screenWidth - 200.w))
                              .toString());
                      final top = double.parse(
                          max(0, random.nextDouble() * (screenHeight - 500.h))
                              .toString());
                      return Positioned(
                        left: left,
                        top: top,
                        child: Image.network(
                          '$baseUrl${storeProductModel.images[index]}',
                          width: 100.w,
                          height: 100.h,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 25),
          CardInfoItem(
              title: 'Order Subtotal', value: '\$ ${storeProductModel.price}'),
          const SizedBox(height: 5),
          const CardInfoItem(title: 'Discount', value: '\$0'),
          const SizedBox(height: 5),
          const CardInfoItem(title: 'Shipping', value: '\$8.97'),
          const Divider(thickness: 2, color: Color(0xffC7C7C7), height: 34),
          TotalPrice(
              title: 'Total', value: '\$ ${storeProductModel.price} + \$8.97'),
          const SizedBox(height: 50),
          CustomBottom(
            bottomHeight: 60,
            bottomtext: 'Complete Payment',
            backgroundColor: ColorManger.primaryColor,
            onPressed: () {
              showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                context: context,
                builder: (context) {
                  return BlocProvider(
                    create: (context) => CheckOutCubit(CheckOutRepoImpl()),
                    child: PayMentMethodBottomSheet(
                        storeProductModel: storeProductModel),
                  );
                },
              );
            },
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
