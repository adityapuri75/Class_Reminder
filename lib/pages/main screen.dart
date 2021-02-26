import 'dart:convert';

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:class_project/pages/Upcoming%20Updates.dart';
import 'package:class_project/pages/profile.dart';
import 'package:class_project/pages/suggestions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';


import '../home_page.dart';


class MainScreen extends StatefulWidget {
  var user;
  MainScreen(this.user);
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentTabIndex = 0;
  final PLAY_STORE_URL =
      'https://google.com';
  List<Widget> pages=[];
  Widget currentPage;
  HomePage homePage;
  Profile profile;
  Suggestions suggestions;
  Updates updates;

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  int version = 1;
  bool updateAvailabel =false;
     checkLatestVersion(){
      Firestore _db = Firestore.instance;

      _db.collection("version").document("latestRealase").get().then((snapshot){
        if(snapshot.data != null){

var data= jsonDecode(snapshot.data['value'].toString());
        if(data>version){
          updateAvailabel = true;
        print("the app needs to be updated");
        //HERE you can create a dialog to display and force users to update
        }else{
        updateAvailabel = false;
        }
      }
      });
    }
  @override
  void initState() {
       setState(() {
         checkLatestVersion();
       });

    super.initState();

    pages=[HomePage(widget.user),Suggestions(widget.user),Profile(widget.user),Updates()];
    currentPage = HomePage(widget.user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (updateAvailabel)?AlertDialog(
        title: Text("NEW UPDATE AVAILABLE"),
        content: Text("PLEASE UPDATE THE APP "),
        actions: <Widget>[
          FlatButton(
            child: Text("UPDATE"),
            onPressed: () => _launchURL(PLAY_STORE_URL),
          ),
        ],
      ):currentPage,
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
            icon: Icon(Icons.message),
            title: Text(
              'Suggestions',
            ),
            activeColor: Color(0xff948bff),
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.people),
            title: Text('Profile'),
            activeColor: Color(0xff56549e),
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
