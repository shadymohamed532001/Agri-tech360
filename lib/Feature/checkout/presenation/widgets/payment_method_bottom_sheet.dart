import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartsoil/Feature/checkout/data/models/payment_intent_input_model.dart';
import 'package:smartsoil/Feature/checkout/logic/cubit/check_out_cubit.dart';
import 'package:smartsoil/Feature/checkout/presenation/views/thank_you_view.dart';
import 'package:smartsoil/Feature/checkout/presenation/widgets/pay_ment_method_list_view.dart';
import 'package:smartsoil/Feature/store/data/models/store_product_model.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/widgets/app_bottom.dart';

class PayMentMethodBottomSheet extends StatelessWidget {
  const PayMentMethodBottomSheet({
    super.key,
    required this.storeProductModel,
  });
  final StoreProductModel storeProductModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 35),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 50, bottom: 20),
            child: PayMentMethodListView(),
          ),
          CustomBottomSheetConsummer(
            storeProductModel: storeProductModel,
          )
        ],
      ),
    );
  }
}

class CustomBottomSheetConsummer extends StatelessWidget {
  const CustomBottomSheetConsummer({
    Key? key,
    required this.storeProductModel,
  }) : super(key: key);
  final StoreProductModel storeProductModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckOutCubit, CheckOutState>(
      listener: (context, state) {
        if (state is CheckOutSuccess) {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ThankYouView(
              storeProductModel: storeProductModel,
            );
          }));
        }
        if (state is CheckOutError) {
          // print(state.error.toString());
          Navigator.pop(context);
          // Handle the error, such as displaying an error message
        }
      },
      builder: (context, state) {
        return CustomBottom(
          isLoading: state is CheckOutLoading ? true : false,
          backgroundColor: ColorManger.primaryColor,
          onPressed: () {
            // git all this form the appp
            PaymentIntentInputModel paymentIntentInput =
                PaymentIntentInputModel(
              customerId: 'cus_Pdbvxp1eBo1KYs',
              amount: storeProductModel.price.toString(),
              currency: 'USD',
            );
            BlocProvider.of<CheckOutCubit>(context)
                .makepayment(paymentIntentInput);
          },
          bottomtext: 'pay',
        );
      },
    );
  }
}
