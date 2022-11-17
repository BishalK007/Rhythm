// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_player_app/pages/onboarding_screen.dart';
import '../pages/aboutPage.dart';
import '../services/fetch_songs.dart';
import '../pages/settings.dart';
import '../pages/downloads.dart';
import '../pages/playlist.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key, required this.audioPlayer}) : super(key: key);
  final AudioPlayer audioPlayer;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.purple,
            ),
            child: Center(
              child: Text(
                'MENU',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.home,
              color: Colors.purple,
            ),
            title: const Text(
              'Home',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.storage,
              color: Colors.purple,
            ),
            title: const Text(
              'Local Music',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Tracks(
                          audioPlayer: audioPlayer,
                        )),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.download,
              color: Colors.purple,
            ),
            title: const Text(
              'Downloads',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Downloads()));
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.playlist_play_rounded,
              color: Colors.purple,
            ),
            title: const Text(
              'Playlist',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Playlist()));
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
              color: Colors.purple,
            ),
            title: const Text(
              'Settings',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Settings()));
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.info_outline,
              color: Colors.purple,
            ),
            title: const Text(
              'About',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AppInfo()));
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.logout_rounded,
              color: Colors.purple,
            ),
            title: const Text(
              'Log Out',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () async {
              //Firebase logout implementation will be done
              await FirebaseAuth.instance.signOut();

              FirebaseAuth.instance.authStateChanges().listen((User? user) {
                if (user == null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OnboardingPage(
                        audioPlayer: audioPlayer,
                      ),
                    ),
                  );
                } else {
                  // print('User is signed in!');
                }
              });
            },
          ),
        ],
      ),
    );
  }
}