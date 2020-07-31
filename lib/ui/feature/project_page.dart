import 'package:flutter/cupertino.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:onelab_experiments/component/api/github_api.dart';
import 'package:onelab_experiments/component/api/github_user.dart';
import 'package:onelab_experiments/domain/entity/project.dart';
import 'package:onelab_experiments/projects/projects.dart';
import 'package:onelab_experiments/ui/feature/not_found_page.dart';
import 'package:onelab_experiments/ui/global/projects/properties_changer.dart';
import 'package:pansy_ui/pansy_ui.dart';
import 'package:provider/provider.dart';

class ProjectPage extends StatefulWidget {
  final int id;
  const ProjectPage({Key key, this.id}) : super(key: key);

  @override
  _ProjectPageState createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  TransformationController _transformationController;

  Project _project;
  bool _showDrawer = false;

  @override
  void initState() {
    super.initState();

    _transformationController = TransformationController();
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
      case ProjectType.full:
        return _project.source;
        break;
      case ProjectType.app:
        return _project.source;
    }

    return NotFoundPage();
  }

  Widget _buildWidgetView() {
    var source = _project.source;

    return ChangeNotifierProvider(
      create: (context) => PropertiesChanger(_project.properties),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        extendBodyBehindStatusBar: true,
        appBar: AppBar(
          title: Text('Project'),
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
        body: Column(
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
                  if (MediaQuery.of(context).size.width >= 1000) _buildDrawer(),
                  Expanded(
                    child: _buildWidgetViewer(source),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWidgetViewer(Widget source) {
    return ClipRRect(
      child: InteractiveViewer(
        transformationController: _transformationController,
        child: Stack(
          alignment: Alignment.center,
          children: [
            GridPaper(
              color: Theme.of(context).canvasColor,
              child: SizedBox.expand(),
            ),
            source
          ],
        ),
      ),
    );
  }

  Widget _buildDrawer() {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        border: MediaQuery.of(context).size.width < 1000
            ? Border(bottom: BorderSide(color: Theme.of(context).dividerColor))
            : Border(right: BorderSide(color: Theme.of(context).dividerColor)),
      ),
      width: MediaQuery.of(context).size.width < 1000 ? double.infinity : 300,
      height: MediaQuery.of(context).size.width < 1000 ? null : double.infinity,
      padding: EdgeInsets.only(
          top: APPBAR_HEIGHT + MediaQuery.of(context).padding.top),
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
        _buildDrawerTitle(),
        if (_project.contributorIds.isNotEmpty) _buildDrawerContributors(),
        _buildDrawerProperties(),
      ].separated(Divider(height: 40)),
    );
  }

  Widget _buildDrawerTitle() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildWidgetTitle(),
          _buildWidgetDescription(),
          _buildWidgetTags(),
        ].separated(SizedBox(height: 8)),
      ),
    );
  }

  Widget _buildWidgetTitle() {
    return Text(
      _project.name,
      style: Theme.of(context).textTheme.headline6.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
    );
  }

  Widget _buildWidgetDescription() {
    return Text(
      _project.description ?? 'No description',
      style: Theme.of(context).textTheme.subtitle2.copyWith(
          color: Theme.of(context).textTheme.subtitle2.color.withAlpha(150),
          height: 1.6),
    );
  }

  Widget _buildWidgetTags() {
    return SizedBox(
      height: 41,
      child: Transform.scale(
        alignment: Alignment.centerLeft,
        scale: 0.9,
        child: Wrap(
          children: [
            Chip(
              label: Text(
                _project.developmentStatus.toString().substring(18),
              ),
            ),
            Chip(
              label: Text(_project.type.toString().substring(12)),
            ),
          ].separated(SizedBox(width: 5)),
        ),
      ),
    );
  }

  Widget _buildDrawerContributors() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _buildTitle('Contributors'),
        SizedBox(height: 20),
        _project != null && _project.contributorIds.isNotEmpty
            ? FutureBuilder(
                future:
                    GithubApiClient().getUsersByIDs(_project.contributorIds),
                builder: (BuildContext context, snapshot) =>
                    _buildContributorsList(snapshot.data),
              )
            : Container()
      ]),
    );
  }

  Widget _buildContributorsList(List<GithubUser> users) {
    if (users == null) {
      return Center(
        child: CupertinoActivityIndicator(),
      );
    }

    return Column(
      children: List<Widget>.generate(
        users.length,
        (index) => _buildWidgetContributionsItem(users[index]),
      ).separated(SizedBox(height: 20)),
    );
  }

  Widget _buildWidgetContributionsItem(GithubUser contributor) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.black12,
          backgroundImage: NetworkImage(
            contributor.avatar.toString(),
          ),
          radius: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              contributor.name ?? contributor.nickname,
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
            if (contributor.name != null)
              Text(
                contributor.nickname,
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                    color: Theme.of(context)
                        .textTheme
                        .bodyText2
                        .color
                        .withAlpha(150),
                    fontSize: 12),
              ),
          ].separated(SizedBox(height: 5)),
        ),
      ].separated(SizedBox(width: 12)),
    );
  }

  Widget _buildDrawerProperties() {
    return Builder(builder: (context) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                _buildTitle('Properties'),
                SizedBox(height: 15),
              ] +
              _project.properties.getWidgets(context),
        ),
      );
    });
  }

  Widget _buildTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 2),
      child: Text(
        title,
        style: Theme.of(context).textTheme.subtitle1.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }

  Widget _buildTitleForWidget({
    @required String title,
    @required Widget widget,
  }) {
    assert(title != null || widget != null);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
