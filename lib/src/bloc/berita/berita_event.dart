import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class BeritaEvent extends Equatable {
  const BeritaEvent();
  @override
  List<Object> get props => [];
}

class Fetch extends BeritaEvent {}