import 'package:animate_do/animate_do.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/explor/data/models/explor_data_models.dart';
import 'package:smartsoil/Feature/explor/logic/cubit/explor_cubit.dart';
import 'package:smartsoil/Feature/explor/presentation/widgets/listview_of_explor_plant_information.dart';
import 'package:smartsoil/core/helper/helper_const.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';
import 'package:smartsoil/core/widgets/disapled_search_bar.dart';

class ExplorViewBody extends StatefulWidget {
  const ExplorViewBody({Key? key}) : super(key: key);

  @override
  State<ExplorViewBody> createState() => _ExplorViewBodyState();
}

class _ExplorViewBodyState extends State<ExplorViewBody> {
  late List<ExplorDataModel> searchedforExplorItem = [];
  final _controller = TextEditingController();

  List<ExplorDataModel> filterExplorData(String query) {
    return explorationData
        .where((character) => character.plantName.toLowerCase().contains(
              query.toLowerCase(),
            ))
        .toList();
  }

  @override
  void initState() {
    BlocProvider.of<ExplorCubit>(context).explorData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: true,
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: 200.h,
                decoration: BoxDecoration(
                  color: ColorManger.primaryColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
              ),
              SafeArea(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Find your Plant',
                        style: AppStyle.font16Whitebold,
                      ),
                      verticalSpacing(16),
                      DisabledSearchField(
                        controller: _controller,
                        onChanged: (value) {
                          setState(() {
                            searchedforExplorItem = filterExplorData(value);
                          });
                        },
                      ),
                      verticalSpacing(60),
                      Expanded(
                        child: FadeInDown(
                          duration: const Duration(
                            milliseconds: 700,
                          ),
                          child: ListOfExplorPlantInformation(
                            explorData: _controller.text.isNotEmpty
                                ? searchedforExplorItem
                                : explorationData,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
