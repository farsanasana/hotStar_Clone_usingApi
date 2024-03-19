import 'package:flutter/material.dart';
import 'package:newwhost/Api_function/Function.dart';
import 'package:newwhost/screen.dart/newsScreen.dart/topupcoming_screen.dart';

class MyTabbedScreen extends StatelessWidget {
  const MyTabbedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Column(children: [
          const TabBar(
            tabs: [
              Tab(
                text: 'Top Rated',
              ),
              Tab(text: 'Horror Movies'),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                ComingsoonScreen(
                    futurefunction: topratedmovies(), valueNotifier: TopRated),
                ComingsoonScreen(
                    futurefunction: loadhorror(), valueNotifier: horrotmovies)
              ],
            ),
          ),
        ]));
  }
}
