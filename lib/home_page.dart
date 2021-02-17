

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  var user;
  HomePage(this.user);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Color> color1 = [Color(0xff2bc8d9),Color(0xffff9b2b),Color(0xff948bff),Color(0xffff6d6d),];
  List<Color> color2 = [Color(0xffd9f5f8),Color(0xffffedd9),Color(0xffeceaff),Color(0xffffe5e6),];
  // Map<Color,Color> boxcolor ={color1,color2}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 50,
        title: Padding(
          padding: const EdgeInsets.only(top: 15,left: 10,bottom: 5),
          child: Text("Lectures (Sec-T)",style: TextStyle(color: Colors.deepPurple,fontSize: 30,fontWeight: FontWeight.bold),),
        ),
        actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20,top: 10),
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      image:  DecorationImage(
                          image: NetworkImage(widget.user.photoUrl),fit: BoxFit.fill
                      ),
                      borderRadius: BorderRadius.circular(20)
                  ),
                ),
              ),
        ],
        // Text("Lectures (Sec-T)",style: TextStyle(color: Colors.deepPurple,fontSize: 30,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 25,right: 25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Padding(
              //   padding: const EdgeInsets.only(top: 50),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Text("Lectures (Sec-T)",style: TextStyle(color: Colors.deepPurple,fontSize: 30,fontWeight: FontWeight.bold),),
              //       Container(
              //         height: 40,
              //         width: 40,
              //         decoration: BoxDecoration(
              //           image:  DecorationImage(
              //             image: NetworkImage("https://images.squarespace-cdn.com/content/v1/592738c58419c2fe84fbdb81/1511808075655-YGGD8CMMY2R85X05OKVK/ke17ZwdGBToddI8pDm48kIKay4bYLpKTFWoXFdGxjdZ7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z5QHyNOqBUUEtDDsRWrJLTmo3_5ncHsS_KC884-Z46vJXn_CAy8A416_wq-2ydr5e5Si7pbxezXfOOzs3720f9z/DBS_Kevin_web_2640.jpg?format=1000w",),fit: BoxFit.fill
              //           ),
              //           borderRadius: BorderRadius.circular(20)
              //         ),
              //       ),
              //     ],
              //   ),
              // ),

              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text("Today, Mon, June 8",style: TextStyle(fontWeight: FontWeight.bold),),
              ),



              SingleChildScrollView(
                physics: ScrollPhysics(),
                child: Column(
                  children: <Widget>[
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount:4,
                        itemBuilder: (context,index){
                          return   Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Container(
                              height: 140,
                              child: Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width/50,
                                height: 140,
                                decoration: BoxDecoration(
                                    color: Color(0xff2bc8d9),
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20))
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 140,
                                  decoration: BoxDecoration(
                                      color: Color(0xffd9f5f8),
                                      borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10))
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15,right: 15),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text("AWT",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                            SizedBox(height: 6,),
                                            Text("10:00 AM - 11:00 AM"),
                                          ],
                                        ),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 30,
                                              width: 30,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(15),
                                                color: Colors.deepPurple
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                              ),

                            ),
                          );
                        })
                  ],
                ),
              ),

              // Container(
              //   height: 140,
              //   child: Row(
              // children: [
              //   Container(
              //     width: MediaQuery.of(context).size.width/50,
              //     height: 140,
              //     decoration: BoxDecoration(
              //         color: Color(0xff2bc8d9),
              //       borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20))
              //     ),
              //   ),
              //   Expanded(
              //     child: Container(
              //       height: 140,
              //       decoration: BoxDecoration(
              //           color: Color(0xffd9f5f8),
              //           borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10))
              //       ),
              //       child: Padding(
              //         padding: const EdgeInsets.only(left: 15,right: 15),
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             Column(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               mainAxisAlignment: MainAxisAlignment.center,
              //               children: [
              //                 Text("AWT",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              //                 SizedBox(height: 6,),
              //                 Text("10:00 AM - 11:00 AM"),
              //               ],
              //             ),
              //             Column(
              //               mainAxisAlignment: MainAxisAlignment.center,
              //               children: [
              //                 Container(
              //                   height: 30,
              //                   width: 30,
              //                   decoration: BoxDecoration(
              //                     borderRadius: BorderRadius.circular(15),
              //                     color: Colors.deepPurple
              //                   ),
              //                 )
              //               ],
              //             )
              //           ],
              //         ),
              //       ),
              //     ),
              //   ),
              // ],
              //   ),
              //
              // ),
              //
              // SizedBox(height: 18,),
              //
              // Container(
              //   height: 140,
              //   child: Row(
              // children: [
              //   Container(
              //     width: MediaQuery.of(context).size.width/50,
              //     height: 140,
              //     decoration: BoxDecoration(
              //         color: Color(0xffff9b2b),
              //         borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20))
              //     ),
              //   ),
              //   Expanded(
              //     child: Container(
              //       height: 140,
              //       decoration: BoxDecoration(
              //           color: Color(0xffffedd9),
              //           borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10))
              //       ),
              //     ),
              //   ),
              // ],
              //   ),
              //
              // ),

              SizedBox(height: 18,),

              Text("Tomorrow, Tue, June 9",style: TextStyle(fontWeight: FontWeight.bold),),

              SingleChildScrollView(
                physics: ScrollPhysics(),
                child: Column(
                  children: <Widget>[
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount:4,
                        itemBuilder: (context,index){
                          return   Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Container(
                              height: 140,
                              child: Row(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width/50,
                                    height: 140,
                                    decoration: BoxDecoration(
                                        color: Color(0xff2bc8d9),
                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20))
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 140,
                                      decoration: BoxDecoration(
                                          color: Color(0xffd9f5f8),
                                          borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10))
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 15,right: 15),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text("AWT",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                                SizedBox(height: 6,),
                                                Text("10:00 AM - 11:00 AM"),
                                              ],
                                            ),
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  height: 30,
                                                  width: 30,
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(15),
                                                      color: Colors.deepPurple
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                            ),
                          );
                        })
                  ],
                ),
              ),

              // Container(
              //   height: 140,
              //   child: Row(
              // children: [
              //   Container(
              //     width: MediaQuery.of(context).size.width/50,
              //     height: 140,
              //     decoration: BoxDecoration(
              //         color: Color(0xff948bff),
              //         borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20))
              //     ),
              //   ),
              //   Expanded(
              //     child: Container(
              //       height: 140,
              //       decoration: BoxDecoration(
              //           color: Color(0xffeceaff),
              //           borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10))
              //       ),
              //     ),
              //   ),
              // ],
              //   ),
              //
              // ),
              //
              //
              // SizedBox(height: 18,),
              //
              // Container(
              //   height: 140,
              //   child: Row(
              // children: [
              //   Container(
              //     width: MediaQuery.of(context).size.width/50,
              //     height: 140,
              //     decoration: BoxDecoration(
              //         color: Color(0xffff6d6d),
              //         borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20))
              //     ),
              //   ),
              //   Expanded(
              //     child: Container(
              //       height: 140,
              //       decoration: BoxDecoration(
              //           color: Color(0xffffe5e6),
              //           borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10))
              //       ),
              //     ),
              //   ),
              // ],
              //   ),
              //
              // ),
              //
              // SizedBox(height: 18,),
              //
              // Container(
              //   height: 140,
              //   child: Row(
              //     children: [
              //       Container(
              //         width: MediaQuery.of(context).size.width/50,
              //         height: 140,
              //         decoration: BoxDecoration(
              //             color: Color(0xffff6d6d),
              //             borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20))
              //         ),
              //       ),
              //       Expanded(
              //         child: Container(
              //           height: 140,
              //           decoration: BoxDecoration(
              //               color: Color(0xffffe5e6),
              //               borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10))
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              //
              // )
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: new Icon(Icons.home),
            title: new Text('Home'),),
          BottomNavigationBarItem(icon: new Icon(Icons.chat),
            title: new Text('suggestions'),),

        ],
      ),
    );
  }
}

