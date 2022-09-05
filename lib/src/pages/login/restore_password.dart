import 'package:flutter/material.dart';

import '../../routes/navigation.dart';
import '../../widget/alerts/alert_description.dart';
import '../../widget/buttons/secondary_button.dart';
import '../../widget/loading/loading_logo.dart';
import '../../widget/text_field/text_field_text.dart';

class RestorePasswordScreen extends StatefulWidget {
  static const String routeName = 'restore_password';

  const RestorePasswordScreen({Key? key}) : super(key: key);

  @override
  _RestorePasswordScreenState createState() => _RestorePasswordScreenState();
}

class _RestorePasswordScreenState extends State<RestorePasswordScreen> {
  FocusNode focusCode = FocusNode();
  FocusNode focusPassword = FocusNode();
  FocusNode focusConfirmate = FocusNode();

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    focusCode.dispose();
    focusPassword.dispose();
    focusConfirmate.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async => await showDialog(
        context: context,
        builder: (context) => AlertDescription(
          title: '¿Seguro quieres cancelar el restablecimiento de contraseña?',
          descriptionSucces: 'Cancelar',
          succes: () => navigatePop(context, true),
          descriptionCancel: 'Continuar',
          cancel: () => navigatePop(context, false),
        ),
      ),
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: screenSize.height,
              width: screenSize.width,
              alignment: Alignment.center,
              child: _content(context, screenSize),
            ),
            SafeArea(
              child: IconButton(
                onPressed: () async => await showDialog(
                  context: context,
                  builder: (context) => AlertDescription(
                    title:
                        '¿Seguro quieres cancelar el restablecimiento de contraseña?',
                    descriptionSucces: 'Cancelar',
                    succes: () {
                      navigatePop(context, false);
                      navigatePop(context, true);
                    },
                    descriptionCancel: 'Continuar',
                    cancel: () => navigatePop(context, false),
                  ),
                ),
                icon: Icon(
                  Icons.arrow_back_rounded,
                ),
              ),
            ),
            if (isLoading) LoadingLogo()
          ],
        ),
      ),
    );
  }

  Widget _content(BuildContext context, Size screenSize) =>
      SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Center(
                child: Image.asset(
                  'assets/images/restore_password.png',
                  height: 150,
                ),
              ),
              Container(
                width: screenSize.width,
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  'Restablecer Contraseña',
                  style: Theme.of(context).primaryTextTheme.bodyText1,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                width: screenSize.width,
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Text(
                  'Hemos enviado un código de cuatro dígitos a su correo electrónico.',
                  style: Theme.of(context).primaryTextTheme.subtitle1,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: TextFieldText(
                  description: 'Código',
                  focusNode: focusCode,
                  inputType: TextInputType.emailAddress,
                  inputAction: TextInputAction.next,
                  icon: 'assets/icon/points.png',
                  onTap: () {
                    setState(() {
                      FocusScope.of(context).unfocus();
                      FocusScope.of(context).requestFocus(focusCode);
                    });
                  },
                  onFieldSubmitted: (value) {
                    setState(() {
                      FocusScope.of(context).requestFocus(focusPassword);
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 25),
                child: TextFieldText(
                  description: 'Contaseña',
                  focusNode: focusPassword,
                  icon: 'assets/icon/security.png',
                  inputAction: TextInputAction.next,
                  onTap: () {
                    setState(() {
                      FocusScope.of(context).unfocus();
                      FocusScope.of(context).requestFocus(focusPassword);
                    });
                  },
                  onFieldSubmitted: (value) {
                    setState(() {
                      FocusScope.of(context).requestFocus(focusConfirmate);
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 25),
                child: TextFieldText(
                  description: 'Confirmar contaseña',
                  focusNode: focusConfirmate,
                  icon: 'assets/icon/security.png',
                  inputAction: TextInputAction.send,
                  onTap: () {
                    setState(() {
                      FocusScope.of(context).unfocus();
                      FocusScope.of(context).requestFocus(focusConfirmate);
                    });
                  },
                  onFieldSubmitted: (value) {
                    setState(() {
                      FocusScope.of(context).unfocus();
                    });
                  },
                ),
              ),
              SizedBox(height: 40),
              SecondaryButton(
                labelText: 'RESTABLECER',
                isEnabled: true,
                size: 100,
                onPressed: () async {
                  FocusScope.of(context).unfocus();
                  setState(() {
                    isLoading = true;
                  });
                  await Future.delayed(const Duration(seconds: 2))
                      .then((value) => {})
                      .then((value) {
                    setState(() {
                      isLoading = false;
                    });
                    navigateToLoginRestorePassword(context);
                  });
                },
              ),
            ],
          ),
        ),
      );
}
