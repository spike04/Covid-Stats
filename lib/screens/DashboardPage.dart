import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';

import '../base/providers.dart';
import '../base/utils.dart';
import '../base/widgets.dart';
import '../base/screens.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    super.initState();
    // HERE WE NEED TO PERFORM CALL TO API
    _getData();
  }

  _getData() async {
    final provider = Provider.of<GlobalStatsProvider>(context, listen: false);
    await provider.getLocalStats();
    await provider.getGlobalStats();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: RefreshIndicator(
          onRefresh: () async {
            await _getData();
          },
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 80),
            children: <Widget>[
              Text(
                'Corona Stats',
                style: Theme.of(context).textTheme.display2.copyWith(
                      color: red,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                'Latest Stats for Corona. Get Latest \nStats ASAP',
                style: Theme.of(context).textTheme.subtitle.copyWith(
                      color: blackDim,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                padding: EdgeInsets.symmetric(vertical: 10),
                color: blackDim,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Data Obtained From: ',
                      style: Theme.of(context)
                          .textTheme
                          .title
                          .copyWith(color: white),
                    ),
                    SizedBox(width: 10),
                    CachedNetworkImage(
                      height: 30,
                      imageUrl: 'https://corona.lmao.ninja/public/logo.png',
                    ),
                  ],
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Color(0xFFEFEFEF),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Consumer<GlobalStatsProvider>(
                    builder: (context, provider, _) {
                      final data = provider.localStatsData;
                      if (data == null) return Loading();
                      return Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              CachedNetworkImage(
                                imageUrl: data.countryInfo.flag,
                                width: 20,
                              ),
                              SizedBox(width: 10),
                              Text(
                                '${data.country} Stats',
                                textAlign: TextAlign.center,
                                style:
                                    Theme.of(context).textTheme.title.copyWith(
                                          color: blackDim,
                                          fontWeight: FontWeight.w500,
                                        ),
                              ),
                            ],
                          ),
                          Divider(),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Cases',
                                    style: Theme.of(context).textTheme.title,
                                  ),
                                  Text(
                                    '${performFormatting(data.cases)}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline
                                        .copyWith(color: red),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Deaths',
                                    style: Theme.of(context).textTheme.title,
                                  ),
                                  Text(
                                    '${performFormatting(data.deaths)}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline
                                        .copyWith(color: red),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Recovered',
                                    style: Theme.of(context).textTheme.title,
                                  ),
                                  Text(
                                    '${performFormatting(data.recovered)}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline
                                        .copyWith(color: red),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Divider(height: 40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Active',
                                    style: Theme.of(context).textTheme.title,
                                  ),
                                  Text(
                                    '${performFormatting(data.active)}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline
                                        .copyWith(color: red),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Tests',
                                    style: Theme.of(context).textTheme.title,
                                  ),
                                  Text(
                                    '${performFormatting(data.tests)}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline
                                        .copyWith(color: red),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Global Data',
                    style: Theme.of(context).textTheme.headline.copyWith(
                          fontWeight: FontWeight.bold,
                          color: blackDim,
                        ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => AllStatsPage(),
                        ),
                      );
                    },
                    child: Row(
                      children: <Widget>[
                        Text(
                          'View All',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle
                              .copyWith(color: red),
                        ),
                        Icon(
                          Feather.chevron_right,
                          color: red,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Color(0xFFEFEFEF),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Consumer<GlobalStatsProvider>(
                    builder: (context, provider, _) {
                      final data = provider.globalStatsData;
                      if (data == null) return Loading();
                      return Column(
                        children: <Widget>[
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Total Cases',
                                  style: Theme.of(context)
                                      .textTheme
                                      .title
                                      .copyWith(color: blackDim),
                                ),
                                Text(
                                  '${performFormatting(data.cases)}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline
                                      .copyWith(color: red),
                                ),
                              ],
                            ),
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      'Total Recovered',
                                      style: Theme.of(context)
                                          .textTheme
                                          .title
                                          .copyWith(color: blackDim),
                                    ),
                                    Text(
                                      '${performFormatting(data.recovered)}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline
                                          .copyWith(color: red),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 20),
                                height: 80,
                                color: Theme.of(context).dividerColor,
                                width: 0.5,
                              ),
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      'Total Deaths: ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .title
                                          .copyWith(color: blackDim),
                                    ),
                                    Text(
                                      '${performFormatting(data.deaths)}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline
                                          .copyWith(color: red),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
