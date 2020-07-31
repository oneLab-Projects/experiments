import 'package:onelab_experiments/ui/global/projects/properties_changer.dart';
import 'package:pansy_ui/pansy_ui.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

import 'properties.dart';

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
  Widget build(BuildContext context) {
    return Consumer<PropertiesChanger>(
      builder: (context, model, child) {
        var data = model.state as AvatarProperties;
        return SizedBox(
          width: data.width,
          height: data.height,
          child: ClipOval(
            child: Stack(
              children: <Widget>[
                Container(color: Colors.white),
                Container(color: Colors.black12),
                Padding(
                  padding: const EdgeInsets.all(2),
                  child: FadeInImage.memoryNetwork(
                    fadeInDuration: Duration(milliseconds: 150),
                    placeholder: kTransparentImage,
                    image: widget.url,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 2, color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
