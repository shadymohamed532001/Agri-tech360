import 'package:flutter/material.dart';
import 'package:smartsoil/Feature/details/widgets/traidment_product_details_view_body.dart';

class TradmentProductDetailsView extends StatelessWidget {
  const TradmentProductDetailsView({
    super.key,
  });

  // final PlantModle plant;  // Product Models

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TradmentProductDetailsViewBody(),
    );
  }
}
