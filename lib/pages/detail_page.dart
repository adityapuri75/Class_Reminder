//3. Display the schedule
//4. Edit the User Profile

import 'package:class_project/auth/api_services.dart';
import 'package:class_project/home_page.dart';
import 'package:class_project/model/user.dart';
import 'package:class_project/pages/main%20screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class DetailPage extends StatefulWidget {
  var user;
  String university;
  bool isLoading = false;
  String section;
  String group;
  DetailPage(this.user);
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    var x = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Color(0xffffe5e6),
      ),
      body: FutureBuilder<User>(
          future: apiService.getUserDetails(widget.user.email),
        builder: (context, snapshot) {
          User data = snapshot.data;
          return Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 100, left: 20),
                        child: Text(
                          "Hey,",
                          style:
                              TextStyle(fontSize: x/24, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 6),
                        child: Text(
                          widget.user.displayName,
                          style: TextStyle(
                              fontSize: x/24,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 7,
                  ),
                  Center(
                    child: Column(
                      children: [
                        Container(
                          height: 50,
                          width: 250,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0xffffe5e6)),
                          child: Center(
                            child: DropDown<String>(
                              onChanged: (e) {
                                widget.university = e;
                              },
                              showUnderline: false,
                              hint: Text("University"),
                              items: <String>["Chitkara"],
                              customWidgets: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text("Chitkara"),
                                  ],
                                ),
                              ],
                              // hint: "Select gender",
                              // onChange: print,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 50,
                          width: 250,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0xffeceaff)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 85, right: 85),
                            child: Container(
                              child: DropDown<String>(
                                  onChanged: (e) {
                                    widget.section = e;
                                  },
                                  isExpanded: true,
                                  showUnderline: false,
                                  hint: Text("Section"),
                                  items: <String>[
                                    "A",
                                    "B",
                                    "C",
                                    "D",
                                    "E",
                                    "F",
                                    "G",
                                    "H",
                                    "I",
                                    "J",
                                    "K",
                                    "L",
                                    "M",
                                    "N",
                                    "O",
                                    "P",
                                    "Q",
                                    "R",
                                    "S",
                                    "T",
                                    "U",
                                    "V",
                                    "W",
                                    "X",
                                    "Y",
                                    "Z",
                                  ],
                                  customWidgets: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Text("A"),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text("B"),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text("C"),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text("D"),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text("E"),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text("F"),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text("G"),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text("H"),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text("I"),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text("J"),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text("K"),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text("L"),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text("M"),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text("N"),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text("O"),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text("P"),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text("Q"),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text("R"),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text("S"),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text("T"),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text("U"),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text("V"),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text("W"),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text("X"),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text("Y"),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text("Z"),
                                      ],
                                    ),
                                    // hint: "Select gender",
                                  ]),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 50,
                          width: 250,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0xffffedd9)),
                          child: Center(
                            child: DropDown<String>(
                              onChanged: (e) {
                                widget.group = e;
                              },
                              showUnderline: false,
                              hint: Text("Group"),
                              items: <String>["1", "2"],
                              customWidgets: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text("1"),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Text("2"),
                                  ],
                                ),
                              ],
                              // hint: "Select gender",
                              // onChange: print,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  height: x/5,
                  width: x/5,
                  decoration: BoxDecoration(
                      color: Color(0xffb8c1ec),
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(400))),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Stack(
                  children: [
                    Container(
                      height: x/5,
                      width: x/5,
                      decoration: BoxDecoration(
                          color: Color(0xffeebbc3),
                          borderRadius:
                              BorderRadius.only(topRight: Radius.circular(400))),
                    ),
                    Positioned(
                      top: x/9,
                      left: x/20,
                      child: Row(
                        children: [
                          Container(
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.black),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.black),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            height: 10,
                            width: 25,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.black),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 25, bottom: 25),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: (widget.isLoading)?Container(child:Center(child:CircularProgressIndicator(strokeWidth: 10,))): InkWell(
                    onTap: () {
                      setState(() {
                        widget.isLoading = true;
                      });
                      if (widget.group != null &&
                          widget.section != null &&
                          widget.university != null) {
                        setState(() {
                          widget.isLoading=true;
                        });
                        OneSignal.shared.deleteTag(data.section);
                        OneSignal.shared.sendTag(widget.section, widget.group);
                        apiService
                            .saveUserDetail(
                                widget.user.displayName,
                                widget.user.email,
                                widget.section,
                                widget.group,
                                widget.university,
                                widget.user.photoUrl)
                            .then((value) {
                          // Navigator.pushReplacement(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => HomePage(widget.user),
                          //     ));
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MainScreen(widget.user),
                              ));
                        });
                      } else {
                        setState(() {
                          widget.isLoading=false;
                        });
                        Fluttertoast.showToast(
                            msg: "Select All Fields",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM_RIGHT,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }

                      // if (detail != null) {
                      //   Navigator.pushReplacement(
                      //       context,
                      //       MaterialPageRoute(
                      //         builder: (context) => HomePage(widget.user),
                      //       ));
                      // }
                    },
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.deepPurple,
                              blurRadius: 10.0, // soften the shadow
                              spreadRadius: 0.0, //extend the shadow
                              offset: Offset(
                                5.0, // Move to right 10  horizontally
                                5.0, // Move to bottom 10 Vertically
                              ),
                            )
                          ],
                          color: Color(0xffabd1c6),
                          borderRadius: BorderRadius.circular(25)),
                      child: Icon(
                        Icons.navigate_next,
                        color: Colors.white,
                        size: 70,
                      ),
                    ),
                  ),
                ),
              )
            ],
          );
        }
      ),
    );
  }
}
