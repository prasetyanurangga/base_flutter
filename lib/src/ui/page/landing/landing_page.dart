import 'package:baseflutter/src/ui/page/berita/berita_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:baseflutter/src/bloc/authentication/authentication_bloc.dart';
import 'package:baseflutter/src/bloc/authentication/authentication_state.dart';
import 'package:baseflutter/src/constant/env.dart';
import 'package:baseflutter/src/http/api_provider.dart';
import 'package:baseflutter/src/repository/login/login_repository.dart';
import 'package:baseflutter/src/ui/page/landing/splash_page.dart';
import 'package:baseflutter/src/ui/page/login/login_page.dart';
import 'package:baseflutter/src/utils/internet_check.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is AuthenticationLoading) {
           //return const LoadingWidget();
          }

          if (state is AuthenticationAuthenticated) {
            return BeritaPage();
          }
          if (state is AuthenticationUnauthenticated) {
            return LoginPage(
                loginRepository: LoginRepository(
                    env: RepositoryProvider.of<Env>(context),
                    apiProvider: RepositoryProvider.of<ApiProvider>(context),
                    internetCheck:
                    RepositoryProvider.of<InternetCheck>(context))
            );
          }
          return SplashPage();
        });
  }
}