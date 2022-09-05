import 'package:flutter/material.dart';

import '../../routes/navigation.dart';
import '../../utils/theme/colors.dart';
import '../../widget/buttons/secondary_button.dart';
import '../../widget/loading/loading_logo.dart';
import '../../widget/text_field/text_field_text.dart';

class LoginRestorePasswordScreen extends StatefulWidget {
  static const String routeName = 'login_restore_password';
  const LoginRestorePasswordScreen({Key? key}) : super(key: key);

  @override
  State<LoginRestorePasswordScreen> createState() =>
      _LoginRestorePasswordScreenState();
}

class _LoginRestorePasswordScreenState
    extends State<LoginRestorePasswordScreen> {
  FocusNode focusEmail = FocusNode();
  FocusNode focusPassword = FocusNode();

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
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
              onPressed: () => navigatePop(context, true),
              icon: Icon(
                Icons.arrow_back_rounded,
              ),
            ),
          ),
          if (isLoading) LoadingLogo()
        ],
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
                  'assets/images/login_reset_password.png',
                  height: 150,
                ),
              ),
              Container(
                width: screenSize.width,
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  'Inicia Sesión',
                  style: Theme.of(context).primaryTextTheme.bodyText1,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                width: screenSize.width,
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Text(
                  'Su contraseña se ha restablecido correctamente. Ahora inicie sesión con su nueva contraseña.',
                  style: Theme.of(context).primaryTextTheme.subtitle1,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: TextFieldText(
                  description: 'Correo Electronico',
                  focusNode: focusEmail,
                  inputType: TextInputType.emailAddress,
                  inputAction: TextInputAction.next,
                  icon: 'assets/icon/email.png',
                  onTap: () {
                    setState(() {
                      FocusScope.of(context).unfocus();
                      FocusScope.of(context).requestFocus(focusEmail);
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
                  inputAction: TextInputAction.send,
                  onTap: () {
                    setState(() {
                      FocusScope.of(context).unfocus();
                      FocusScope.of(context).requestFocus(focusPassword);
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
                labelText: 'CONTINUAR',
                isEnabled: true,
                size: 100,
                onPressed: () async {
                  FocusScope.of(context).unfocus();
                  setState(() {
                    isLoading = true;
                  });
                  await Future.delayed(const Duration(seconds: 2))
                      .then((value) {
                    setState(() {
                      isLoading = false;
                    });
                    navigateToViewPage(context);
                  });
                },
              ),
              SizedBox(height: 60),
              Center(
                child: GestureDetector(
                  onTap: () => navigateToLoginUntil(context),
                  child: Text(
                    'Volver al inicio',
                    style:
                        Theme.of(context).primaryTextTheme.subtitle1!.copyWith(
                              color: AppColors.primaryColor,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.bold,
                            ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              // Container(
              //   width: 100.w,
              //   padding: EdgeInsets.only(top: 20),
              //   child: Image.asset('assets/text/inicia_sesion.png'),
              // ),
              // SizedBox(
              //   width: 100.w,
              //   child: Image.asset('assets/text/password_resend.png'),
              // ),
              // Padding(
              //   padding: EdgeInsets.only(top: 2.h),
              //   child: TextField(
              //     onChanged: (s) {},
              //     decoration: inputDecoration(
              //       icon: 'assets/img/id_card.png',
              //       hintText: '0000000',
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: EdgeInsets.only(top: 3.h),
              //   child: TextField(
              //     onChanged: (s) {},
              //     decoration: inputDecoration(
              //       icon: 'assets/img/padlock.png',
              //       hintText: 'Contraseña',
              //     ),
              //   ),
              // ),
              // SizedBox(height: 10.h),
              // SecondaryButton(
              //   labelText: 'INGRESAR',
              //   isEnabled: true,
              //   size: 100,
              //   onPressed: () {},
              // ),
              // SizedBox(height: 3.h),
              // OutLineButton(
              //   labelText: 'VOLVER AL INICIO',
              //   isEnabled: true,
              //   size: 100,
              //   onPressed: () {
              //     navigateToLoginCandidate(context, true);
              //   },
              // ),
            ],
          ),
        ),
      );
}
