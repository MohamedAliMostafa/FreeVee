import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:movies/Tabs/Browser.dart';
import 'package:movies/Tabs/Home/Home.dart';
import 'package:movies/Tabs/Search.dart';
import 'package:movies/Tabs/WatchList.dart';

import '../Features/Widgets/ItemNavigationBar.dart';


class HomeLayout extends StatefulWidget {
static const String RouteName="HomeLayout";

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
List<Widget>tabs=[Home(),SearchMovies(),Browser(),WatchList()];

int index=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff121312),
      bottomNavigationBar: CurvedNavigationBar(
        color:const Color(0xff1A1A1A),
        backgroundColor:const Color(0xffC6C6C6) ,
        buttonBackgroundColor: Colors.black,
        height: 50,
        items: [
          ItemNaviBar(icons:Icons.home ,label: "Home",),
          ItemNaviBar(icons:Icons.search ,label: "Search",),
          ItemNaviBar(icons:Icons.browse_gallery ,label: "Browsers",),
          ItemNaviBar(icons:Icons.watch_sharp ,label: "WatchList",),
        ],
        index: index,
        onTap:(value) {
          setState(() {
            index=value;
          });

        },
      ),
      body: tabs[index],
    );
  }
}
