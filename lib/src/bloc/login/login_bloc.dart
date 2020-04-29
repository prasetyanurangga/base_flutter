import 'dart:async';

import 'package:baseflutter/src/bloc/authentication/authentication_bloc.dart';
import 'package:baseflutter/src/bloc/authentication/authentication_event.dart';
import 'package:baseflutter/src/bloc/login/login_event.dart';
import 'package:baseflutter/src/bloc/login/login_state.dart';
import 'package:baseflutter/src/http/response_data.dart';
import 'package:baseflutter/src/model/login_response_model.dart';
import 'package:baseflutter/src/repository/login/login_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository loginRepository;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({
    @required this.loginRepository,
    @required this.authenticationBloc,
  });

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      print("Test");
      yield LoginLoading();

      try {
        final ResponseData<LoginResponseModel> response =
        await loginRepository.logins(event.email, event.password);
        print("hai");
        print(response);
        if (response.status == Status.ConnectivityError) {
          //Internet problem
          yield const LoginFailure(error: "");
        }
        if (response.status == Status.Success) {
          print("Berhasil");
          print(response.message);
          authenticationBloc.add(LoggedIn(id: response.data.data.id.toString(), email: response.data.data.email, nama: response.data.data.nama.toString()));
          yield LoginSuccess();
        } else {
          yield LoginFailure(error: response.message);
        }
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
    else if(event is LogOutButtonPressed)
      {
        authenticationBloc.add(LoggedOut());
        yield LogoutSuccess();
      }
  }
}