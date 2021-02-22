import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:class_project/pages/Upcoming%20Updates.dart';
import 'package:class_project/pages/profile.dart';
import 'package:class_project/pages/suggestions.dart';
import 'package:flutter/material.dart';

import '../home_page.dart';


class MainScreen extends StatefulWidget {
  var user;
  MainScreen(this.user);
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentTabIndex = 0;
  List<Widget> pages=[];
  Widget currentPage;
  HomePage homePage;
  Profile profile;
  Suggestions suggestions;
  Updates updates;
  @override
  void initState() {


    super.initState();
    // homePage = HomePage(widget.user);
    // profile = Profile(widget.user);
    // suggestions = Suggestions();
    // updates = Updates();

    pages=[HomePage(widget.user),Profile(widget.user),Suggestions(widget.user),Updates()];
    currentPage = HomePage(widget.user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentPage,
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: currentTabIndex,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (int index){
          setState(() {
            currentTabIndex=index;
            currentPage=pages[index];
          });
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Icon(Icons.apps),
            title: Text('Home'),
            activeColor: Colors.red,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.people),
            title: Text('Profile'),
            activeColor: Colors.purpleAccent,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.message),
            title: Text(
              'Suggestions',
            ),
            activeColor: Colors.pink,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.update_sharp),
            title: Text('Updates'),
            activeColor: Colors.blue,
            textAlign: TextAlign.center,
          ),
        ],

      ),
    );
  }
}
