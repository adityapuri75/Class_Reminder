import 'package:class_project/auth/api_services.dart';
import 'package:class_project/model/suggestion.dart';
import 'package:class_project/model/user.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Suggestions extends StatefulWidget {
  var user;
  var section;
  var group;
  Suggestions(this.user,this.section,this.group);
  @override
  _SuggestionsState createState() => _SuggestionsState();
}

class _SuggestionsState extends State<Suggestions> {
  var message;
  List<Color> color2 = [
    Color(0xffd9f5f8),
    Color(0xffffedd9),
    Color(0xffeceaff),
    Color(0xffffe5e6),
    Color(0xffd9f5f8),
    Color(0xffffedd9),
    Color(0xffeceaff),
    Color(0xffffe5e6),
    Color(0xffd9f5f8),
    Color(0xffffedd9),
    Color(0xffeceaff),
    Color(0xffffe5e6),
  ];
  @override
  Widget build(BuildContext context) {
    ApiService().getSuggestion();
    return Scaffold(
              body: FutureBuilder(
                  future: ApiService().getSuggestion(),
                  builder: (context, snapshot) {
                    return Text("snapshot.data[0].feedback");
                  }),
              appBar: AppBar(
                backgroundColor: Color(0xff948bff),
                centerTitle: true,
                title: Text("Suggestions"),
              ),
              bottomNavigationBar: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black12,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: TextField(
                      onChanged: (value) {
                        message = value;
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: "Type your suggestions here",
                        suffixIcon: InkWell(
                          onTap: () {
                        
                            ApiService().feedback(message,
                              widget.section, widget.group);
                            Fluttertoast.showToast(
                                msg: "Suggestion Sent",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM_RIGHT,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.black,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          },
                          child: Icon(
                            Icons.send,
                            color: Color(0xff948bff),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );;
  }
}
