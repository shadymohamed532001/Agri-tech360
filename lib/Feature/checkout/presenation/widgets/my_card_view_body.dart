import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartsoil/Feature/checkout/data/repo/checkout_repo_impl.dart';
import 'package:smartsoil/Feature/checkout/logic/cubit/check_out_cubit.dart';
import 'package:smartsoil/Feature/checkout/presenation/widgets/card_Info_item.dart';
import 'package:smartsoil/Feature/checkout/presenation/widgets/payment_method_bottom_sheet.dart';
import 'package:smartsoil/Feature/checkout/presenation/widgets/total_price_info.dart';
import 'package:smartsoil/Feature/store/data/models/store_product_model.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/widgets/app_bottom.dart';

class MyCardViewBody extends StatelessWidget {
  const MyCardViewBody({super.key, required this.storeProductModel});
  final StoreProductModel storeProductModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(
            height: 18,
          ),
          Expanded(
            child: Image.asset(
              'assets/images/Group 6.png',
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          CardInfoItem(
            title: 'Order Subtotal',
            value: '\$ ${storeProductModel.price}',
          ),
          const SizedBox(
            height: 5,
          ),
          const CardInfoItem(
            title: 'Discount',
            value: '\$0',
          ),
          const SizedBox(
            height: 5,
          ),
          const CardInfoItem(
            title: 'Shipping',
            value: '\$8.97',
          ),
          const Divider(
            thickness: 2,
            color: Color(0xffC7C7C7),
            height: 34,
          ),
          TotalPrice(
            title: 'Total',
            value: '\$ ${storeProductModel.price} + \$8.97',
          ),
          const SizedBox(
            height: 50,
          ),
          CustomBottom(
            bottomHeight: 60,
            bottomtext: 'Complete Payment',
            backgroundColor: ColorManger.primaryColor,
            onPressed: () {
              showModalBottomSheet(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(32),
                          topRight: Radius.circular(32))),
                  context: context,
                  builder: (context) {
                    return BlocProvider(
                      create: (context) => CheckOutCubit(
                        CheckOutRepoImpl(),
                      ),
                      child: PayMentMethodBottomSheet(
                        storeProductModel: storeProductModel,
                      ),
                    );
                  });
            },
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
