import 'package:flutter/material.dart';
import 'tafseer_page.dart';
import '../utils/utils.dart';

class AyahListPage extends StatelessWidget {
  final Map<String, dynamic> surah;

  AyahListPage({required this.surah});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(surah['stitle']),
      ),
      body: FutureBuilder(
        future: Utils.loadTafseerJson(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          final ayahs = snapshot.data as List<dynamic>;
          final filteredAyahs =
              ayahs.where((ayah) => ayah['cate'] == surah['sid']).toList();
          return ListView.builder(
            itemCount: filteredAyahs.length,
            itemBuilder: (context, index) {
              final ayah = filteredAyahs[index];
              return ListTile(
                title: Text(ayah['title']),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TafseerPage(ayah: ayah),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
