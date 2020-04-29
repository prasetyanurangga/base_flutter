//login.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:baseflutter/src/bloc/authentication/authentication_bloc.dart';
import 'package:baseflutter/src/bloc/login/login_bloc.dart';
import 'package:baseflutter/src/repository/login/login_repository.dart';
import 'package:baseflutter/src/ui/page/login/login_form.dart';
import 'package:baseflutter/src/constant/color.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';

class LoginPage extends StatelessWidget {
  final LoginRepository loginRepository;
  LoginPage({Key key, this.title, @required this.loginRepository})
      :
        super(key: key);
  final String title;

  Widget build(BuildContext context) {
    return new  Scaffold(
        backgroundColor: AppColors.BiruMuda,
        resizeToAvoidBottomPadding: false,
        body :  RepositoryProvider(
          create: (context) => loginRepository,
          child: BlocProvider(
            create: (context){
              return LoginBloc(
                  authenticationBloc : BlocProvider.of<AuthenticationBloc>(context),
                  loginRepository: loginRepository
              );
            },
            child: KeyboardAvoider(
              autoScroll: true,
              child: LoginForm(),
            ),
          ),
        )
    );
  }
}
