import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/explor/logic/cubit/explor_cubit.dart';
import 'package:smartsoil/Feature/search/presentation/search_view.dart';
import 'package:smartsoil/Feature/store/presentation/views/store_traidment_product_view_body.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';
import 'package:smartsoil/core/widgets/precious_app_bar.dart';

class StorViewBody extends StatefulWidget {
  final int initialTabIndex;

  const StorViewBody({
    Key? key,
    this.initialTabIndex = 0,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _StorViewBodyState();
  }
}

class _StorViewBodyState extends State<StorViewBody>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool isTreatmentSelected = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: widget.initialTabIndex,
    );
    _tabController.addListener(_handleTabSelection);
    isTreatmentSelected = widget.initialTabIndex == 0;
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabSelection() {
    setState(() {
      isTreatmentSelected = _tabController.index == 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: PreciousAppBar(),
        ),
        body: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: TabBar(
                tabs: [
                  InkWell(
                    onTap: () {
                      _tabController.animateTo(0);
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Container(
                      height: 40.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: isTreatmentSelected
                            ? ColorManger.primaryColor
                            : Colors.transparent,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                      ),
                      child: Text(
                        'Traidment',
                        style: isTreatmentSelected
                            ? AppStyle.font12Whitesemibold
                            : AppStyle.font13Blacksemibold,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      _tabController.animateTo(1);
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Container(
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: !isTreatmentSelected
                            ? ColorManger.primaryColor
                            : Colors.transparent,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                      ),
                      child: Text(
                        'Products',
                        style: isTreatmentSelected
                            ? AppStyle.font13Blacksemibold
                            : AppStyle.font12Whitesemibold,
                      ),
                    ),
                  ),
                ],
                indicatorColor: Colors.transparent,
                indicatorSize: TabBarIndicatorSize.label,
                controller: _tabController,
              ),
            ),
            Expanded(
              child: TabBarView(
                physics: const BouncingScrollPhysics(),
                controller: _tabController,
                children: [
                  StoreTraidmentProductBody(
                    cubit: BlocProvider.of<ExplorCubit>(context),
                  ),
                  const SearchView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
