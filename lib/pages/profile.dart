import 'package:class_project/model/user.dart';
import 'package:flutter/material.dart';
import 'package:class_project/auth/api_services.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Profile extends StatefulWidget {
  var user;
  String university;

  String updatedSection;
  String updatedGroup;
  Profile(this.user);
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  ApiService apiService = ApiService();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User>(
        future: apiService.getUserDetails(widget.user.email),
        builder: (context, snapshot) {
          User data = snapshot.data;
          return Scaffold(
            body: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 2.6,
                      color: Colors.transparent,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      color: Color(0xff948bff),
                      height: MediaQuery.of(context).size.height / 2.8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(widget.user.photoUrl),
                                    fit: BoxFit.fill),
                                borderRadius: BorderRadius.circular(50)),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            widget.user.displayName,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            widget.user.email,
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width / 1.4,
                          decoration: BoxDecoration(
                              color: Color(0xffeceaff),
                              borderRadius: BorderRadius.circular(25)),
                          child: Center(
                              child: Text(
                            "Change Your Info Here",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.purple),
                          )),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 70,
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
                                  widget.updatedSection = e;
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
                              widget.updatedGroup = e;
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
                SizedBox(
                  height: 50,
                ),
                InkWell(
                  onTap: () async {
                    print(data.sId);
                    await apiService
                        .updateUserDetails(data.sId, widget.updatedSection,
                            widget.updatedGroup)
                        .then((value) {
                   
                      Fluttertoast.showToast(
                          msg: "Profile Updated",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM_RIGHT,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.black,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    });
                  },
                  child: Container(
                    height: 55,
                    width: MediaQuery.of(context).size.width / 1.9,
                    decoration: BoxDecoration(
                      color: Color(0xffff9b2b),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25),
                          bottomLeft: Radius.circular(25)),
                    ),
                    child: Center(
                        child: Text(
                      "Submit",
                      style: TextStyle(fontSize: 20),
                    )),
                  ),
                )
              ],
            ),
          );
        });
  }
}
