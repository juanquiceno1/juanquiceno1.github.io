import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:sizer/sizer.dart';

class ImageFadeAsset extends StatelessWidget {
  final String image;
  final double? height;
  final bool? navigate;
  final BoxFit? fit;
  final Color? color;
  const ImageFadeAsset({
    Key? key,
    required this.image,
    this.navigate,
    this.fit,
    this.height,
    this.color,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) => GestureDetector(
        // onTap: navigate != null ? () => navigateToImage(context, image) : null,
        child: image.contains('.svg')
            ? SvgPicture.asset(
                image,
                fit: fit ?? BoxFit.cover,
                color: color,
              )
            : Image.asset(
                image.contains('assets/') ? image : 'assets/$image',
                color: color,
                fit: fit ?? BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container();
                },
              ),
      );
}
