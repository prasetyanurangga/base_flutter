import 'package:baseflutter/src/app/app.dart';
import 'package:baseflutter/src/bloc/app_bloc.dart';
import 'package:baseflutter/src/constant/env.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  BlocSupervisor.delegate = AppBloc();
  runApp(AppPage(env: EnvValue.development));
}
