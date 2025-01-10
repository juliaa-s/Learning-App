import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioPlayerWidget extends StatefulWidget {
  final String audioUrl; // URL or path to the audio file
  final String text;

  const AudioPlayerWidget({Key? key, required this.audioUrl, required this.text}) : super(key: key);

  @override
  _AudioPlayerWidgetState createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration currentPosition = Duration.zero;
  Duration totalDuration = Duration.zero;

  @override
  void initState() {
    super.initState();

    // Listen to audio player events
    _audioPlayer.onPositionChanged.listen((position) {
      setState(() {
        currentPosition = position;
      });
    });

    _audioPlayer.onDurationChanged.listen((duration) {
      setState(() {
        totalDuration = duration;
      });
    });

    _audioPlayer.onPlayerComplete.listen((event) {
      setState(() {
        isPlaying = false;
        currentPosition = Duration.zero;
      });
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _playPauseAudio() async {
    if (isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(AssetSource(widget.audioUrl));
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  void _stopAudio() async {
    await _audioPlayer.stop();
    setState(() {
      isPlaying = false;
      currentPosition = Duration.zero;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Album cover space
        Container(
          width: 200,
          height: 200,
          margin: EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(16),
            // image: DecorationImage(
            //   image: AssetImage('assets/album_cover_placeholder.png'), // Replace with your album cover
            //   fit: BoxFit.cover,
            // ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                widget.text+":",
                style: TextStyle(color: Colors.black54, fontSize: 20),
                ),
                Text("Explained", style: TextStyle(color: Colors.black54, fontSize: 20)),
              ]
            ),
          ),
        ),
        // Slider
        Slider(
          min: 0,
          max: totalDuration.inSeconds.toDouble(),
          value: currentPosition.inSeconds.toDouble(),
          onChanged: (value) async {
            await _audioPlayer.seek(Duration(seconds: value.toInt()));
          },
        ),
        // Controls
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.stop),
              onPressed: _stopAudio,
            ),
            IconButton(
              icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
              onPressed: _playPauseAudio,
            ),
          ],
        ),
        // Duration display
        Text(
          "${_formatDuration(currentPosition)} / ${_formatDuration(totalDuration)}",
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }

  String _formatDuration(Duration duration) {
    return "${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}";
  }
}
