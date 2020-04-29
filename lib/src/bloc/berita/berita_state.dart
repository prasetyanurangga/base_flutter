import 'package:baseflutter/src/model/berita_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class BeritaState extends Equatable {
  const BeritaState();

  @override
  List<Object> get props => [];
}

class BeritaInitial extends BeritaState {}

class BeritaLoading extends BeritaState {}

class BeritaSuccess extends BeritaState {
  final BeritaModel beritaModel;

  BeritaSuccess({@required this.beritaModel});

}

class BeritaFailure extends BeritaState {
  final String error;

  const BeritaFailure({@required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'BeritaFailure { error: $error }';
}
