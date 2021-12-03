import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class Music extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Music> {
  // late AudioPlayer player;
  late AudioPlayer player2;

  @override
  void initState() {
    super.initState();
    // player = AudioPlayer();
    player2 = AudioPlayer();
  }

  // @override
  // void dispose() {
  //   // player.dispose();
  //   player2.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ElevatedButton(
              //   onPressed: () async {
              //     await player.setAsset('assets/audio/cow.mp3');
              //     // final url =
              //     //     'https://www.applesaucekids.com/sound%20effects/moo.mp3';
              //     // await player.setUrl(url);
              //     player.play();
              //   },
              //   child: Text('Cow'),
              // ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () async {
                  // await player2.setAsset('assets/audio/horse.mp3');
                  final url =
                      'https://res.cloudinary.com/dytnlsq2h/video/upload/v1579881718/Without_me.mp3';
                  await player2.setUrl(url);
                  player2.play();
                },
                child: Text('play'),
              ),
              ElevatedButton(
                onPressed: () async {
                  // await player2.setAsset('assets/audio/horse.mp3');

                  player2.stop();
                },
                child: Text('pause'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
