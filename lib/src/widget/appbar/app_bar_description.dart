import 'package:client/src/widget/pop_menu/pop_menu_custom.dart';
import 'package:flutter/material.dart';

class AppBarDescription extends StatelessWidget {
  final String title;
  final Widget? onOption;
  const AppBarDescription({Key? key, required this.title, this.onOption})
      : super(key: key);

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context).primaryTextTheme.bodyText1,
                  textAlign: TextAlign.left,
                ),
              ),
              onOption ?? PopMenuCustom()
            ],
          ),
        ),
      );
}
