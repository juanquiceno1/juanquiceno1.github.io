import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../widget/buttons/primary_button.dart';
import '../../widget/images/image_fade_asset.dart';

class ViewError extends StatelessWidget {
  final VoidCallback onPressed;
  final double? heightImage;
  final MainAxisAlignment? main;
  const ViewError(
      {Key? key, required this.onPressed, this.heightImage, this.main})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: main ?? MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: heightImage ?? 30.h,
            child: ImageFadeAsset(image: 'assets/images/No data-cuate.svg'),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 20,
            ),
            child: Text(
              'No logramos cargar los datos, intenta nuevamente',
              style: Theme.of(context).primaryTextTheme.subtitle1,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: PrimaryButton(
              labelText: 'Intentar de nuevo',
              isEnabled: true,
              size: 100,
              onPressed: onPressed,
            ),
          )
        ],
      ),
    );
  }
}
