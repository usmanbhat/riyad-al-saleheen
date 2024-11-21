import 'package:flutter/material.dart';

class TafseerPage extends StatelessWidget {
  final Map<String, dynamic> ayah;

  TafseerPage({required this.ayah});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tafseer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ayah['title'],
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold, height: 2),
                  textDirection: TextDirection.rtl,
                ),
                SizedBox(height: 8),
                Text(
                  ayah['details'],
                  textDirection: TextDirection.rtl,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
