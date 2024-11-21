import 'package:flutter/material.dart';
import '../utils/themes.dart';

class SideDrawer extends StatelessWidget {
  final Function(ThemeData) onThemeChanged;

  SideDrawer({required this.onThemeChanged});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.brown,
            ),
            child: Text(
              'Settings',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About Us'),
            onTap: () {
              // Navigate to About Page
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.color_lens),
            title: Text('Change Theme'),
            subtitle: DropdownButton<ThemeData>(
              isExpanded: true,
              items: [
                DropdownMenuItem(
                  child: Text("Light"),
                  value: Themes.lightTheme,
                ),
                DropdownMenuItem(
                  child: Text("Dark"),
                  value: Themes.darkTheme,
                ),
                DropdownMenuItem(
                  child: Text("Neon"),
                  value: Themes.neonTheme,
                ),
              ],
              onChanged: (theme) {
                if (theme != null) onThemeChanged(theme);
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
