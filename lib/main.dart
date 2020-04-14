import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './base/locator.dart';
import './base/providers.dart';
import './base/screens.dart';
import './base/utils.dart';

void main() {
  setUpLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<GlobalStatsProvider>(
          create: (_) => GlobalStatsProvider(),
        ),
        ChangeNotifierProvider<LocalStatsProvider>(
          create: (_) => LocalStatsProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Corona Stats',
        theme: ThemeData(
          fontFamily: 'NunitoSans',
          scaffoldBackgroundColor: scaffoldBg,
          primaryColor: Colors.white,
          appBarTheme: AppBarTheme(
            elevation: 0,
            color: scaffoldBg,
            iconTheme: IconThemeData(color: blackDim),
          ),
        ),
        home: DashboardPage(),
      ),
    );
  }
}
