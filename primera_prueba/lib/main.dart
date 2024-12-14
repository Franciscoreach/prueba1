import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:primera_prueba/detalles_animales/bird_detail.dart';
import 'package:primera_prueba/detalles_animales/cat_detail.dart';
import 'package:primera_prueba/detalles_animales/cow_detail.dart';
import 'package:primera_prueba/detalles_animales/dog_detail.dart';
import 'package:primera_prueba/detalles_animales/horse_detail.dart';
import 'package:primera_prueba/detalles_animales/lion_detail.dart';
import 'package:primera_prueba/detalles_animales/rooster_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late AudioPlayer player;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  void playAudio(String audioFile) async {
    try {
      await player.setAsset(audioFile);
      player.play();
      setState(() {
        isPlaying = true;
      });
    } catch (e) {
      print("Error al reproducir el audio: $e");
    }
  }

  void togglePlayPause() {
    if (isPlaying) {
      player.pause();
      setState(() {
        isPlaying = false;
      });
    } else {
      player.play();
      setState(() {
        isPlaying = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DiscoverScreen(isPlaying: isPlaying, togglePlayPause: togglePlayPause),
    );
  }
}

class DiscoverScreen extends StatelessWidget {
  final bool isPlaying;
  final VoidCallback togglePlayPause;

  const DiscoverScreen({super.key, required this.isPlaying, required this.togglePlayPause});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFF2E4A46),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2E4A46),
        elevation: 0,
        leading: const Icon(Icons.menu, color: Colors.white),
        actions: [
          const Icon(Icons.search, color: Colors.white),
          SizedBox(width: size.width * 0.04),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Discover',
              style: TextStyle(
                color: Colors.white,
                fontSize: size.width * 0.08,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Our majestic world together',
              style: TextStyle(
                color: Colors.white70,
                fontSize: size.width * 0.04,
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Expanded(
              child: ListView(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LionDetail(),
                        ),
                      );
                    },
                    child: CategoryCard(
                      title: 'León',
                      images: const ['assets/img/lion.jpg'],
                      audioFile: 'assets/mp3/lion.mp3',
                      isPlaying: isPlaying,
                      onPlay: (audioFile) {
                        (context as Element).findAncestorStateOfType<_MyAppState>()?.playAudio(audioFile);
                      },
                      onPause: togglePlayPause,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CatDetail(),
                        ),
                      );
                    },
                    child: CategoryCard(
                      title: 'Gato',
                      images: const ['assets/img/cat.jpg'],
                      audioFile: 'assets/mp3/cat.mp3',
                      isPlaying: isPlaying,
                      onPlay: (audioFile) {
                        (context as Element).findAncestorStateOfType<_MyAppState>()?.playAudio(audioFile);
                      },
                      onPause: togglePlayPause,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CowDetail(),
                        ),
                      );
                    },
                    child: CategoryCard(
                      title: 'Vaca',
                      images: const ['assets/img/cow.jpg'],
                      audioFile: 'assets/mp3/cow.mp3',
                      isPlaying: isPlaying,
                      onPlay: (audioFile) {
                        (context as Element).findAncestorStateOfType<_MyAppState>()?.playAudio(audioFile);
                      },
                      onPause: togglePlayPause,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DogDetail(),
                        ),
                      );
                    },
                    child: CategoryCard(
                      title: 'Perro',
                      images: const ['assets/img/dog.jpg'],
                      audioFile: 'assets/mp3/dog.mp3',
                      isPlaying: isPlaying,
                      onPlay: (audioFile) {
                        (context as Element).findAncestorStateOfType<_MyAppState>()?.playAudio(audioFile);
                      },
                      onPause: togglePlayPause,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HorseDetail(),
                        ),
                      );
                    },
                    child: CategoryCard(
                      title: 'Caballo',
                      images: const ['assets/img/horse.jpg'],
                      audioFile: 'assets/mp3/horse.mp3',
                      isPlaying: isPlaying,
                      onPlay: (audioFile) {
                        (context as Element).findAncestorStateOfType<_MyAppState>()?.playAudio(audioFile);
                      },
                      onPause: togglePlayPause,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BirdDetail(),
                        ),
                      );
                    },
                    child: CategoryCard(
                      title: 'Pájaro',
                      images: const ['assets/img/bird.jpg'],
                      audioFile: 'assets/mp3/bird.mp3',
                      isPlaying: isPlaying,
                      onPlay: (audioFile) {
                        (context as Element).findAncestorStateOfType<_MyAppState>()?.playAudio(audioFile);
                      },
                      onPause: togglePlayPause,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RoosterDetail(),
                        ),
                      );
                    },
                    child: CategoryCard(
                      title: 'Gallo',
                      images: const ['assets/img/rooster.jpg'],
                      audioFile: 'assets/mp3/rooster.mp3',
                      isPlaying: isPlaying,
                      onPlay: (audioFile) {
                        (context as Element).findAncestorStateOfType<_MyAppState>()?.playAudio(audioFile);
                      },
                      onPause: togglePlayPause,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final List<String> images;
  final String audioFile;
  final Function(String) onPlay;
  final VoidCallback onPause;
  final bool isPlaying;

  const CategoryCard({
    super.key,
    required this.title,
    required this.images,
    required this.audioFile,
    required this.onPlay,
    required this.onPause,
    required this.isPlaying,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              images.first,
              width: double.infinity,
              height: size.height * 0.25,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: double.infinity,
            height: size.height * 0.25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.6),
                  Colors.transparent,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          Positioned(
            bottom: size.height * 0.02,
            left: size.width * 0.04,
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: size.width * 0.05,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            bottom: size.height * 0.02,
            right: size.width * 0.04,
            child: IconButton(
              icon: Icon(
                isPlaying ? Icons.pause_circle_filled : Icons.play_circle_fill,
                color: Colors.redAccent,
                size: 60,
              ),
              onPressed: isPlaying ? onPause : () => onPlay(audioFile),
            ),
          ),
        ],
      ),
    );
  }
}
