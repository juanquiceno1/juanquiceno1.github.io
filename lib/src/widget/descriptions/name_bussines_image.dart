import 'package:client/src/widget/images/image_fade_asset.dart';
import 'package:client/src/widget/shimmer/shimmer_generic.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../images/image_fade.dart';

class NameBusinessImage extends StatelessWidget {
  final String name;
  final String business;
  final String image;
  final bool? loading;
  const NameBusinessImage({
    Key? key,
    required this.name,
    required this.business,
    required this.image,
    this.loading,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (loading ?? false)
                    ShimmerGeneric(
                      width: 60.w,
                      align: Alignment.centerLeft,
                    )
                  else
                    Text(
                      name,
                      style: Theme.of(context)
                          .primaryTextTheme
                          .subtitle1!
                          .copyWith(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  SizedBox(height: 5),
                  if (loading ?? false)
                    ShimmerGeneric(
                      width: 40.w,
                      height: 20,
                      align: Alignment.centerLeft,
                    )
                  else
                    Text(
                      business,
                      style: Theme.of(context)
                          .primaryTextTheme
                          .subtitle1!
                          .copyWith(
                            fontSize: 15.sp,
                          ),
                    )
                ],
              ),
            ),
            Container(
              height: 10.h,
              width: 10.h,
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(100)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: loading ?? false
                    ? ImageFadeAsset(image: 'assets/jar-loading.gif')
                    : ImageFade(
                        image: image,
                      ),
              ),
            )
          ],
        ),
      );
}
