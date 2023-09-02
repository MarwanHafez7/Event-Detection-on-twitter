import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intime_news/Login.dart';
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';


class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);
  //final controller = Get.put(sign)
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
  static const String id = 'reset_password';
//const ForgotPassword({Key? key}) : super(key: key);


}


class _ForgotPasswordState extends State<ForgotPassword> {
  final _auth= FirebaseAuth.instance;
  final TextEditingController _controller = TextEditingController();
  @override



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,


      body: Padding(
        padding: const EdgeInsets.only(right: 10,left: 10),
        child: ListView(
          children: [

            //Forgot Password
            Container(
              padding: const EdgeInsets.only(top: 78.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Forgot Password',
                    style: GoogleFonts.raleway(
                        color: Color.fromRGBO(39, 39, 40, 1),
                        fontSize: 32,
                        fontWeight: FontWeight.w700),
                    //style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ],
              ),
            ),


            SizedBox(height: MediaQuery.of(context).size.height * 0.05),

            //Alert Image
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/images/Alert-icon.svg", height: 130.0,width: 130.0),
              ],
            ),

            SizedBox(height: MediaQuery.of(context).size.height * 0.05),

            //Please enter email
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Please Enter Your Email Address To \n "
                    "     Send You A Verification Code.",
                  style: GoogleFonts.raleway(
                      color: const Color.fromRGBO(39, 39, 40, 1),
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal
                  ),),
              ],
            ),


            SizedBox(height: MediaQuery.of(context).size.height * 0.05),

            Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(color: Colors.black12,spreadRadius: 2,blurRadius: 10),
                  ]
                  ,color: Color.fromRGBO(255, 255, 255, 0.8),borderRadius: BorderRadius.circular(12)
              ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),

                  child: Column(
                    children: [

                      //Enter Email
                      Center(
                        child: TextField(
                          maxLines: 1,
                          controller: _controller,
                          minLines: 1,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 17,horizontal: 13),

                              suffixIcon: const Icon(
                                Icons.email_outlined,
                                color: Color.fromRGBO(143, 147, 154, 1),
                              ),

                              hintText: 'Enter your email', hintStyle: GoogleFonts.raleway(
                            color: const Color.fromRGBO(143, 147, 154, 1),
                            //fontSize: 16,
                            fontWeight: FontWeight.w400,

                          ),

                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(width: 1, color: Color.fromRGBO(180, 25, 25, 0.5)),
                                // borderRadius: BorderRadius.circular(12),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(width: 1, color: Color.fromRGBO(180, 25, 25, 1)),
                                // borderRadius: BorderRadius.circular(12),
                              )
                          ),
                        ),
                      ),

                      SizedBox(height: MediaQuery.of(context).size.height * 0.06),

                      //Send Button
                      Container(
                        height: 52,
                        width: 382,
                        child: ElevatedButton(

                          child: Text('Send' ,textAlign: TextAlign.center,
                            style: GoogleFonts.raleway(
                              color: Color.fromRGBO(244, 244, 244, 1),
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            )
                            ,),

                          onPressed: () async{
                            String userInput = _controller.text;
                            sendresetpassword(userInput);

                            const url = 'https://mail.google.com/mail/u/0/#inbox';
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },

                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            backgroundColor: const Color.fromRGBO(180, 25, 25, 1), // Background color
                          ),
                        ),
                      ),

                      SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                      //Cancel button
                      Container(
                        height: 52,
                        width: 382,
                        child: ElevatedButton(

                          child: Text('Cancel' ,textAlign: TextAlign.center,
                            style: GoogleFonts.raleway(
                              color: Color.fromRGBO(180, 25, 25, 1),
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            )
                            ,),

                          onPressed: () {
                            String userInput = _controller.text;
                            sendresetpassword(userInput);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LogIn()),
                            );
                          },

                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            backgroundColor: const Color.fromRGBO(255, 255, 255, 1), // Background color
                          ),
                        ),
                      ),

                    ],
                  ),
                )
            )






          ],
        ),
      ),



    );
  }
  void verifyemail(){

    User? user = FirebaseAuth.instance.currentUser;
    if (!(user!.emailVerified)){
      user.sendEmailVerification();
    }
  }
  void sendresetpassword(String userInput){

    // User? user = FirebaseAuth.instance.currentUser;
    FirebaseAuth.instance.sendPasswordResetEmail(

        email: userInput,
        );
  }









}