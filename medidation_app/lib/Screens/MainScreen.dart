import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:medidation_app/modules/item_module.dart';
import 'package:just_audio/just_audio.dart';
import 'package:bordered_text/bordered_text.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final AudioPlayer audioPlayer = AudioPlayer();
  int? playIndex;

  List<Item> items = [
    Item(
        name: "Forest",
        imagePath: "meditation_images/forest.jpeg",
        audioPath: "meditation_audios/forest.mp3"),
    Item(
        name: "Ocean",
        imagePath: "meditation_images/ocean.jpeg",
        audioPath: "meditation_audios/ocean.mp3"),
    Item(
        name: "Night Sounds",
        imagePath: "meditation_images/night.jpeg",
        audioPath: "meditation_audios/night.mp3"),
    Item(
        name: "Waterfall",
        imagePath: "meditation_images/waterfall.jpeg",
        audioPath: "meditation_audios/waterfall.mp3"),
    Item(
        name: "Wind",
        imagePath: "meditation_images/wind.jpeg",
        audioPath: "meditation_audios/wind.mp3")
  ];

  Widget myFunction(BuildContext, int index) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage(items[index].imagePath))),
        child: ListTile(
          leading: BorderedText(
            strokeColor: Colors.black,
            child:  Text(items[index].name,style:  const TextStyle(fontSize: 34,fontWeight: FontWeight.bold),),
            
          ),
          trailing: IconButton(
            icon:
                playIndex == index ? const Icon(Icons.stop,size: 34,) : const Icon(Icons.play_arrow,size: 34,),
            onPressed: () {
              if (playIndex == index) {
                setState(() {
                  playIndex = null;
                });
                audioPlayer.stop();
              } else {
                audioPlayer.setAsset(items[index].audioPath);
                audioPlayer.play();

                setState(() {
                  playIndex = index;
                });
              }
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView.builder(
              itemBuilder: myFunction, itemCount: items.length)),
    );
  }
}
