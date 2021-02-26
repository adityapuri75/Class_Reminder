import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Updates extends StatefulWidget {
  @override
  _UpdatesState createState() => _UpdatesState();
}

class _UpdatesState extends State<Updates> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Color(0xff95bbf4),
      ),
      body: SingleChildScrollView(
        child: Container(

          decoration: BoxDecoration(
            // color: Color(0xffeceaff)
            gradient: LinearGradient(
              colors: [
                const Color(0xffffffff),
                const Color(0xff95bbf4),

              ],
                begin: const FractionalOffset(1.5, 01.0),
            end: const FractionalOffset(2.0, 0.0),

            )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30,top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Thanks",style: GoogleFonts.sansita(fontSize: 40,color: Color(0xffc07d53))),
                    Text("For",style: GoogleFonts.sansita(fontSize: 35,color: Color(0xffc07d53))),
                    Text("Using Our App!",style: GoogleFonts.sansita(fontSize: 40,color: Color(0xffc07d53))),
                  ],
                ),

              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,top: 35),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height/3.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color(0xfffb8d9a)
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text("Upcoming Updates",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.height/40),),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height/45,),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("-   Other University Schedule.",style: TextStyle(fontSize: MediaQuery.of(context).size.height/55,fontWeight: FontWeight.bold,)),
                              SizedBox(height: 20,),
                              Text("-   Admin Access so you can update your section Schedule.",style: TextStyle(fontSize: MediaQuery.of(context).size.height/55,fontWeight: FontWeight.bold),),
                              SizedBox(height: 20,),
                              Text("-   Currently only For 4th Semester Students.",style: TextStyle(fontSize: MediaQuery.of(context).size.height/55,fontWeight: FontWeight.bold),)
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,top: 40),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height/3.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color(0xffa4a3f8)
                  ), child: Column(
                children: [
                Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text("Contact Us",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),
              ),
              SizedBox(height: MediaQuery.of(context).size.height/55,),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        SizedBox(height: MediaQuery.of(context).size.height/55,),
                        Text("help.zirkon@gmail.com",style: TextStyle(fontSize: MediaQuery.of(context).size.height/35,fontWeight: FontWeight.bold),),
                        SizedBox(height: 10,),
                        Text("(Any query just Contact Us Here)",style: TextStyle(fontSize: MediaQuery.of(context).size.height/55,fontWeight: FontWeight.bold),),
                        SizedBox(height: MediaQuery.of(context).size.height/55,),
                      ],
                    ),
                  ),


            ],
          ),
                ),
              ),



            ],
          ),
        ),
      ),
    );
  }
}
