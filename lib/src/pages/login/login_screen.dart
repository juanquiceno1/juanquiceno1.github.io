import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/login/login_bloc.dart';
import '../../models/auth/auth_model.dart';
import '../../routes/navigation.dart';
import '../../utils/theme/colors.dart';
import '../../widget/alerts/alert_description.dart';
import '../../widget/buttons/secondary_button.dart';
import '../../widget/loading/loading_logo.dart';
import '../../widget/text_field/text_field_text.dart';
import '../../widget/toast/toast_generic.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'login';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenScreenState createState() => _LoginScreenScreenState();
}

class _LoginScreenScreenState extends State<LoginScreen> {
  final _keyform = GlobalKey<FormState>();
  LoginBloc loginBloc = LoginBloc();
  AuthModel model = AuthModel.fromJson({});
  bool _isLoading = false;

  FocusNode focusEmail = FocusNode();
  FocusNode focusNit = FocusNode();
  FocusNode focusPassword = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    focusEmail.unfocus();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async => await showDialog(
        context: context,
        builder: (context) => AlertDescription(
          title: '¿Seguro quieres salir de la aplicación?',
          descriptionSucces: 'Salir',
          succes: () => navigatePop(context, true),
          descriptionCancel: 'Cancelar',
          cancel: () => navigatePop(context, false),
        ),
      ),
      child: Scaffold(
        body: BlocBuilder<LoginBloc, LoginState>(
          bloc: loginBloc,
          builder: (context, state) {
            if (state is Loading) {
              Future.delayed(Duration.zero, () {
                setState(() {
                  _isLoading = true;
                });
              });
            }
            if (state is LoginSuccesState) {
              loginBloc.add(LoginInitialEvent());
              Future.delayed(Duration.zero, () {
                navigateToViewPage(context);
              });
            }
            if (state is LoginErrorState) {
              loginBloc.add(LoginInitialEvent());
              Future.delayed(Duration.zero, () {
                setState(() {
                  _isLoading = false;
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
                if (_isLoading) LoadingLogo(),
              ],
            );
          },
        ),
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
                      'assets/images/hello.png',
                      height: 150,
                    ),
                  ),
                  Container(
                    width: screenSize.width,
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      '¡Hola Cliente!',
                      style: Theme.of(context).primaryTextTheme.bodyText1,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 25),
                    child: TextFieldText(
                      description: 'NIT',
                      focusNode: focusNit,
                      initialValue: '1125879494',
                      inputType: TextInputType.number,
                      inputAction: TextInputAction.next,
                      icon: 'assets/icon/nit.png',
                      onTap: () {
                        setState(() {
                          FocusScope.of(context).unfocus();
                          FocusScope.of(context).requestFocus(focusNit);
                        });
                      },
                      onFieldSubmitted: (value) {
                        setState(() {
                          FocusScope.of(context).requestFocus(focusPassword);
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
                        model.nit = value.toString();
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 25),
                    child: TextFieldText(
                      description: 'Contaseña',
                      initialValue: '9494',
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Contraseña Requerida';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        model.password = value.toString();
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 10,
                      top: 10,
                    ),
                    child: TextButton(
                      onPressed: () => navigateToRecoverPassword(context),
                      child: Text(
                        'Olvide mi Contraseña',
                        style: Theme.of(context).primaryTextTheme.subtitle1,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  SecondaryButton(
                    labelText: 'Ingresar',
                    isEnabled: true,
                    size: 100,
                    onPressed: () async {
                      FocusScope.of(context).unfocus();
                      if (_keyform.currentState != null) {
                        if (_keyform.currentState!.validate()) {
                          _keyform.currentState!.save();
                          loginBloc.add(LoginClientEvent(model));
                        }
                      }
                    },
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 15),
                          height: 2,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      Text(
                        'Ingresar con',
                        style: Theme.of(context).primaryTextTheme.subtitle1,
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 15),
                          height: 2,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Image.asset(
                          'assets/icon/google.png',
                          height: 50,
                        ),
                      ),
                      SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {},
                        child: Image.asset(
                          'assets/icon/facebook.png',
                          height: 50,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      );
}
