import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smartsoil/Feature/store/logic/cubit/store_cubit.dart';
import 'package:smartsoil/Feature/store/presentation/widgets/add_product_bottom_sheet.dart';
import 'package:smartsoil/Feature/store/presentation/widgets/app_search_bar.dart';
import 'package:smartsoil/Feature/store/presentation/widgets/hellow_row.dart';
import 'package:smartsoil/Feature/store/presentation/widgets/store_list_of_product.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/widgets/primary_header_continer.dart';

class StoreViewBody extends StatelessWidget {
  const StoreViewBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeaderContiner(
              height: MediaQuery.of(context).size.height / 3.6,
              child: Column(
                children: [
                  const HellowRow(),
                  verticalSpacing(25),
                  AppSearchBar(width2: 330.w),
                ],
              ),
            ),
            StoreListOfProduct(cubit: BlocProvider.of<StoreCubit>(context)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorManger.primaryColor,
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(34),
                  topRight: Radius.circular(34),
                ),
              ),
              context: context,
              builder: (context) {
                return const AddProductBottomSheet();
              });
        },
        child: const Icon(Iconsax.add),
      ),
    );
  }
}
