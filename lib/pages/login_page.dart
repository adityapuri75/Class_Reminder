import 'package:class_project/home_page.dart';
import 'package:class_project/pages/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login extends StatefulWidget {
  bool isLoading = false;
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height/1.9,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/bgdesign.jpg"),fit: BoxFit.cover
                )
              ),
            ),

            SizedBox(height: MediaQuery.of(context).size.height/18,),

            Text("Welcome to Your",style: TextStyle(color: Colors.deepPurple,fontSize: MediaQuery.of(context).size.height/26,fontWeight: FontWeight.bold),),
            Text("Lectures Reminder App",style: TextStyle(color: Colors.deepPurple,fontSize: MediaQuery.of(context).size.height/26,fontWeight: FontWeight.bold),),

            SizedBox(height: MediaQuery.of(context).size.height/20,),

            Text("Not able to remember your lectures schedule?",style: TextStyle(color: Colors.grey),),
            SizedBox(height: 5,),
            Text("No worries, This app will let you know",style: TextStyle(color: Colors.grey),),
            SizedBox(height: 5,),
            Text("your schedule with the time.",style: TextStyle(color: Colors.grey),),


          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 30,left: 40,right: 40),
        child: InkWell(

          onTap: ()async{
            setState(() {
              widget.isLoading = true;
            });
              final GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
              final GoogleSignInAuthentication googleSignInAuthentication =
                  await googleSignInAccount.authentication;

              final AuthCredential credential = GoogleAuthProvider.getCredential(
                accessToken: googleSignInAuthentication.accessToken,
                idToken: googleSignInAuthentication.idToken,
              );

              final AuthResult authResult = await _auth.signInWithCredential(credential);
              final FirebaseUser user = authResult.user;

              assert(!user.isAnonymous);
              assert(await user.getIdToken() != null);

            final FirebaseUser currentUser = await _auth.currentUser();
            assert(user.uid == currentUser.uid);

            if(user!=null){
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => DetailPage(user)),
            );}else{
              setState(() {
                widget.isLoading = false;
              });
            }

          },
          child: Container(
            height: MediaQuery.of(context).size.height/13,
            decoration: BoxDecoration(
              color: Color(0xff4565ec),
              borderRadius: BorderRadius.circular(15)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Login with",style: TextStyle(color: Colors.white,fontSize:MediaQuery.of(context).size.height/40,fontWeight: FontWeight.bold),),
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
