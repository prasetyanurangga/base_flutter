import 'package:baseflutter/src/app/simple_bloc_delegate.dart';
import 'package:baseflutter/src/app/theme.dart';
import 'package:baseflutter/src/bloc/authentication/authentication_bloc.dart';
import 'package:baseflutter/src/bloc/authentication/authentication_event.dart';
import 'package:baseflutter/src/bloc/berita/berita_bloc.dart';
import 'package:baseflutter/src/constant/env.dart';
import 'package:baseflutter/src/constant/string.dart';
import 'package:baseflutter/src/http/api_provider.dart';
import 'package:baseflutter/src/repository/authentication/authentication_repository.dart';
import 'package:baseflutter/src/repository/berita/berita_repository.dart';
import 'package:baseflutter/src/route/base_router.gr.dart';
import 'package:baseflutter/src/utils/internet_check.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main(){
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(AppPage());
}

class AppPage extends StatelessWidget {
  var env;
  BeritaRepository beritaRepository;


  AppPage({Key key, @required this.env}) : super(key: key);
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<Env>(
          create: (context) => env,
          lazy: true,
        ),
        RepositoryProvider<InternetCheck>(
          create: (context) => InternetCheck(),
          lazy: true,
        ),
        RepositoryProvider<AuthenticationRepository>(
          create: (context) => AuthenticationRepository(),
          lazy: true,
        ),
        RepositoryProvider<BeritaRepository>(
          create: (context) => BeritaRepository(
              env: RepositoryProvider.of<Env>(context),
              apiProvider: RepositoryProvider.of<ApiProvider>(context),
              internetCheck:
              RepositoryProvider.of<InternetCheck>(context)
          ),
          lazy: true,
        ),
        RepositoryProvider<ApiProvider>(
          create: (context) => ApiProvider(),
          lazy: true,
        ),
      ],
      child: MultiBlocProvider  (
          providers: [
            BlocProvider<AuthenticationBloc>(
              create: (context) {
                return AuthenticationBloc(
                    authenticationRepository :
                    RepositoryProvider.of<AuthenticationRepository>(context))
                  ..add(AuthStarted());
              },
            ),
            BlocProvider<BeritaBloc>(
              create: (context)  => BeritaBloc(
                beritaRepository: BeritaRepository(
                    env: RepositoryProvider.of<Env>(context),
                    apiProvider: RepositoryProvider.of<ApiProvider>(context),
                    internetCheck:
                    RepositoryProvider.of<InternetCheck>(context))
              ),
            ),
          ],
          child: MaterialApp(
            title: Strings.app_name,
            theme: TemaUtama(),
            onGenerateRoute: Router.onGenerateRoute,
            navigatorKey: Router.navigator.key,
            initialRoute: Router.landingPage,
          )
      ),
    );
  }
}
