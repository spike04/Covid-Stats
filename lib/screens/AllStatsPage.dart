import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';

import '../base/models.dart';
import '../base/providers.dart';
import '../base/utils.dart';
import '../base/widgets.dart';

class AllStatsPage extends StatefulWidget {
  @override
  _AllStatsPageState createState() => _AllStatsPageState();
}

class _AllStatsPageState extends State<AllStatsPage> {
  @override
  void initState() {
    super.initState();

    _getData();
  }

  _getData() async {
    final provider = Provider.of<LocalStatsProvider>(context, listen: false);
    await provider.getAllLocalStats();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Statistics'),
        leading: IconButton(
          icon: Icon(Feather.chevron_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Feather.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: StatSearch(),
              );
            },
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Consumer<LocalStatsProvider>(
          builder: (context, provider, _) {
            final data = provider.localStatsDataList;

            if (data.length > 0) {
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final stat = data[index];
                  return CountryStatItem(stat);
                },
              );
            }
            return Loading();
          },
        ),
      ),
    );
  }
}

class StatSearch extends SearchDelegate<LocalStatsData> {
  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    assert(theme != null);
    return theme.copyWith(
      primaryColor: scaffoldBg,
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(AntDesign.close),
        onPressed: () => query = '',
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final data = Provider.of<LocalStatsProvider>(context, listen: false)
        .localStatsDataList;
    final searchWord = query.trim().toLowerCase();
    final List<LocalStatsData> suggestionList = query.isEmpty
        ? data
        : data
            .where((e) => e.country.toLowerCase().contains(searchWord))
            .toList();
    return Padding(
      padding: EdgeInsets.all(16),
      child: ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context, index) {
          return CountryStatItem(suggestionList[index]);
        },
      ),
    );
  }
}
