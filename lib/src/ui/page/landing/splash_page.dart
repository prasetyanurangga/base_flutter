//login.dart
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:baseflutter/src/constant/color.dart';
import 'package:baseflutter/src/constant/list.dart';
import 'package:baseflutter/src/route/base_router.gr.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  BuildContext contexts;


  @override
  void initState() {
    super.initState();
    startTime();
    ListData.permission.forEach((element) =>
        requestPermission(element)
    );
  }

  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, goToLandingPage);
  }

  void goToLandingPage() {
    Router.navigator.pushNamed(Router.landingPage);
  }

  Future<void> requestPermission(Permission permission) async {
    final status = await permission.request();
    setState(() {
      print(status);
    });
  }




  @override
  Widget build(BuildContext context) {

    setState(() => this.contexts = context);

    return Scaffold(
      backgroundColor: AppColors.Putih,
      body: Center(
        child: Container(
          child: Image.asset('assets/images/login_image.png', width : 200.0, height : 100.0),
        ),
      ),
    );
  }


}


