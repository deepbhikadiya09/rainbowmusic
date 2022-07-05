import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
class FirstScr extends StatefulWidget {
  const FirstScr({Key? key}) : super(key: key);

  @override
  _FirstScrState createState() => _FirstScrState();
}

class _FirstScrState extends State<FirstScr> {

  List color=[
    Colors.blue,Colors.lightGreen,Colors.amber,Colors.teal,Colors.red,Colors.indigo,Colors.purpleAccent,Colors.pinkAccent,
  ];
  List img = [
  "https://pagalnew.com/coverimages/meri-jaan-meri-jaan-bachchhan-paandey-500-500.jpg",
  "https://pagalnew.com/coverimages/heer-raanjhana-bachchhan-paandey-500-500.jpg",
  "https://pagalnew.com/coverimages/Dhokha-Arijit-Singh-500-500.jpg",
  "https://pagalnew.com/coverimages/Lehra-Do-83-500-500.jpg",
  "https://pagalnew.com/coverimages/Baliye-Re-Jersey-500-500.jpg",
  "https://pagalnew.com/coverimages/Maiyya-Mainu-Jersey-500-500.jpg",
  "https://pagalnew.com/coverimages/tumse-bhi-zyada-tadap-500-500.jpg",
  "https://pagalnew.com/coverimages/tere-siva-jag-mein-tadap-500-500.jpg",
  ];
  List name=[
    "Meri jaan meri jaan\nBachchhan paandey",
    "Heer raanjhana\nBachchhan paandey",
    "Dhokha\nArijit singh",
    "Lehra Do\n83",
    "Baliye re\nJersey",
    "Maiyya mainu\nJersey",
    "Tumse bhi zyada\nTadap",
    "Tere siva jag mein\nTadap",
  ];
  List music=[
    "https://pagalnew.com/mp3-songs/bollywood-mp3-songs/meri-jaan-meri-jaan-bachchhan-paandey-128-kbps-sound.mp3",
    "https://pagalnew.com/mp3-songs/bollywood-mp3-songs/heer-raanjhana-bachchhan-paandey-128-kbps-sound.mp3",
    "https://pagalnew.com/mp3-songs/bollywood-mp3-songs/dhokha-arijit-singh-128-kbps-sound.mp3",
    "https://pagalnew.com/mp3-songs/bollywood-mp3-songs/lehra-do-83-128-kbps-sound.mp3",
    "https://pagalnew.com/mp3-songs/bollywood-mp3-songs/baliye-re-jersey-128-kbps-sound.mp3",
    "https://pagalnew.com/mp3-songs/bollywood-mp3-songs/maiyya-mainu-jersey-128-kbps-sound.mp3",
    "https://pagalnew.com/mp3-songs/bollywood-mp3-songs/tumse-bhi-zyada-tadap-128-kbps-sound.mp3",
    "https://pagalnew.com/mp3-songs/bollywood-mp3-songs/tere-siva-jag-mein-tadap-128-kbps-sound.mp3",
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text("Rainbow Music"),
        ),
        body: ListView.builder(
            itemCount: 8,
            itemBuilder: (context,index){
          return GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, '/SecondScr',arguments: music[index]);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                color: color[index],
              ),
              margin: EdgeInsets.all(10),
              height: 100,
              width: double.infinity,
              child: Row(
                children: [
                  SizedBox(width: 5,),
                  SizedBox(
                    height: 80,width: 80,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage("${img[index]}"),
                    ),
                  ),
                  SizedBox(width: 15,),
                  Text("${name[index]}",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
