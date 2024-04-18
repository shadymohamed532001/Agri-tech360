import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/profile/logic/cubit/profile_cubit.dart';
import 'package:smartsoil/Feature/profile/presentation/widgets/Custom_list_tittle.dart';
import 'package:smartsoil/Feature/profile/presentation/widgets/general_profile_components.dart';
import 'package:smartsoil/Feature/profile/presentation/widgets/update_profile_form.dart';
import 'package:smartsoil/core/helper/naviagtion_extentaions.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/networking/end_boint.dart';
import 'package:smartsoil/core/networking/local_services.dart';
import 'package:smartsoil/core/routing/routes.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_image_assets.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';
import 'package:smartsoil/core/widgets/app_bottom.dart';
import 'package:smartsoil/core/widgets/app_text_formfield.dart';
import 'package:smartsoil/core/widgets/custom_error_widget.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        ProfileCubit cubit = BlocProvider.of<ProfileCubit>(context);
        if (state is ProfileLoadingState) {
          return const Center(
            child: CircularProgressIndicator(
              color: ColorManger.primaryColor,
            ),
          );
        } else if (state is ProfileSuccessState) {
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Container(
                      height: 190.h,
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
                                visible: true,
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage:
                                          CachedNetworkImageProvider(
                                        '$baseUrl${state.userData.data!.profilePic}',
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8.w),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            state.userData.data!.fullName!,
                                            style: AppStyle.font16Whitebold,
                                          ),
                                          verticalSpacing(2),
                                          Text(
                                            state.userData.data!.email!,
                                            style: AppStyle.font12Whitesemibold,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Spacer(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    FadeInLeft(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Update',
                                      style: AppStyle.font14Blacksemibold,
                                    ),
                                  ],
                                ),
                                CustomListTittle(
                                  title: const Text('Update profile'),
                                  leading: Image.asset(
                                    ImagesAssetsManger.profileImage,
                                    width: 30.w,
                                    height: 30.h,
                                  ),
                                  trailing: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        cubit.isUserDataUpdateShow =
                                            !cubit.isUserDataUpdateShow;
                                      });
                                    },
                                    child: Icon(
                                      cubit.isUserDataUpdateShow
                                          ? Icons.arrow_drop_down
                                          : Icons.arrow_right,
                                    ),
                                  ),
                                ),
                                cubit.isUserDataUpdateShow
                                    ? const UpdateProfileForm()
                                    : Container(),
                                CustomListTittle(
                                  title: const Text('Update password'),
                                  leading: Image.asset(
                                    ImagesAssetsManger.changepasswordImage,
                                    width: 30.w,
                                    height: 30.h,
                                  ),
                                  trailing: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        cubit.isUserpasswordShow =
                                            !cubit.isUserpasswordShow;
                                      });
                                    },
                                    child: Icon(
                                      cubit.isUserpasswordShow
                                          ? Icons.arrow_drop_down
                                          : Icons.arrow_right,
                                    ),
                                  ),
                                ),
                                cubit.isUserpasswordShow
                                    ? FadeInRight(
                                        child: Column(
                                          children: [
                                            const CustomTextFormFiled(
                                              hintText: 'Old password',
                                              obscureText: false,
                                            ),
                                            const CustomTextFormFiled(
                                              hintText: 'New password',
                                              obscureText: false,
                                            ),
                                            const CustomTextFormFiled(
                                              hintText: 'Confirm password',
                                              obscureText: false,
                                            ),
                                            verticalSpacing(10),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10.w),
                                              child: CustomBottom(
                                                onPressed: () {},
                                                bottomtext: 'Change password',
                                                backgroundColor:
                                                    ColorManger.primaryColor,
                                                bottomHeight: 45.h,
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    : Container(),
                              ],
                            ),
                            verticalSpacing(20),
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
                                  'privacy',
                                  style: AppStyle.font14Blacksemibold,
                                ),
                              ],
                            ),
                            verticalSpacing(8),
                            Column(
                              children: [
                                CustomListTittle(
                                  title: const Text('Policies & Privacy'),
                                  leading: Image.asset(
                                    ImagesAssetsManger.privacyImage,
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
                                'Logout',
                                style: AppStyle.font13PrimaryBold
                                    .copyWith(color: ColorManger.redColor),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          );
        } else if (state is ProfileErrorState) {
          return CustomErrorWidget(
            onPressed: () {
              context.read<ProfileCubit>().getProfileData();
            },
            error: state.error,
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(color: ColorManger.primaryColor),
          );
        }
      },
    );
  }
}
