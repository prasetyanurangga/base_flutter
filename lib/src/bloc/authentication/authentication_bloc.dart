import 'package:baseflutter/src/bloc/authentication/authentication_event.dart';
import 'package:baseflutter/src/bloc/authentication/authentication_state.dart';
import 'package:baseflutter/src/local/model/user_model.dart';
import 'package:baseflutter/src/repository/authentication/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository authenticationRepository;

  AuthenticationBloc({@required this.authenticationRepository})
      : assert(authenticationRepository != null);

  @override
  AuthenticationState get initialState => AuthenticationUninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event,
      ) async* {
    if (event is AuthStarted) {
      final bool hasUser = await authenticationRepository.hasUser();

      if (hasUser) {
        yield AuthenticationAuthenticated();
      } else {
        yield AuthenticationUnauthenticated();
      }
    }

    if (event is LoggedIn) {
      yield AuthenticationLoading();
      UserModel userModel = new UserModel();
      userModel.id = int.parse(event.id);
      userModel.nama = event.nama;
      userModel.email = event.email;
      await authenticationRepository.persistUser(userModel);
      yield AuthenticationAuthenticated();
    }

    if (event is LoggedOut) {
      yield AuthenticationLoading();
      await authenticationRepository.deleteUser();
      yield AuthenticationUnauthenticated();
    }
  }
}