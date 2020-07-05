import 'package:pansy_ui/pansy_ui.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:video_player/video_player.dart' as v;
import 'package:video_player/video_player.dart';

class VideoPlayer extends StatefulWidget {
  final String url;
  VideoPlayer({
    Key key,
    @required this.url,
  }) : super(key: key);

  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  VideoPlayerController _controller;
  bool _played = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.url);

    _controller.addListener(() {
      setState(() {});
    });

    _controller.setVolume(0);
    _controller.setLooping(true);
    _controller.initialize().then((_) => setState(() {}));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget progressIndicator;
    if (_controller.value.initialized) {
      final int duration = _controller.value.duration.inMicroseconds;
      final int position = _controller.value.position.inMicroseconds;

      progressIndicator = CircularPercentIndicator(
        animation: true,
        animateFromLastPercent: true,
        animationDuration: 700,
        curve: Curves.ease,
        radius: 20,
        lineWidth: 3,
        percent: position / duration,
        circularStrokeCap: CircularStrokeCap.round,
        progressColor: Colors.white,
        backgroundColor: Colors.white24,
      );
    } else {
      progressIndicator = CircularProgressIndicator(
        value: null,
      );
    }

    return AspectRatio(
      aspectRatio: _controller.value.aspectRatio,
      child: Material(
        borderRadius: BorderRadius.circular(5),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: Colors.grey[800],
        child: Stack(
          children: [
            v.VideoPlayer(_controller),
            _buildControls(progressIndicator),
            GestureDetector(onTap: _toggleVideoPlayer),
          ],
        ),
      ),
    );
  }

  Widget _buildControls(Widget progressIndicator) {
    return AnimatedAlign(
      duration: Duration(milliseconds: 300),
      curve: Curves.ease,
      alignment: _played ? Alignment.topRight : Alignment.center,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
        width: _played ? 30 : 80,
        height: _played ? 30 : 80,
        decoration: BoxDecoration(
          color: Colors.black38,
          borderRadius: BorderRadius.circular(50),
        ),
        child: AnimatedCrossFade(
          duration: Duration(milliseconds: 300),
          sizeCurve: Curves.ease,
          firstChild: SizedBox(
            width: 30,
            height: 30,
            child: progressIndicator,
          ),
          secondChild: SizedBox(
            width: 80,
            height: 80,
            child: Icon(
              Icons.play_arrow,
              size: 40,
              color: Colors.white,
            ),
          ),
          crossFadeState:
              _played ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        ),
        padding: EdgeInsets.all(3),
        margin: EdgeInsets.all(8),
      ),
    );
  }

  void _toggleVideoPlayer() {
    setState(() => _played = !_played);
    if (_played)
      _controller.play();
    else
      _controller.pause();
  }
}
