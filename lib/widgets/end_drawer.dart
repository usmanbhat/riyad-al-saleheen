import 'package:flutter/material.dart';

class EndDrawer extends StatelessWidget {
  final List<dynamic> chapters;
  final Function(int) navigateToPage;

  EndDrawer({required this.chapters, required this.navigateToPage});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.brown),
            child: Text(
              'Chapters',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ...chapters.asMap().entries.map((entry) {
            return ListTile(
              title: Text(entry.value['title']),
              onTap: () => navigateToPage(entry.key),
            );
          }).toList(),
        ],
      ),
    );
  }
}
