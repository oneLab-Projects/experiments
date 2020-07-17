import 'package:pansy_ui/pansy_ui.dart';
import 'package:transparent_image/transparent_image.dart';

class Avatar extends StatefulWidget {
  final String url;
  Avatar({
    Key key,
    @required this.url,
  }) : super(key: key);

  @override
  _AvatarState createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Stack(
        children: <Widget>[
          Container(color: Colors.black12),
          FadeInImage.memoryNetwork(
            fadeInDuration: Duration(milliseconds: 150),
            placeholder: kTransparentImage,
            image: widget.url,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              border: Border.all(
                width: 2,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
