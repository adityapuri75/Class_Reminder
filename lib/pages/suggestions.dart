import 'package:auto_size_text/auto_size_text.dart';
import 'package:class_project/auth/api_services.dart';
import 'package:class_project/model/suggestion.dart' as Feedback;
import 'package:class_project/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Suggestions extends StatefulWidget {
  var user;

  Suggestions(this.user);
  @override
  _SuggestionsState createState() => _SuggestionsState();
}

class _SuggestionsState extends State<Suggestions> with TickerProviderStateMixin {
  bool isloading = false;
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
  final fieldText = TextEditingController();
  void clearText() {
    fieldText.clear();
  }
  @override
  Widget build(BuildContext context) {
    ApiService().getSuggestion();
    return FutureBuilder<User>(
        future: ApiService().getUserDetails(widget.user.email),
        builder: (context, snapshot) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: FutureBuilder<List<Feedback.Feedback>>(
                future: ApiService().getSuggestion(),
                builder: (context, snapshot) {
                  var data = snapshot.data;
                  if (data != null &&
                      snapshot.connectionState == ConnectionState.done) {
                    isloading = true;
                  }
                  return isloading ? ListView.builder(
                    itemBuilder: (context, index) {
                      var z =snapshot.data[index].feedback.length;
                      bool position = false;
                      int h;
                      if(z<25){
                        h=50;
                      }else if(z<80){
                        h =80;
                      }else{
                        h = 100;
                      }
                      if(index%2==0){
                        position =true;
                      }else{
                        position = false;
                      }

                      print(z);

                      return position ? Padding(
                        padding: const EdgeInsets.only(top: 25,right: 105,left: 10),
                        child: Container(
                          height: h.toDouble(),
                          decoration: BoxDecoration(
                            color: color2[index],
                            borderRadius: BorderRadius.circular(h/6),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 8.0, // soften the shadow
                                spreadRadius: 1.0, //extend the shadow
                                offset: Offset(
                                  5.0, // Move to right 10  horizontally
                                  5.0, // Move to bottom 10 Vertically
                                ),
                              )
                            ],
                          ),
                          width: 40,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AutoSizeText(
                                  snapshot.data[index].feedback,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black54),
                                  group: AutoSizeGroup(),
                                ),
                              ],
                            ),
                          ),


                        ),
                      ):Padding(
                        padding: const EdgeInsets.only(top: 25,right: 10,left: 105),
                        child: Container(
                          height: h.toDouble(),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 8.0, // soften the shadow
                                  spreadRadius: 1.0, //extend the shadow
                                  offset: Offset(
                                    -5.0, // Move to right 10  horizontally
                                    5.0, // Move to bottom 10 Vertically
                                  ),
                                )
                              ],
                              color: color2[index],
                              borderRadius: BorderRadius.circular(h/6)
                          ),
                          width: 40,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                AutoSizeText(
                                  snapshot.data[index].feedback,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black54),
                                  group: AutoSizeGroup(),
                                ),
                              ],
                            ),
                          ),


                        ),
                      );
                    },
                    itemCount: snapshot.data.length,
                  ):Container(
                    color: Colors.white,
                    child: SpinKitPouringHourglass(
                      color: Colors.purple,
                      size: 150.0,
                      controller: AnimationController(
                          vsync: this,
                          duration: const Duration(milliseconds: 1200)),
                    ),
                  );
                }),
            appBar: AppBar(
              backgroundColor: Color(0xff948bff),
              centerTitle: true,
              title: Text("Suggestions / Feedback"),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xffD3D3D3),
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
                      suffixIcon: IconButton(
                        icon: Icon(Icons.send),
                        color: Color(0xff948bff),
                        onPressed: (){
                          ApiService().feedback(message, snapshot.data.section,
                                      snapshot.data.group);
                          clearText();

                                  Fluttertoast.showToast(
                                      msg: "Suggestion Sent",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM_RIGHT,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.black,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                        },
                      ),
                    ),
                    controller: fieldText,
                  ),
                ),
              ),
            ),
          );
        });
    ;
  }
}
