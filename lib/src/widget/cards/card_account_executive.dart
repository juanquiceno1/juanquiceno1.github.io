import 'package:client/src/widget/shimmer/shimmer_generic.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/theme/colors.dart';
import '../images/image_fade.dart';

class CardAccountExecutive extends StatelessWidget {
  final String image;
  final Widget child;
  final bool? loading;
  const CardAccountExecutive({
    Key? key,
    required this.image,
    required this.child,
    this.loading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
          color: AppColors.white,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50.0),
                        topRight: Radius.circular(50.0),
                      ),
                      image: DecorationImage(
                        image: AssetImage('assets/green-rectangle.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 5.h, bottom: 10.h),
                      child: Image.asset(
                        'assets/Logo-Proservis.png',
                        height: 12.h,
                        width: 12.h,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(top: 20.h),
                      child: Column(
                        children: [
                          Container(
                            height: 15.h,
                            width: 15.h,
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(100)),
                            child: Container(
                              padding: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: const <Color>[
                                        AppColors.primaryColor,
                                        AppColors.primaryColor,
                                        AppColors.white,
                                        AppColors.white
                                      ]),
                                  borderRadius: BorderRadius.circular(100)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: !loading!
                                    ? ImageFade(
                                        image: image,
                                      )
                                    : Container(
                                        color: AppColors.white,
                                        child: ShimmerGeneric(
                                          radius: 100,
                                          height: 15.h,
                                          width: 15.h,
                                        ),
                                      ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              child,
              SizedBox(height: 5.h)
            ],
          ),
        ),
      );
}
