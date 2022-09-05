import 'package:flutter/material.dart';

class ImageFade extends StatelessWidget {
  final String image;
  final bool? navigate;
  final BoxFit? fit;
  const ImageFade({Key? key, required this.image, this.navigate, this.fit})
      : super(key: key);
  @override
  Widget build(BuildContext context) => GestureDetector(
        // onTap: navigate == null || navigate == true
        //     ? () => navigateToImage(context, image)
        //     : null,
        child: InteractiveViewer(
          child: FadeInImage(
            placeholder: AssetImage(
              'assets/jar-loading.gif',
            ),
            image: NetworkImage(image),
            imageErrorBuilder: (BuildContext context, Object exception,
                StackTrace? stackTrace) {
              return Image.asset(
                'assets/no-image.png',
                fit: navigate == null || navigate == true
                    ? BoxFit.cover
                    : BoxFit.contain,
                filterQuality: FilterQuality.medium,
              );
            },
            fit: fit ?? BoxFit.cover,
          ),
        ),
      );
}
