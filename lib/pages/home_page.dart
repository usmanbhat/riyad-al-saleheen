import 'package:flutter/material.dart';
import './ayah_list_page.dart';
import '../utils/utils.dart';
import '../utils/theme_provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Surahs'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Handle search
            },
          ),
          IconButton(
            icon: Icon(Icons.brightness_6),
            onPressed: () {
              ThemeProvider.of(context).toggleTheme();
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: Utils.loadSurahJson(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          final surahs = snapshot.data as List<dynamic>;
          return ListView.builder(
            itemCount: surahs.length,
            itemBuilder: (context, index) {
              final surah = surahs[index];
              return ListTile(
                title: Text(surah['stitle']),
                subtitle: Text(surah['sType']),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AyahListPage(surah: surah),
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
