import 'package:flutter/material.dart';

import '../../widget/alerts/alert_exit.dart';
import '../../widget/buttons/out_line_button.dart';
// import '../../widgets/alerts/alert_exit.dart';
// import '../../widgets/buttons/out_line_button.dart';

class ErrorLoadScreen extends StatefulWidget {
  static const String routeName = 'error_load';
  const ErrorLoadScreen({Key? key}) : super(key: key);
  @override
  _ErrorLoadScreenState createState() => _ErrorLoadScreenState();
}

class _ErrorLoadScreenState extends State<ErrorLoadScreen> {
  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: () async => await showDialog(
          context: context,
          builder: (context) => AlertExit(),
        ),
        child: Scaffold(
          body: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  child: SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 5.0),
                        Image.asset(
                          'assets/error.png',
                          height: MediaQuery.of(context).size.height * 0.40,
                        ),
                        Text(
                          'Ooops!',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        Text('Tenemos problemas para cargar los datos',
                            textAlign: TextAlign.center),
                        SizedBox(height: 20.0),
                        ButtonOutLine(
                          description: 'Intentar de nuevo',
                          onPressed: () {},
                          paddingVertical: 15,
                          paddingHorizontal: 20,
                        ),
                        SizedBox(height: 5.0),
                      ],
                    ),
                  ),
                ),
              ),
              SafeArea(
                child: Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    tooltip: 'Ir a inicio de sesión',
                    onPressed: () {
                      // navigateToSplash(context);
                    },
                    icon: Icon(
                      Icons.close_rounded,
                      // color: AppColors.black,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
}
