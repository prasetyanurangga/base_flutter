// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:baseflutter/src/ui/page/berita/detail_gridimage_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:baseflutter/src/model/berita_model.dart';
import 'package:baseflutter/src/ui/page/landing/landing_page.dart';
import 'package:baseflutter/src/ui/page/berita/berita_page.dart';

class Router {
  static const landingPage = '/';
  static const beritaPage = '/berita-page';
  static const loginPage = '/login-page';
  static const detailGridImagePage = '/detail-grid-image-page';
  static final navigator = ExtendedNavigator();
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Router.landingPage:
        return MaterialPageRoute<dynamic>(
          builder: (_) => LandingPage(),
          settings: settings,
        );
      case Router.beritaPage:
        if (hasInvalidArgs<beritaPageArguments>(args)) {
          return misTypedArgsRoute<beritaPageArguments>(args);
        }
        final typedArgs = args as beritaPageArguments ?? beritaPageArguments();
        return PageRouteBuilder<dynamic>(
          pageBuilder: (ctx, animation, secondaryAnimation) =>
              BeritaPage(key: typedArgs.key, title: typedArgs.title),
          settings: settings,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          transitionDuration: Duration(milliseconds: 400),
        );
      case Router.detailGridImagePage:
        if (hasInvalidArgs<DetailGridImagePageArguments>(args)) {
          return misTypedArgsRoute<DetailGridImagePageArguments>(args);
        }
        final typedArgs = args as DetailGridImagePageArguments ?? DetailGridImagePageArguments();
        return PageRouteBuilder<dynamic>(
          pageBuilder: (ctx, animation, secondaryAnimation) =>
              DetailGridImagePage(key: typedArgs.key, title: typedArgs.title, data: typedArgs.data, count: typedArgs.count),
          settings: settings,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          transitionDuration: Duration(milliseconds: 400),
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

//**************************************************************************
// Arguments holder classes
//***************************************************************************

//beritaPage arguments holder class
class beritaPageArguments {
  final Key key;
  final String title;
  beritaPageArguments({this.key, this.title});
}

//DetailGridImagePage arguments holder class
class DetailGridImagePageArguments {
  final Key key;
  final String title;
  final int count;
  final List<Foto> data;
  DetailGridImagePageArguments({this.key, this.title, this.count, this.data});
}
