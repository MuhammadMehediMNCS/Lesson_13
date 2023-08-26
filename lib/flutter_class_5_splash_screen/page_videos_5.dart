import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPage5 extends StatefulWidget {
  const VideoPage5({super.key});

  @override
  State<VideoPage5> createState() => _VideoPage5State();
}

class _VideoPage5State extends State<VideoPage5> {

  final List<String> linkID = ['xOPKXI9gslU', 'YliPOC2KdK4', 'v3p8GlWE2ms', 'J1K2aRvgQMg', 'sofQWDuVk_0', 'YVjU5_gRiek', 'YJANklUn-Wc', 'LjO2kmPg6Tc'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Player'),
      ),
      body: ListView.builder(
        itemCount: linkID.length,
        itemBuilder: (context, index) {
          return Card(
            child:  ListTile(
              leading: const Icon(Icons.play_circle),
              title: Text(linkID[index]),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ScondVideoPage5(value: linkID.first,)));
              },
            ),
          );
        }
      )
    );
  }
}

class ScondVideoPage5 extends StatefulWidget {
  var value;

  ScondVideoPage5({super.key, this.value});

  @override
  State<ScondVideoPage5> createState() => _ScondVideoPage5State();
}

class _ScondVideoPage5State extends State<ScondVideoPage5> {
  late YoutubePlayerController controller;
  late TextEditingController idController;
  late TextEditingController seekToController;
  late PlayerState playerState;
  late YoutubeMetaData videoMetaData;
  bool muted = false;
  bool isPlayReady = false;

  final List<String> linkID = ['xOPKXI9gslU', 'YliPOC2KdK4', 'v3p8GlWE2ms', 'J1K2aRvgQMg', 'sofQWDuVk_0', 'YVjU5_gRiek', 'YJANklUn-Wc', 'LjO2kmPg6Tc'];


  @override
  void initState() {
    super.initState();
    
    controller = YoutubePlayerController(
      initialVideoId: linkID.first,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: true
      )
    )..addListener(listener);
    idController = TextEditingController();
    seekToController = TextEditingController();
    videoMetaData = const YoutubeMetaData();
    playerState = PlayerState.unknown;
  }

  void listener() {
    if(isPlayReady && mounted && !controller.value.isFullScreen) {
      setState(() {
        playerState = controller.value.playerState;
        videoMetaData = controller.metadata;
      });
    }
  }

  @override
  void deactivate() {
    controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    idController.dispose();
    seekToController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: controller,
        topActions: <Widget>[
          const SizedBox(width: 8.0),
          Expanded(
            child: Text(
              controller.metadata.title,
              style: const TextStyle(
                fontSize: 18.0,
                overflow: TextOverflow.ellipsis,
              ),
              maxLines: 1,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {}
          )
        ],
        onReady: () => isPlayReady = true,
        onEnded: (data) {
          controller
              .load(linkID[(linkID.indexOf(data.videoId) + 1) % linkID.length]);
        },
      ),
      builder: (context, player) => Scaffold(
        appBar: AppBar(
          title: const Text('Second Page'),
        ),
        body: ListView(
          children: [
            player,
            const SizedBox(height: 10.0),
            Text('Video ID : ${widget.value}')
          ],
        ),
      )
    );
  }
}