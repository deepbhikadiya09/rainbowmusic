import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
class SecondScr extends StatefulWidget {
  const SecondScr({Key? key}) : super(key: key);

  @override
  _SecondScrState createState() => _SecondScrState();
}

class _SecondScrState extends State<SecondScr> {
  AudioPlayer audioplayer = AudioPlayer();
  int i = 0;
  bool isplay = false;
  Duration total_duration = Duration(seconds: 0);
  Duration live_duration = Duration(seconds: 0);
  @override
  void initState() {
    super.initState();

    audioplayer.onDurationChanged.listen((event) {
      setState(() {
        total_duration = event;
      });
    });
    audioplayer.onAudioPositionChanged.listen((event) {
      setState(() {
        live_duration = event;
      });
    });
  }
  Widget build(BuildContext context) {
    dynamic data = ModalRoute
        .of(context)!
        .settings
        .arguments as String;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
          
          appBar: AppBar(
            backgroundColor: Colors.black,
            centerTitle: true,
            title: Text("Now Playing"),
          ),
          body: Stack(
            children: [
              SizedBox(
                height: double.infinity,
                  width: double.infinity,
                  child: Image.network("https://images.unsplash.com/photo-1553649084-3e42773ff0e3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",fit: BoxFit.fill,)),
              Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.black54
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 200,
                    width: 200,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage("https://images.unsplash.com/photo-1531651008558-ed1740375b39?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80"),
                    ),
                  ),
                  SizedBox(height: 60,),
                  GestureDetector(onTap: (){
                    if (i % 2 == 0) {
                      audioplayer.play("${data}");
                      setState(() {
                        isplay = true;
                      });
                      i++;
                    }
                    else {
                      audioplayer.pause();
                      setState(() {
                        isplay = false;
                      });
                      i++;
                    }
                  },
                      child: Icon(isplay == false ? Icons.play_arrow : Icons.pause,color: Colors.white,size: 50,)),
                  SizedBox(height: 10,),
                  Slider(
                      activeColor: Colors.amber,
                      inactiveColor: Colors.white,
                      min: 0.0,
                      max: total_duration.inSeconds.toDouble(),
                      value: live_duration.inSeconds.toDouble(),
                      onChanged: (value) {
                        audioplayer.seek(Duration(seconds: value.toInt()));
                      }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("${live_duration.inMinutes.toDouble()}:${live_duration.inSeconds.toDouble()}", style: TextStyle(fontSize: 20,color: Colors.white),),
                      Text("${total_duration.inMinutes.toDouble()}:${total_duration.inSeconds.toDouble()}", style: TextStyle(fontSize: 20,color: Colors.white),),
                    ],
                  )
                ],
              ),
            ],
          )
      ),
    );
  }
  @override
  void dispose(){
    audioplayer.pause();
  }
}
