import 'package:alok/constants/image.dart';
import 'package:alok/helpers/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'common.dart';
import 'dart:io';
import 'package:alok/audiofunc/button.dart';
import 'package:alok/audiofunc/common.dart';
import 'package:alok/broilers_code/startdownload.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';

// import 'package:alok/audiobook%20page/audiofunc/common.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:just_audio/just_audio.dart';
import 'package:just_audio_cache/just_audio_cache.dart';

import 'package:audio_session/audio_session.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rxdart/rxdart.dart';



// Displays the play/pause button and volume/speed sliders.
class ControlButtons extends StatelessWidget {
  final AudioPlayer player;
  final Stream<PositionData> positionDataStream;

  ControlButtons({required this.player, required this.positionDataStream });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Opens volume slider dialog
        IconButton(
          icon: Icon(Icons.volume_up),
          color: Colors.orange,
          iconSize: 40,
          onPressed: () {
            showSliderDialog(
              context: context,
              title: "Adjust volume",
              divisions: 10,
              min: 0.1,
              max: 1,
              value: player.volume,
              stream: player.volumeStream,
              onChanged: 
              player.setVolume,
            );
          },
        ),
        // skip(),

        // skip(),
        StreamBuilder<PositionData>(
                     stream: this.positionDataStream,
                     builder: (context, snapshot, ) {
                       final positionData = snapshot.data;
                       return Row(
                         children: [
                           IconButton(onPressed: (){
                             final Location = positionData?.position?? Duration.zero;
                             if(positionData?.position == Duration.zero){
                               message(message: "sorry! at start");
                              // Duration targetPosition = Location - const Duration(seconds: 10);
                              //  player.seek(targetPosition);
                              //  player.seek(Duration(seconds: 0));
                             }else{
                              Duration targetPosition = Location - const Duration(seconds: 10);
                               player.seek(targetPosition);
                           }},
                           icon: Image.asset(replay10, height: 160,width: 80,color: Colors.orange,)
                               ),
                           StreamBuilder<PlayerState>(
          stream: player.playerStateStream,
          builder: (context, snapshot) {
            final playerState = snapshot.data;
            final processingState = playerState?.processingState;
            final playing = playerState?.playing;
            if (processingState == ProcessingState.loading || 
                processingState == ProcessingState.buffering) {
              return Container(
                margin: EdgeInsets.fromLTRB(3, 0, 3, 3),
                width: 60.0,
                height: 60.0,
                child: Center(child: CircularProgressIndicator(strokeWidth: 4,color: Colors.orange,)),
              );
            } else if (playing != true) {
              return IconButton(
                icon: Icon(Icons.play_arrow_rounded),
                iconSize: 58.0,
                onPressed: player.play,
                color: Colors.orange,
              );
            } else if (processingState != ProcessingState.completed) {
              return IconButton(
                icon: Icon(Icons.pause),
                iconSize: 58.0,
                onPressed: player.pause,
                color: Colors.orange,
              );
            // } else if (processingState != ProcessingState.completed) {
            //   return IconButton(
            //     icon: Icon(Icons.pause),
            //     iconSize: 58.0,
            //     onPressed: player.pause,
            //     color: Colors.orange,
            //   );
            } else {
              return IconButton(
                icon: Icon(Icons.replay),
                iconSize: 58.0,
                onPressed: () => player.seek(Duration.zero),
                color: Colors.orange,
              );
            }
          },
        ),
        IconButton(onPressed: (){
              final Location=positionData?.position ?? Duration.zero;
              if(Location==positionData?.position){ 
              Duration targetPosition = Location + const Duration(seconds: 10);
                player.seek(targetPosition);

              }else{
              Duration targetPosition = Location + const Duration(seconds: 10);
                player.seek(targetPosition);
              }},
            icon: Icon(Icons.forward_10, size: 32,color: Colors.orange,)
          ),
      ],
    );
    },
),
        StreamBuilder<double>(
          stream: player.speedStream,
          builder: (context, snapshot) => IconButton(
            color: Colors.orange,
            iconSize: 30,
            icon: Text("${snapshot.data?.toStringAsFixed(1)}x",
            style: GoogleFonts.ubuntu(textStyle:TextStyle(fontWeight: FontWeight.bold, color: Colors.orange, ))),
            onPressed: () {
              showSliderDialog(
                context: context,
                title: "Adjust speed",
                divisions: 10,
                min: 0.5,
                max: 1.5,
                value: player.speed,
                stream: player.speedStream,
                onChanged: player.setSpeed,
              );
            },
          ),
        ),
      ],
    );
  }
  Widget skip()=>StreamBuilder<PositionData>(
                     stream: this.positionDataStream,
                     builder: (context, snapshot, ) {
                       final positionData = snapshot.data;
                       return Row(
                         children: [
                           Padding(
                             padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                             child:  IconButton(onPressed: (){
                               final Location=positionData?.position ?? Duration.zero;
                                Duration targetPosition = Location - const Duration(seconds: 10);
                                 player.seek(targetPosition);
                             },
                             icon: Image.asset(replay10, height: 140,width: 60,)
                                 ),
                           ),
                            IconButton(onPressed: (){
                                 final Location=positionData?.position ?? Duration.zero;
                                  Duration targetPosition = Location - const Duration(seconds: 10);
                                   player.seek(targetPosition);
                               },
                               icon: Icon(Icons.forward_10, size: 32,color: Colors.black,)
                             ),
                         ],
                       );
                       },
                   );
        
}


class playbutton extends StatelessWidget {
  const playbutton({Key? key, this.player}) : super(key: key);

  final player;
  

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PlayerState>(
          stream: player.playerStateStream,
          builder: (context, snapshot) {
            final playerState = snapshot.data;
            final processingState = playerState?.processingState;
            final playing = playerState?.playing;
            if (processingState == ProcessingState.loading || 
                processingState == ProcessingState.buffering) {
              return Container(
                margin: EdgeInsets.fromLTRB(3, 0, 3, 3),
                width: 60.0,
                height: 60.0,
                child: Center(child: CircularProgressIndicator(strokeWidth: 4,color: Colors.orange,)),
              );
            } else if (playing != true) {
              return IconButton(
                icon: Icon(Icons.play_arrow_rounded),
                iconSize: 58.0,
                onPressed: player.play,
                color: Colors.orange,
              );
            } else if (processingState != ProcessingState.completed) {
              return IconButton(
                icon: Icon(Icons.pause),
                iconSize: 58.0,
                onPressed: player.pause,
                color: Colors.orange,
              );
            } else {
              return IconButton(
                icon: Icon(Icons.replay),
                iconSize: 58.0,
                onPressed: () => player.seek(Duration.zero),
                color: Colors.orange,
              );
            }
          },
        );
  }
}