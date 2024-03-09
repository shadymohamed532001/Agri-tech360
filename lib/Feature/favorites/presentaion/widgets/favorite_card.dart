import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/favorites/data/models/favorites_models.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/networking/end_boint.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';

class FavoriteCard extends StatelessWidget {
  const FavoriteCard({
    Key? key,
    required this.favoriteModle,
  }) : super(key: key);

  final FavoriteData favoriteModle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20.r)),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 0,
            child: Padding(
              padding: EdgeInsets.only(
                right: 10.w,
                left: 5.w,
                top: 5.h,
                bottom: 5.w,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(19.r)),
                child: CachedNetworkImage(
                  imageUrl: '$baseUrl${favoriteModle.image}',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 5, top: 10, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Text(
                            favoriteModle.name,
                            style: AppStyle.font14Blacksemibold,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              // Handle tapping on favorite icon
                            },
                            child: Icon(
                              Icons.favorite,
                              color: ColorManger.redColor,
                              size: 17,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  verticalSpacing(5),
                  Expanded(
                    child: Text(
                      favoriteModle.description * 5,
                      style: AppStyle.font13Greymedium,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '${favoriteModle.seller.fullName} ', // or use a proper formatting for price
                        style: AppStyle.font14Blacksemibold,
                      ),
                      const SizedBox(width: 7),
                      Text(
                        '${favoriteModle.price.toInt().toString()} \$  ', // or use a proper formatting for price
                        style: AppStyle.font14Blacksemibold,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
