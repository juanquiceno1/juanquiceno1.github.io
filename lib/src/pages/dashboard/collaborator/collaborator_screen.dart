import 'package:flutter/material.dart';

import '../../../routes/navigation.dart';
import '../../../widget/appbar/app_bar_back.dart';
import '../../../widget/cards/card_description.dart';

class CollaboratorScreen extends StatefulWidget {
  static const String routeName = 'collaborator';

  const CollaboratorScreen({Key? key}) : super(key: key);

  @override
  _CustomerScreenState createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CollaboratorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _content(context),
    );
  }

  Widget _content(BuildContext context) => SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              AppBarBack(
                title: 'Mis Colaboradores',
                onBack: () => navigatePop(context, true),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Column(
                  children: [
                    CardDescription(
                      icon: 'assets/images/alert.png',
                      description: 'Reportar AT',
                      onPress: () {},
                    ),
                    CardDescription(
                      icon: 'assets/images/megaphone.png',
                      description: 'Reportar Novedades',
                      onPress: () {},
                    ),
                    CardDescription(
                      icon: 'assets/images/call.png',
                      description: 'Atención Virtual',
                      onPress: () {},
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
}
