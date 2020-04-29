import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:baseflutter/src/bloc/login/login_bloc.dart';
import 'package:baseflutter/src/bloc/login/login_event.dart';
import 'package:baseflutter/src/bloc/login/login_state.dart';
import 'package:baseflutter/src/constant/color.dart';
import 'package:baseflutter/src/constant/dimens.dart';
import 'package:baseflutter/src/ui/component/atoms/button.dart';
import 'package:baseflutter/src/ui/component/atoms/passwordfield.dart';
import 'package:baseflutter/src/ui/component/atoms/textfield.dart';
import 'package:baseflutter/src/ui/component/molecules/dialog/dialog_loading.dart';

class LoginForm extends StatefulWidget {
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _onLoginButtonPressed(test) {
    print(LoginButtonPressed(
      email: _emailController.text,
      password: _passwordController.text,
    ).toString());
    BlocProvider.of<LoginBloc>(context).add(
      LoginButtonPressed(
        email: _emailController.text,
        password: _passwordController.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {



    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('${state.error}'),
              backgroundColor: Theme.of(context).errorColor,
            ),
          );
        }

        if(state is LoginSuccess)
          {
            Navigator.pop(context);
          }

        if(state is LoginLoading)
          {
            Dialog simpleDialog =  Dialog(

              backgroundColor: AppColors.Putih,
              child: DialogLoading(contexts : context ),
            );
            showDialog(
                context: context,
                builder: (BuildContext context) => simpleDialog,
                barrierDismissible: false,
            );
          }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return WillPopScope(
            onWillPop: () async {
              return new Future(() => false); //return a `Future` with false value so this route cant be popped or closed.
            },
            child: Container(
              child: Column(
                children: [
                  Container(
                    child : Image.asset('assets/images/login_image.png', width : 200.0, height : 100.0),
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height * 0.5,
                  ),
                  Container(

                    margin: EdgeInsets.only(top:Dimens.Level_5,right:Dimens.Level_5,left:Dimens.Level_5,bottom:Dimens.Level_0),
                    padding: EdgeInsets.all(Dimens.Level_2),
                    decoration: BoxDecoration(
                      color: AppColors.Putih,
                      borderRadius: new BorderRadius.all(const Radius.circular(Dimens.Level_2)),
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: Dimens.Level_3, top : Dimens.Level_0,right: Dimens.Level_3,bottom: Dimens.Level_0),
                          child: new TextFieldComponent(hint :"Email", controller: _emailController),
                        ),
                        Divider(
                          color: AppColors.AbuAbu,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: Dimens.Level_3, top : Dimens.Level_0,right: Dimens.Level_3,bottom: Dimens.Level_0),
                          child: new PasswordFieldComponent(hint :"Password", controller: _passwordController),
                        )
                      ],
                    ),
                  ),
                  Container(

                    margin: EdgeInsets.only(top : Dimens.Level_3,left : Dimens.Level_5,right : Dimens.Level_5,bottom : Dimens.Level_5),

                    child : new ButtonComponent(
                      label : "Login", onPress: _onLoginButtonPressed , contexts: "test" ,
                    ),
                  ),

                ],
              ),
            ),
          );
        },
      ),
    );
  }



}
