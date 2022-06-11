import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

bool isSwiteched = false;

class drawer extends StatefulWidget {
  const drawer({
    Key? key,
  }) : super(key: key);

  @override
  State<drawer> createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            AppBar(
              title: Text(
                'Holy Quran',
                style: TextStyle(),
              ),
              backgroundColor: Colors.transparent.withOpacity(0.2),
              elevation: 0,
              automaticallyImplyLeading: false,
            ),
            ListTile(
              leading: Icon(Icons.nightlight),
              title: const Text('Dark Mode'),
              trailing: Switch(
                value: isSwiteched,
                onChanged: (value) {
                  setState(() {
                    isSwiteched = value;
                    isSwiteched
                        ? AdaptiveTheme.of(context).setDark()
                        : AdaptiveTheme.of(context).setLight();
                  });
                },
              ),
            ),
            ListTile(
              leading: Icon(Icons.share),
              title: const Text('Share'),
              onTap: () async{
                  await Share.share('https://www.instagram.com/ameen_aash/');
              },
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: const Text('Contact Us'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.verified_user_outlined),
              title: const Text('Terms & Conditions'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.privacy_tip_outlined),
              title: const Text('Privacy Policy'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: const Text('About'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
