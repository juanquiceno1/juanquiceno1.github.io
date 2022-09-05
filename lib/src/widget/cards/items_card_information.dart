import 'package:client/src/models/cards/card_description_model.dart';
import 'package:client/src/utils/external/external_open.dart';
import 'package:flutter/material.dart';

import '../buttons/primary_button.dart';
import '../images/image_fade_asset.dart';
import 'container_description.dart';

class ItemsCardInformation extends StatelessWidget {
  final List<CardDescriptionModel> items;
  final String? descriptionNoItem;
  final String? descriptionButton;
  final VoidCallback? onPressed;
  const ItemsCardInformation({
    Key? key,
    required this.items,
    this.descriptionNoItem,
    this.descriptionButton,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (items.isNotEmpty) {
      return Column(
        children: [
          SizedBox(height: 20),
          for (CardDescriptionModel item in items)
            ContainerDescription(
              icon: item.icon.contains('phone')
                  ? 'assets/icon/phone.png'
                  : item.icon.contains('email')
                      ? 'assets/icon/email.png'
                      : 'assets/icon/text.png',
              description: item.title,
              data: item.description,
              onPress: () {
                item.icon.contains('phone')
                    ? ExternalOpen().phoneCall(
                        phoneNumber: item.description,
                      )
                    : item.icon.contains('email')
                        ? ExternalOpen()
                            .email(subject: item.description, query: {
                            'subject': 'Desde la app',
                            'body': 'Hola te escribo desde la app',
                          })
                        : null;
                // TODO toast no accion
              },
            ),
        ],
      );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              child: ImageFadeAsset(
                image: 'assets/images/No data-cuate.svg',
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 20,
              ),
              child: Text(
                descriptionNoItem ??
                    'Parece que no hay informacion para mostrar',
                style: Theme.of(context).primaryTextTheme.subtitle1,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: PrimaryButton(
                labelText: descriptionButton ?? 'Volver a cargar',
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
}
