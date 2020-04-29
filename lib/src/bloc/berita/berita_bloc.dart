import 'dart:async';

import 'package:baseflutter/src/bloc/berita/berita_event.dart';
import 'package:baseflutter/src/bloc/berita/berita_state.dart';
import 'package:baseflutter/src/http/response_data.dart';
import 'package:baseflutter/src/model/berita_model.dart';
import 'package:baseflutter/src/repository/berita/berita_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class BeritaBloc extends Bloc<BeritaEvent, BeritaState> {
  final BeritaRepository beritaRepository;

  BeritaBloc({
    @required this.beritaRepository
  });

  @override
  BeritaState get initialState => BeritaInitial();

  @override
  Stream<BeritaState> mapEventToState(BeritaEvent event) async* {
    if (event is Fetch) {
      print("Test");
      yield BeritaLoading();
      try {
        final ResponseData<BeritaModel> response =
        await beritaRepository.getBeritas();
        print("hai");
        print(response);
        if (response.status == Status.ConnectivityError) {
          //Internet problem
          yield const BeritaFailure(error: "");
        }
        if (response.status == Status.Success) {
          yield BeritaSuccess(beritaModel: response.data);
        } else {
          yield BeritaFailure(error: response.message);
        }
      } catch (error) {
        yield BeritaFailure(error: error.toString());
      }
    }
  }
}