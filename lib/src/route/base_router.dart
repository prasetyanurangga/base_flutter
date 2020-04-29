import 'package:auto_route/auto_route.dart';
import 'package:auto_route/auto_route_annotations.dart';
import 'package:baseflutter/src/ui/page/berita/berita_page.dart';
import 'package:baseflutter/src/ui/page/berita/detail_gridimage_page.dart';
import 'package:baseflutter/src/ui/page/landing/landing_page.dart';

@MaterialAutoRouter()
class $Router {
  @initial
  LandingPage landingPage;

  @CustomRoute(transitionsBuilder: TransitionsBuilders.fadeIn, durationInMilliseconds: 400)
  BeritaPage beritaPage;

  @CustomRoute(transitionsBuilder: TransitionsBuilders.fadeIn, durationInMilliseconds: 400)
  DetailGridImagePage detailGridImagePage;

}