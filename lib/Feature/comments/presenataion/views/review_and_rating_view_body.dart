import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/comments/logic/comment_cubite/comment_cubit.dart';
import 'package:smartsoil/Feature/store/data/models/store_product_model.dart';
import 'package:smartsoil/Feature/comments/presenataion/widgets/user_review_card.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/widgets/app_text_formfield.dart';
import 'package:smartsoil/core/widgets/custom_sliver_app_bar.dart';

class RatingAndReviewBody extends StatelessWidget {
  const RatingAndReviewBody({Key? key, required this.productModel})
      : super(key: key);
  final StoreProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommentCubit, CommentState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: CustomScrollView(
                    physics: const BouncingScrollPhysics(),
                    slivers: <Widget>[
                      const CustomSliverAppBar(
                        titleText: 'Reviews & Ratings',
                        centerTitle: false,
                      ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              verticalSpacing(20),
                              const UserReviewCard(),
                              verticalSpacing(20),
                              const UserReviewCard(),
                              verticalSpacing(20),
                              const UserReviewCard(),
                              verticalSpacing(20),
                              const UserReviewCard(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                CustomTextFormFiled(
                  onFieldSubmitted: (comment) {
                    BlocProvider.of<CommentCubit>(context)
                        .addComment(productId: productModel.id);
                    // Unfocus the current focus to close the keyboard
                    FocusScope.of(context).unfocus();
                    // Clear the text field's value
                    BlocProvider.of<CommentCubit>(context)
                        .commentsController
                        .clear();
                  },
                  obscureText: false,
                  hintText: 'Write a review',
                  controller:
                      BlocProvider.of<CommentCubit>(context).commentsController,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return 'Please enter your review';
                    }
                    return null;
                  },
                  suffixIcon: IconButton(
                    onPressed: () {
                      BlocProvider.of<CommentCubit>(context)
                          .addComment(productId: productModel.id);
                      FocusScope.of(context).unfocus();
                      BlocProvider.of<CommentCubit>(context)
                          .commentsController
                          .clear();
                    },
                    icon: const Icon(
                      Icons.send,
                      color: ColorManger.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
