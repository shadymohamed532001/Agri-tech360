import 'package:flutter/material.dart';
import 'package:smartsoil/Feature/checkout/presenation/widgets/my_card_view_body.dart';
import 'package:smartsoil/Feature/store/data/models/store_product_model.dart';
import 'package:smartsoil/core/helper/naviagtion_extentaions.dart';

class MyCardView extends StatelessWidget {
  const MyCardView({super.key, required this.storeProductModel});
  final StoreProductModel storeProductModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            context.pop();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 28,
          ),
        ),
        title: const Text(
          'My Card',
          style: TextStyle(
            fontSize: 22,
            color: Colors.black,
          ),
        ),
      ),
      body: MyCardViewBody(
        storeProductModel: storeProductModel,
      ),
    );
  }
}
