import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../routes/navigation.dart';
import '../../utils/preferences/preferences_user.dart';
import '../../utils/resposive/responsive.dart';
import '../../utils/theme/colors.dart';
import '../../widget/alerts/alert_description.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = 'loading';

  const SplashScreen({Key? key}) : super(key: key);
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      FocusScope.of(context).unfocus();
    });
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.black26, statusBarBrightness: Brightness.light));
    controller = AnimationController(
        duration: const Duration(milliseconds: 800), vsync: this);
    animation = Tween(begin: 0.0, end: 0.8).animate(controller)
      ..addListener(() {
        setState(() {
          /* the state that has changed here is the animation object’s value*/
        });
      });
    controller.forward();
    startTime();
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
            cancel: () => navigatePop(context, false)),
      ),
      child: Scaffold(
          body: Container(
        height: screenSize.height,
        width: screenSize.width,
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // Image.asset(
                  //   'assets/loading.gif',
                  //   height: 60,
                  // ),
                  Image.asset(
                    'assets/loading.gif',
                    height: 20.h,
                  ),

                  // SizedBox(height: 20.0),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: Responsive.isMobile(context) ? 60.w : 30.w,
                margin: EdgeInsets.only(bottom: 20.0),
                padding: EdgeInsets.all(0.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: LinearProgressIndicator(
                    minHeight: 5.0,
                    value: animation.value,
                    // color: Theme.of(context).primaryTextTheme., //AppColors.white,
                    backgroundColor: AppColors.grey,
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }

  startTime() async {
    var duration = Duration(milliseconds: 500);
    return Timer(duration, _loadintial);
  }

  startTime2() async {
    var duration = Duration(milliseconds: 500);
    return Timer(duration, postConsulta);
  }

  void _loadintial() async {
    try {
      startTime2();
    } catch (e) {
      navigateToErrorLoad(context);
    }
  }

  void postConsulta() async {
    controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    animation = Tween(begin: 0.8, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {
          /* the state that has changed here is the animation object’s value*/
        });
      });
    await controller.forward().then(
          (value) => {
            if (PreferencesUser().token != null &&
                PreferencesUser().token != '' &&
                PreferencesUser().document != null &&
                PreferencesUser().document != '')
              {
                navigateToViewPage(context),
              }
            else
              {
                navigateToLogin(context),
              }
          },
        );
  }
}
