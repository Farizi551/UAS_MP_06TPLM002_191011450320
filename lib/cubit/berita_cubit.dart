import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:uas/request/berita_request.dart';

import '../model/berita_model.dart';

part 'berita_state.dart';

class BeritaCubit extends Cubit<BeritaState> {
  BeritaCubit() : super(KabarBeritaInitial());

  // Tambahakan Cubit KabarBeritaRequest
  final BeritaRequest kabarBeritaRequest = BeritaRequest();

  // Tambahakan Model KabarBeritaModel
  BeritaModel kabarBeritaModel = BeritaModel();

  // Tambahakan Function getDataKabarBerita yang akan digunanan nanti di Screen
  getDataKabarBerita() async {
    emit(KabarBeritaInitial());
    kabarBeritaModel = await kabarBeritaRequest.getKabarBerita();
    emit(DataKabarBerita(kabarBeritaModel));
  }
}
