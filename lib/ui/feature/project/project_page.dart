import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:onelab_experiments/domain/entity/project.dart';
import 'package:onelab_experiments/projects/projects.dart';
import 'package:onelab_experiments/ui/feature/not_found_page.dart';
import 'package:pansy_ui/pansy_ui.dart';

class ProjectPage extends StatefulWidget {
  final int id;
  const ProjectPage({Key key, this.id}) : super(key: key);

  @override
  _ProjectPageState createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  Project _project;

  bool _showDrawer = false;

  @override
  void initState() {
    super.initState();
    _project = getProjects().firstWhere(
      (element) => element.id == widget.id,
      orElse: () => null,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_project == null) return NotFoundPage();

    switch (_project.type) {
      case ProjectType.widget:
        return _buildWidgetView();
      case ProjectType.app:
        return _project.source;
      default:
        return null;
    }
  }

  Widget _buildWidgetView() {
    Widget source = _project.source;

    if (_project.initialSize != null)
      source = SizedBox(
        width: _project.initialSize.width,
        height: _project.initialSize.height,
        child: _project.source,
      );

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("Project"),
        actions: [
          if (MediaQuery.of(context).size.width < 1000)
            IconButton(
              icon: Icon(MdiIcons.textBox),
              onPressed: () => _toggleDrawer(),
            ),
          IconButton(
            icon: Icon(MdiIcons.whiteBalanceSunny),
            onPressed: () => ThemeProvider.of(context).toggleThemeMode(),
          ),
        ].separated(SizedBox(width: 2)),
      ),
      body: Stack(
        children: [
          GridPaper(
            color: Theme.of(context).canvasColor,
            child: SizedBox.expand(),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (MediaQuery.of(context).size.width < 1000)
                AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  curve: Curves.ease,
                  height: _showDrawer
                      ? MediaQuery.of(context).size.height / 3 > 400
                          ? 400
                          : MediaQuery.of(context).size.height / 3
                      : 0,
                  child: _buildDrawer(),
                ),
              Expanded(
                child: Row(
                  children: [
                    if (MediaQuery.of(context).size.width >= 1000)
                      _buildDrawer(),
                    Expanded(child: Align(child: source)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDrawer() {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        border: MediaQuery.of(context).size.width < 1000
            ? Border(
                bottom: BorderSide(
                  color: Theme.of(context).dividerColor,
                ),
              )
            : Border(
                right: BorderSide(
                  color: Theme.of(context).dividerColor,
                ),
              ),
      ),
      width: MediaQuery.of(context).size.width < 1000 ? double.infinity : 350,
      height: MediaQuery.of(context).size.width < 1000 ? null : double.infinity,
      padding: EdgeInsets.only(top: APPBAR_HEIGHT),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: _buildDrawerBody(),
        ),
      ),
    );
  }

  Widget _buildDrawerBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDrawerInformation(),
        _buildDrawerProperties(),
      ].separated(Divider(height: 40)),
    );
  }

  Widget _buildDrawerInformation() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Information",
            style: Theme.of(context).textTheme.overline.copyWith(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
          ),
          _buildTitleForWidget(
            title: "Name",
            widget: Text(
              _project.name,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          _buildTitleForWidget(
            title: "Description",
            widget: Text(
              _project.description ?? "No description",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          _buildTitleForWidget(
            title: "Type",
            widget: Text(
              _project.type.toString().substring(12),
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          _buildTitleForWidget(
            title: "Develompent status",
            widget: Text(
              _project.developmentStatus.toString().substring(18),
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
        ].separated(SizedBox(height: 15)),
      ),
    );
  }

  Widget _buildDrawerProperties() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Properties",
            style: Theme.of(context).textTheme.overline.copyWith(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
          ),
          _buildTitleForWidget(
            title: "width",
            widget: Text(
              _project.initialSize.width.toString(),
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          _buildTitleForWidget(
            title: "height",
            widget: Text(
              _project.initialSize.height.toString(),
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
        ].separated(SizedBox(height: 15)),
      ),
    );
  }

  Widget _buildTitleForWidget({
    @required String title,
    @required Widget widget,
  }) {
    assert(title != null || widget != null);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.subtitle2.copyWith(
              color:
                  Theme.of(context).textTheme.subtitle2.color.withAlpha(150)),
        ),
        widget,
      ].separated(SizedBox(height: 7)),
    );
  }

  void _toggleDrawer() => setState(() => _showDrawer = !_showDrawer);
}
