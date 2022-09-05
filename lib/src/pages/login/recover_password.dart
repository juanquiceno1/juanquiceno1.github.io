import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/login/login_bloc.dart';
import '../../routes/navigation.dart';
import '../../widget/buttons/secondary_button.dart';
import '../../widget/loading/loading_logo.dart';
import '../../widget/text_field/text_field_text.dart';
import '../../widget/toast/toast_generic.dart';

class RecoverPasswordScreen extends StatefulWidget {
  static const String routeName = 'recover_password_screen';

  const RecoverPasswordScreen({Key? key}) : super(key: key);

  @override
  _RecoverPasswordScreenState createState() => _RecoverPasswordScreenState();
}

class _RecoverPasswordScreenState extends State<RecoverPasswordScreen> {
  final _keyform = GlobalKey<FormState>();
  LoginBloc loginBloc = LoginBloc();
  FocusNode focusDocument = FocusNode();

  bool isLoading = false;
  String document = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    focusDocument.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocBuilder<LoginBloc, LoginState>(
        bloc: loginBloc,
        builder: (context, state) {
          if (state is Loading) {
            Future.delayed(Duration.zero, () {
              setState(() {
                isLoading = true;
              });
            });
          }
          if (state is LoginRecoverSuccessState) {
            loginBloc.add(LoginInitialEvent());
            Future.delayed(Duration.zero, () {
              navigateToRestorePassword(context);
              isLoading = false;
            });
          }
          if (state is LoginErrorState) {
            loginBloc.add(LoginInitialEvent());
            Future.delayed(Duration.zero, () {
              setState(() {
                isLoading = false;
              });
              ToastGeneric.error(
                context: context,
                title: state.title,
                description: state.message,
              );
            });
          }
          return Stack(
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
          );
        },
      ),
    );
  }

  Widget _content(BuildContext context, Size screenSize) =>
      SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: SafeArea(
            child: Form(
              key: _keyform,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Center(
                    child: Image.asset(
                      'assets/images/recover_password.png',
                      height: 150,
                    ),
                  ),
                  Container(
                    width: screenSize.width,
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      'Recuperar Contraseña',
                      style: Theme.of(context).primaryTextTheme.bodyText1,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    width: screenSize.width,
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: Text(
                      'Si has olvidado tu contraseña, proporciona tu dirección de correo electrónico y te enviaremos un email con instrucciones de cómo recuperarla.',
                      style: Theme.of(context).primaryTextTheme.subtitle1,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: TextFieldText(
                      description: 'Documento',
                      initialValue: '1125879494',
                      focusNode: focusDocument,
                      inputType: TextInputType.number,
                      inputAction: TextInputAction.next,
                      icon: 'assets/icon/document.png',
                      onTap: () {
                        setState(() {
                          FocusScope.of(context).unfocus();
                          FocusScope.of(context).requestFocus(focusDocument);
                        });
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Documento Requerido';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        document = value.toString();
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: SecondaryButton(
                      labelText: 'CONTINUAR',
                      isEnabled: true,
                      size: 100,
                      onPressed: () async {
                        FocusScope.of(context).unfocus();
                        if (_keyform.currentState != null) {
                          if (_keyform.currentState!.validate()) {
                            _keyform.currentState!.save();
                            loginBloc
                                .add(LoginRecoverEvent(document: document));
                          }
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      );
}
