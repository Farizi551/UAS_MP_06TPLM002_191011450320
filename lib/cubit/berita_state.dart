part of 'berita_cubit.dart';

@immutable
abstract class BeritaState {}

class KabarBeritaInitial extends BeritaState {}

// Tambahkan State untuk Data Kabar Berita
class DataKabarBerita extends BeritaState {
  final BeritaModel data;
  DataKabarBerita(this.data);
}
