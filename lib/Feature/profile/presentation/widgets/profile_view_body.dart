import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/profile/presentation/widgets/Custom_list_tittle.dart';
import 'package:smartsoil/Feature/profile/presentation/widgets/general_profile_components.dart';
import 'package:smartsoil/Feature/profile/presentation/widgets/setting_profile_components.dart';
import 'package:smartsoil/core/helper/naviagtion_extentaions.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/networking/local_services.dart';
import 'package:smartsoil/core/routing/routes.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_image_assets.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              Container(
                height: 200,
                decoration: const BoxDecoration(
                  color: ColorManger.primaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Account',
                          style: AppStyle.font21Whitebold,
                        ),
                        verticalSpacing(16),
                        Visibility(
                          visible: false,
                          child: Text(
                            'Please Login to have more information',
                            style: AppStyle.font21Whitebold,
                          ),
                        ),
                        Visibility(
                          visible: true,
                          child: Row(
                            children: [
                              Container(
                                width: 45.w,
                                height: 45.h,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage(
                                      ImagesAssetsManger.profilePerson,
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Meta Version',
                                      style: AppStyle.font16Whitebold,
                                    ),
                                    verticalSpacing(2),
                                    Text(
                                      'shadysteha571@gmail.com',
                                      style: AppStyle.font12Whitesemibold,
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.edit,
                                  color: ColorManger.whiteColor,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'General',
                          style: AppStyle.font14Blacksemibold,
                        ),
                      ],
                    ),
                    verticalSpacing(8),
                    const GeneralProfileComponents(),
                    verticalSpacing(24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Settings',
                          style: AppStyle.font14Blacksemibold,
                        ),
                      ],
                    ),
                    verticalSpacing(8),
                    const SettingProfileComponents(),
                    verticalSpacing(8),
                    const Divider(
                      color: ColorManger.greyColor,
                      height: 1,
                    ),
                    verticalSpacing(24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Settings',
                          style: AppStyle.font14Blacksemibold,
                        ),
                      ],
                    ),
                    verticalSpacing(8),
                    Column(
                      children: [
                        CustomListTittle(
                          title: const Text('Priveces & policies'),
                          leading: Image.asset(
                            ImagesAssetsManger.applogoBlack,
                            width: 30.w,
                            height: 30.h,
                          ),
                          trailing: const Icon(Icons.arrow_right),
                        ),
                      ],
                    ),
                    verticalSpacing(8),
                    const Divider(
                      color: ColorManger.greyColor,
                      height: 1,
                    ),
                    verticalSpacing(8),
                    TextButton(
                      onPressed: () {
                        LocalServices.removeData(key: 'token');
                        context.navigateAndRemoveUntil(
                          newRoute: Routes.authViewRoute,
                        );
                      },
                      child: Text(
                        'Close Acount',
                        style: AppStyle.font13PrimaryBold
                            .copyWith(color: ColorManger.redColor),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
