import 'package:define_it/theme/config_theme.dart';
import 'package:flutter/material.dart';
import 'router.dart' as route;

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _light = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Settings',
        ),
        titleTextStyle: const TextStyle(
          fontStyle: FontStyle.italic,
          color: Colors.cyanAccent,
          fontWeight: FontWeight.w700,
          fontSize: 25,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                const Icon(
                  Icons.nightlight_round,
                  color: Colors.cyanAccent,
                ),
                const SizedBox(width: 10),
                const Text(
                  "Dark mode",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Switch(
                    value: _light,
                    onChanged: (bool value) {
                      setState(() {
                        currentTheme.toggleTheme();
                        _light = value;
                      });
                    }),
              ],
            ),
            const Divider(
              height: 20,
              thickness: 1,
            ),
            const SizedBox(height: 10),
            Row(
              children: const [
                Icon(Icons.person_2_rounded, color: Colors.cyanAccent),
                SizedBox(width: 10),
                Text(
                  "User info",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Divider(
              height: 20,
              thickness: 1,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.info_outline_rounded, color: Colors.cyanAccent),
                const SizedBox(width: 10),
                 TextButton(   
                    onPressed: () {
                    Navigator.pushNamed(context, route.aboutPage);
                  },
                  child: const Text("About App",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold)
                  ),
                ),
              ],
            ),
            const Divider(
              height: 20,
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }
}
