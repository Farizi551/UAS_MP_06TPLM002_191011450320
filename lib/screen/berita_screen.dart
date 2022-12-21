import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:uas/cubit/berita_cubit.dart';

class BeritaScreen extends StatefulWidget {
  const BeritaScreen({Key? key}) : super(key: key);

  @override
  State<BeritaScreen> createState() => _BeritaScreenState();
}

class _BeritaScreenState extends State<BeritaScreen> {
  // Tambahkan cubit->KabarBeritaCubit di screen->KabarBeritaScreen
  final BeritaCubit beritaCubit = BeritaCubit();

  // Tambahkan initState
  @override
  void initState() {
    // Panggil getDataKabarBerita yang ada di KabarBeritaCubit
    beritaCubit.getDataKabarBerita();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Center(child: Text('Luthfi Nur Farizi Ahmad-191011450320')),
            Text('Kabar Terkini'),
          ],
        ),
      ),
      body: BlocBuilder<BeritaCubit, BeritaState>(
        bloc: beritaCubit,
        builder: (context, state) {
          if (state is KabarBeritaInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
            itemCount: beritaCubit.kabarBeritaModel.data?.length ?? 0,
            itemBuilder: (context, index) {
              final parsedDate = DateTime.parse(
                  beritaCubit.kabarBeritaModel.data![index].pubDate!);
              final date = DateFormat('dd-MM-yyyy').format(parsedDate);
              return Card(
                child: ListTile(
                  leading: Image.network(beritaCubit
                      .kabarBeritaModel.data![index].thumbnail!),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  title: Text(
                    beritaCubit.kabarBeritaModel.data![index].title!,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        textAlign: TextAlign.left,
                        date,
                        style: const TextStyle(fontSize: 11),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        textAlign: TextAlign.justify,
                        'ini subtitle dari ' +
                            beritaCubit
                                .kabarBeritaModel.data![index].description!,
                        style: const TextStyle(fontSize: 11),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
