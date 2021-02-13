import 'package:class_project/home_page.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height/1.8,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/bgdesign.jpg"),fit: BoxFit.cover
              )
            ),
          ),

          SizedBox(height: 40,),

          Text("Welcome to Your",style: TextStyle(color: Colors.deepPurple,fontSize: 30,fontWeight: FontWeight.bold),),
          Text("Lectures Reminder App",style: TextStyle(color: Colors.deepPurple,fontSize: 30,fontWeight: FontWeight.bold),),

          SizedBox(height: 35,),

          Text("Not able to remember your lectures schedule?",style: TextStyle(color: Colors.grey),),
          SizedBox(height: 5,),
          Text("No worries, This app will let you know",style: TextStyle(color: Colors.grey),),
          SizedBox(height: 5,),
          Text("your schedule with the time.",style: TextStyle(color: Colors.grey),),


        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 50,left: 40,right: 40),
        child: InkWell(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              color: Color(0xff4565ec),
              borderRadius: BorderRadius.circular(15)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Login with",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                SizedBox(width: 15,),
                Padding(
                  padding: const EdgeInsets.only(top: 10,bottom: 10),
                  child: Image(image: AssetImage("assets/google.png")),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
