import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthStarted extends AuthenticationEvent {}

class LoggedIn extends AuthenticationEvent {
  final String id;
  final String email;
  final String nama;

  const LoggedIn({@required this.id, @required this.email, @required this.nama});

  @override
  List<Object> get props => [id, email, nama];

  @override
  String toString() => 'LoggedIn { token: $id }';
}

class LoggedOut extends AuthenticationEvent {}