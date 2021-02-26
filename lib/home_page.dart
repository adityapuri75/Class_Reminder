import 'package:class_project/auth/api_services.dart';
import 'package:class_project/model/timetable.dart';
import 'package:class_project/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  var user;
  HomePage(this.user);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  bool isloading = false;
  bool isloading1 = false;
  bool isloading2 = false;

  var date = DateFormat('EEEE').format(DateTime.now());

  var date1 = DateFormat('EEEE').format(DateTime.now().add(Duration(days: 1)));

  var dater = DateFormat("M-dd-yyyy").format(DateTime.now());
  var date1r =
      DateFormat("M-dd-yyyy").format(DateTime.now().add(Duration(days: 1)));

  var dateUtc = DateTime.now().toLocal();
  var z1 = DateFormat("aaa").format(DateTime.now().toLocal());

  ApiService apiService = ApiService();
  @override
  void initState() {
    super.initState();

    ApiService apiService = ApiService();
  }

  List<Color> color1 = [
    Color(0xff2bc8d9),
    Color(0xffff9b2b),
    Color(0xff948bff),
    Color(0xffff6d6d),
    Color(0xff2bc8d9),
    Color(0xffff9b2b),
    Color(0xff948bff),
    Color(0xffff6d6d),
    Color(0xff2bc8d9),
    Color(0xffff9b2b),
    Color(0xff948bff),
    Color(0xffff6d6d),
  ];
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
  // Map<Color,Color> boxcolor ={color1,color2}
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User>(
        future: apiService.getUserDetails(widget.user.email),
        builder: (context, snapshot) {
          User data = snapshot.data;
          if (data != null &&
              snapshot.connectionState == ConnectionState.done) {
            isloading = true;
          }

          return isloading
              ? Scaffold(
                  backgroundColor: Colors.white,
                  appBar: AppBar(
                    toolbarHeight: 50,
                    title: Padding(
                      padding:
                          const EdgeInsets.only(top: 15, left: 10, bottom: 5),
                      child: Text(
                        "Lectures (" +
                            "Sec" +
                            "-" +
                            data.section +
                            data.group +
                            ")",
                        style: TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    actions: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20, top: 10),
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(widget.user.photoUrl),
                                  fit: BoxFit.fill),
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                    ],
                    backgroundColor: Colors.white,
                    elevation: 0,
                  ),
                  body: Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 13),
                            child: Text(
                              "Today, " + date + ", " + dater,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          SingleChildScrollView(
                            physics: ScrollPhysics(),
                            child: Column(
                              children: <Widget>[
                                FutureBuilder<List<TimeTable>>(
                                    future: apiService.getTimeTable(
                                        data.section, date, data.group),
                                    builder: (context, snapshot) {
                                      bool empty = true;
                                      if (snapshot.data.length == 0) {
                                        empty = false;
                                      }
                                      List<TimeTable> schedule = snapshot.data;
                                      if(snapshot.data!=null && snapshot.connectionState==ConnectionState.done){
                                      return empty
                                              ? ListView.builder(
                                                  physics:
                                                      NeverScrollableScrollPhysics(),
                                                  shrinkWrap: true,
                                                  itemCount: schedule.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    var datatime =
                                                        schedule[index].time;
                                                    var datatime1 =
                                                        datatime.substring(
                                                            datatime.indexOf(
                                                                    "-") +
                                                                1,
                                                            datatime.length);
                                                    var x = datatime1.substring(
                                                        0,
                                                        datatime1.indexOf(':'));
                                                    var x1 =
                                                        datatime1.substring(
                                                            datatime1.indexOf(
                                                                    ":") +
                                                                1,
                                                            datatime1
                                                                .indexOf(" "));

                                                    var xx = double.parse(x);
                                                    var xx1 = double.parse(x1);
                                                    var xr = xx * 60 + xx1;

                                                    var y =
                                                        dateUtc.hour.toDouble();
                                                    var y1 = dateUtc.minute
                                                        .toDouble();
                                                    var gg =
                                                        dateUtc.day.toString();

                                                    if (z1 == "PM") {
                                                      y = y - 12;
                                                    }

                                                    var yr = y * 60 + y1;
                                                    var timetabletime = xr;
                                                    var timenow = yr;

                                                    var z = datatime1.substring(
                                                        datatime1.indexOf(" ") +
                                                            1,
                                                        datatime1.length);

                                                    var last = 0;

                                                    if (timenow < 540 &&
                                                        z1 == "AM") {
                                                      last = 1;
                                                    } else if (timenow > 300 &&
                                                        z1 == "PM") {
                                                      last = 0;
                                                    } else {
                                                      if (timetabletime >
                                                              timenow &&
                                                          z == z1 &&
                                                          z == "AM" &&
                                                          z1 == "AM") {
                                                        last = 1;
                                                      } else if (timetabletime >
                                                              timenow &&
                                                          z == z1 &&
                                                          z == "PM" &&
                                                          z1 == "PM") {
                                                        last = 1;
                                                      } else if (timenow >
                                                              timetabletime &&
                                                          z1 != z &&
                                                          z1 == "AM" &&
                                                          z == "PM") {
                                                        last = 1;
                                                      }
                                                    }

                                                    return Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 15),
                                                      child: Container(
                                                        height: 140,
                                                        child: Row(
                                                          children: [
                                                            Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width /
                                                                  50,
                                                              height: 140,
                                                              decoration: BoxDecoration(
                                                                  color: color1[
                                                                      index],
                                                                  borderRadius: BorderRadius.only(
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              20),
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              20))),
                                                            ),
                                                            Expanded(
                                                              child: Container(
                                                                height: 140,
                                                                decoration: BoxDecoration(
                                                                    color: color2[
                                                                        index],
                                                                    borderRadius: BorderRadius.only(
                                                                        topRight:
                                                                            Radius.circular(
                                                                                10),
                                                                        bottomRight:
                                                                            Radius.circular(10))),
                                                                child: Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      left: 15,
                                                                      right:
                                                                          15),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            schedule[index].subject,
                                                                            style:
                                                                                TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                                6,
                                                                          ),
                                                                          Text(schedule[index]
                                                                              .time)
                                                                        ],
                                                                      ),
                                                                      Column(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          last == 1
                                                                              ? Container(
                                                                                  height: 40,
                                                                                  width: 40,
                                                                                  decoration: BoxDecoration(image: DecorationImage(image: NetworkImage("https://cdn3.iconfinder.com/data/icons/digital-marketing-4-11/65/169-512.png")), borderRadius: BorderRadius.circular(20), color: Colors.transparent),
                                                                                )
                                                                              : Container(
                                                                                  height: 40,
                                                                                  width: 40,
                                                                                  decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/done.png")), borderRadius: BorderRadius.circular(20), color: Colors.transparent),
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
                                              : Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 15),
                                                  child: Container(
                                                    height: 140,
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width /
                                                              50,
                                                          height: 140,
                                                          decoration: BoxDecoration(
                                                              color: color1[3],
                                                              borderRadius: BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          20),
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          20))),
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            height: 140,
                                                            decoration: BoxDecoration(
                                                                color:
                                                                    color2[3],
                                                                borderRadius: BorderRadius.only(
                                                                    topRight: Radius
                                                                        .circular(
                                                                            10),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            10))),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left: 15,
                                                                      right:
                                                                          15),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Row(
                                                                        children: [
                                                                          Text(
                                                                            "Hurray!  ",
                                                                            style: TextStyle(
                                                                                color: Colors.blue,
                                                                                fontSize: 24,
                                                                                fontWeight: FontWeight.bold),
                                                                          ),
                                                                          Text(
                                                                            "No Lectures Today",
                                                                            style:
                                                                                TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            6,
                                                                      ),
                                                                      // Text(snapshot
                                                                      //     .data[index]
                                                                      //     .time),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ));}else{
                                      return Container(child: Center(child: CircularProgressIndicator(),),);}

                                    })
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 18,
                          ),
                          Text(
                            "Tomorrow, " + date1 + ", " + date1r,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SingleChildScrollView(
                            physics: ScrollPhysics(),
                            child: Column(
                              children: <Widget>[
                                FutureBuilder<List<TimeTable>>(
                                    future: apiService.getTimeTable(
                                        data.section, date1, data.group),
                                    builder: (context, snapshot) {
                                      if (snapshot.data != null) {
                                        isloading2 = true;
                                      }
                                      bool empty = true;
                                      if (snapshot.data.length == 0) {
                                        empty = false;
                                      }
                                    if(snapshot.data!=null && snapshot.connectionState==ConnectionState.done){
                                      return empty
                                          ? ListView.builder(
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              itemCount: snapshot.data.length,
                                              itemBuilder: (context, index) {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 15),
                                                  child: Container(
                                                    height: 140,
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width /
                                                              50,
                                                          height: 140,
                                                          decoration: BoxDecoration(
                                                              color:
                                                                  color1[index],
                                                              borderRadius: BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          20),
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          20))),
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            height: 140,
                                                            decoration: BoxDecoration(
                                                                color: color2[
                                                                    index],
                                                                borderRadius: BorderRadius.only(
                                                                    topRight: Radius
                                                                        .circular(
                                                                            10),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            10))),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left: 15,
                                                                      right:
                                                                          15),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                        snapshot
                                                                            .data[index]
                                                                            .subject,
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                20,
                                                                            fontWeight:
                                                                                FontWeight.bold),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            6,
                                                                      ),
                                                                      Text(snapshot
                                                                          .data[
                                                                              index]
                                                                          .time),
                                                                    ],
                                                                  ),
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
                                          : Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 15),
                                              child: Container(
                                                height: 140,
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              50,
                                                      height: 140,
                                                      decoration: BoxDecoration(
                                                          color: color1[2],
                                                          borderRadius:
                                                              BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          20),
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          20))),
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        height: 140,
                                                        decoration: BoxDecoration(
                                                            color: color2[2],
                                                            borderRadius: BorderRadius.only(
                                                                topRight: Radius
                                                                    .circular(
                                                                        10),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        10))),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 15,
                                                                  right: 15),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      Text(
                                                                        "Hurray!  ",
                                                                        style: TextStyle(
                                                                            color: Colors
                                                                                .pink,
                                                                            fontSize:
                                                                                24,
                                                                            fontWeight:
                                                                                FontWeight.bold),
                                                                      ),
                                                                      Text(
                                                                        "No Lectures Tomorrow",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                18,
                                                                            fontWeight:
                                                                                FontWeight.bold),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                    height: 6,
                                                                  ),
                                                                  // Text(snapshot
                                                                  //     .data[index]
                                                                  //     .time),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );}
                                    return Container(child: Center(child: CircularProgressIndicator(),),);

                                    })
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : Container(
                  color: Colors.white,
                  child: SpinKitPouringHourglass(
                    color: Colors.purple,
                    size: 150.0,
                    controller: AnimationController(
                        vsync: this,
                        duration: const Duration(milliseconds: 1200)),
                  ),
                );
        });
  }
}
