import 'package:flutter/material.dart';
import 'package:rainbowmusic/SecondScr.dart';
import 'FirstScr.dart';
void main()
{
  runApp(
   MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/':(context)=>FirstScr(),
      '/SecondScr':(context)=>SecondScr(),
    },
   ),
  );
}