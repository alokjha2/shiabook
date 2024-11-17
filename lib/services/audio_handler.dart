import 'package:audio_service/audio_service.dart';
Future<AudioHandler> initAudioService() async {
  return await AudioService.init(
    builder: () => MyAudioHandler(),
    config: AudioServiceConfig(
      rewindInterval: Duration(seconds: 10),
      fastForwardInterval: Duration(seconds: 10),
      
      androidShowNotificationBadge: true,
      androidNotificationChannelId: 'com.mycompany.myapp.audio',
      androidNotificationChannelName: 'Audio Service Demo',
      androidNotificationOngoing: true,
      androidStopForegroundOnPause: true,
    ),
  );
}

class MyAudioHandler extends BaseAudioHandler  {
}