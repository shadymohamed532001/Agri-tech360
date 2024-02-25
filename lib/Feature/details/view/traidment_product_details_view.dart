import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';

class TradmentProductDetailsView extends StatelessWidget {
  const TradmentProductDetailsView({
    super.key,
  });

  // final PlantModle plant;  // Product Models

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: ColorManger.whiteColor,
              child: Stack(
                children: [
                  SizedBox(
                    height: 350.h,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.all(20.h * 2),
                        child: Image.asset(
                          'assets/images/traidmenr.png',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                              color: ColorManger.whiteColor,
                              borderRadius: BorderRadius.circular(24)),
                          child: Image.asset(
                            'assets/images/traidmenr.png',
                            fit: BoxFit.fill,
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
