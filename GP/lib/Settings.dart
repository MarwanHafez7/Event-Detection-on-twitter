import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';


class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();

}

class _SettingsState extends State<Settings> {


  //Change Password Controllers
  bool _passwordVisible = false;
  bool _passwordVisible1 = false;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
    //bool _passwordVisible1 = false;

  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(

      resizeToAvoidBottomInset: false,


      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,


      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView(
          children: [

            SizedBox(height: MediaQuery.of(context).size.height * 0.02),

            //Logo
            Center(
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                  height: 25.14,
                  width: 139,
                  child: SvgPicture.asset("assets/images/Logo.svg"),
                )
              ]),
            ),




            // //Back Button
            // Positioned(
            //   top: 63.0,
            //   left: 24.0,
            //   child: FloatingActionButton(
            //
            //     onPressed: () {
            //       Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //             builder: (context) => Home(),
            //           ));
            //     },
            //     child: Icon(Icons.arrow_back,size: 32,),
            //     backgroundColor: Colors.white,
            //     foregroundColor: Color.fromRGBO(39, 39, 40, 1),
            //     elevation: 1.5,
            //   ),
            // ),



            //SizedBox(height: MediaQuery.of(context).size.height * 0.04),

            // //Settings
            // Text("Settings",
            //   style: GoogleFonts.raleway(
            //       color: const Color.fromRGBO(39, 39, 40, 1),
            //       fontSize: 22,
            //       fontWeight: FontWeight.w600,
            //       fontStyle: FontStyle.normal
            //   ),
            // ),


            SizedBox(height: MediaQuery.of(context).size.height * 0.03),

            //Line
            const Divider(
              height: 10,
              thickness: 1,
              indent: 0,
              endIndent: 0,
              color: Color.fromRGBO(143, 147, 154, 1),
            ),


            SizedBox(height: MediaQuery.of(context).size.height * 0.01),

            //Manage Profile
            Row(
              children: [
                Icon(
                  Icons.account_circle_outlined,
                  size: 32,
                  color: Color.fromRGBO(180, 25, 25, 1),
                ),
                SizedBox(
                  width: 8,
                ),
                Text("Manage Profile",
                  style:  GoogleFonts.raleway(
                      color: const Color.fromRGBO(39, 39, 40, 1),
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,

                  ),
                ),
              ],
            ),


            SizedBox(height: MediaQuery.of(context).size.height * 0.01),

            //Line
            const Divider(
              height: 10,
              thickness: 1,
              indent: 0,
              endIndent: 0,
              color: Color.fromRGBO(143, 147, 154, 1),
            ),



            SizedBox(height: MediaQuery.of(context).size.height * 0.03),

            //Profile Picture
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width:150,
                    height: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(200),
                        image: DecorationImage(
                            image: AssetImage(
                              'assets/images/Charcter.jpg',
                            ),
                            colorFilter: const ColorFilter.mode(
                              Color.fromRGBO(39, 39, 40, 0.15),
                              BlendMode.darken,
                            ),
                            fit: BoxFit.cover,
                        )

                    )
                ),
              ],
            ),





            SizedBox(height: MediaQuery.of(context).size.height * 0.03),

            //Manage Account Options
            ChangeName(context, "Change Username"),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),

            ChangeEmail(context, "Change Email"),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),

            ChangePass(context, "Change Password"),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),

            SignOut(context, "Sign Out"),




            // SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            //
            // //Line
            // const Divider(
            //   height: 10,
            //   thickness: 1,
            //   indent: 0,
            //   endIndent: 0,
            //   color: Color.fromRGBO(143, 147, 154, 1),
            // ),
            //
            //
            // SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            //
            // //Manage Notification
            // Row(
            //   children: [
            //     Icon(
            //       Icons.volume_up_outlined,
            //       color: Color.fromRGBO(180, 25, 25, 1),
            //     ),
            //     SizedBox(
            //       width: 8,
            //     ),
            //     Text(
            //       "Manage Notifications",
            //       style: GoogleFonts.raleway(
            //     color: const Color.fromRGBO(39, 39, 40, 1),
            //   fontSize: 18,
            //   fontWeight: FontWeight.w600,
            //   fontStyle: FontStyle.normal,
            // ),
            //     ),
            //   ],
            // ),
            //
            //
            // SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            //
            // //Line
            // const Divider(
            //   height: 10,
            //   thickness: 1,
            //   indent: 0,
            //   endIndent: 0,
            //   color: Color.fromRGBO(143, 147, 154, 1),
            // ),
            //
            //
            // SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            //
            // //Manage Notification Options
            // buildNotificationOptionRow("Receive Notification", true),
            //




        ]
        ),
      ),




    );
  }




  // //Manage Notification
  // Row buildNotificationOptionRow(String title, bool isActive) {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     children: [
  //       Text(
  //         title,
  //         style:  GoogleFonts.raleway(
  //             color: Color.fromRGBO(143, 147, 154, 1),
  //             fontSize: 18,
  //             fontWeight: FontWeight.w500,
  //             fontStyle: FontStyle.normal,
  //         ),
  //       ),
  //       Transform.scale(
  //           scale: 0.7,
  //           child: CupertinoSwitch(
  //             activeColor: Color.fromRGBO(180, 25, 25, 1),
  //             value: isActive,
  //             onChanged: (bool val) {
  //             },
  //           ))
  //     ],
  //   );
  // }



  //Manage Profile
  //Change Name
  GestureDetector ChangeName(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    SizedBox(height: MediaQuery.of(context).size.height * 0.015),

                    //Enter Name
                    Center(
                      child: TextField(
                        maxLines: 1,
                        minLines: 1,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 13),

                            suffixIcon: const Icon(
                              Icons.account_circle_outlined,
                              color: Color.fromRGBO(143, 147, 154, 1),
                            ),

                            hintText: 'Full Name', hintStyle: GoogleFonts.raleway(
                          color: const Color.fromRGBO(143, 147, 154, 1),
                          //fontSize: 16,
                          fontWeight: FontWeight.w400,

                        ),

                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 1, color: Color.fromRGBO(39, 39, 40, 1)),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(width: 1, color: Color.fromRGBO(180, 25, 25, 1)),
                              borderRadius: BorderRadius.circular(12),
                            )
                        ),
                      ),
                    ),


                  ],
                ),



                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Save",
                        style: GoogleFonts.raleway(
                            color: const Color.fromRGBO(180, 25, 25, 1),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal
                        ),
                      )
                  ),


                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Close",
                        style: GoogleFonts.raleway(
                            color: const Color.fromRGBO(39, 39, 40, 1),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal
                        ),
                      )
                  ),
                ],
              );
            });
      },


      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.raleway(
                color: Color.fromRGBO(143, 147, 154, 1),
                fontSize: 18,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal
            ),
          ),
          Icon(
            Icons.arrow_right,
            color: Color.fromRGBO(143, 147, 154, 1),
            size: 32,
          ),
        ],
      ),
    );
  }


  //Change Email
  GestureDetector ChangeEmail(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    SizedBox(height: MediaQuery.of(context).size.height * 0.015),

                    //Enter Email
                    Center(
                      child: TextField(
                        maxLines: 1,
                        minLines: 1,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 13),

                            suffixIcon: const Icon(
                              Icons.email_outlined,
                              color: Color.fromRGBO(143, 147, 154, 1),
                            ),

                            hintText: 'Email', hintStyle: GoogleFonts.raleway(
                          color: const Color.fromRGBO(143, 147, 154, 1),
                          //fontSize: 16,
                          fontWeight: FontWeight.w400,

                        ),

                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 1, color: Color.fromRGBO(39, 39, 40, 1)),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(width: 1, color: Color.fromRGBO(180, 25, 25, 1)),
                              borderRadius: BorderRadius.circular(12),
                            )
                        ),
                      ),
                    ),

                  ],
                ),



                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Save",
                        style: GoogleFonts.raleway(
                            color: const Color.fromRGBO(180, 25, 25, 1),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal
                        ),
                      )
                  ),


                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Close",
                        style: GoogleFonts.raleway(
                            color: const Color.fromRGBO(39, 39, 40, 1),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal
                        ),
                      )
                  ),
                ],
              );
            });
      },


      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.raleway(
                color: Color.fromRGBO(143, 147, 154, 1),
                fontSize: 18,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal
            ),
          ),
          Icon(
            Icons.arrow_right,
            color: Color.fromRGBO(143, 147, 154, 1),
            size: 32,
          ),
        ],
      ),
    );
  }



  //Change Password
  GestureDetector ChangePass(BuildContext context, String title) {
    return GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(title),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height * 0.015),

                      //Enter Password
                      Center(
                        child: TextField(
                          maxLines: 1,
                          minLines: 1,
                          obscureText: _passwordVisible?false:true,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 13),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  color: const Color.fromRGBO(143, 147, 154, 1),
                                  // Based on passwordVisible state choose the icon
                                  _passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  // Update the state i.e. toogle the state of passwordVisible variable
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                              ),

                              // ),
                              hintText: 'Password',
                              hintStyle:  GoogleFonts.raleway(
                                color: const Color.fromRGBO(143, 147, 154, 1),
                                //fontSize: 16,
                                fontWeight: FontWeight.w400,

                              ) ,//TextStyle(color: Color.fromRGBO(143, 147, 154, 1)),
                              // Set border for enabled state (default)
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(width: 1, color: Color.fromRGBO(39, 39, 40, 1)),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              // Set border for focused state
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(width: 1, color: Color.fromRGBO(180, 25, 25, 1)),
                                borderRadius: BorderRadius.circular(12),
                              )),
                        ),
                      ),



                      SizedBox(height: MediaQuery.of(context).size.height * 0.01),

                      //Confirm Password
                      Center(
                        child: TextField(
                          maxLines: 1,
                          minLines: 1,
                          obscureText: _passwordVisible1?false:true,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 13),

                              suffixIcon: IconButton(
                                icon: Icon(
                                  color: const Color.fromRGBO(143, 147, 154, 1),
                                  // Based on passwordVisible state choose the icon
                                  _passwordVisible1
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  // Update the state i.e. toogle the state of passwordVisible variable
                                  setState(() {
                                    _passwordVisible1 = !_passwordVisible1;
                                  });
                                },
                              ),

                              // ),
                              hintText: 'Confirm Password',
                              hintStyle:  GoogleFonts.raleway(
                                color: const Color.fromRGBO(143, 147, 154, 1),
                                //fontSize: 16,
                                fontWeight: FontWeight.w400,

                              ) ,//TextStyle(color: Color.fromRGBO(143, 147, 154, 1)),
                              // Set border for enabled state (default)
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(width: 1, color: Color.fromRGBO(39, 39, 40, 1)),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              // Set border for focused state
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(width: 1, color: Color.fromRGBO(180, 25, 25, 1)),
                                borderRadius: BorderRadius.circular(12),
                              )),
                        ),
                      ),
                    ],
                  ),


                  actions: [

                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("Save",
                          style: GoogleFonts.raleway(
                              color: const Color.fromRGBO(180, 25, 25, 1),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal
                          ),
                        )
                    ),


                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("Close",
                          style: GoogleFonts.raleway(
                              color: const Color.fromRGBO(39, 39, 40, 1),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal
                          ),
                        )
                    ),
                  ],
                );
              });
        },


        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: GoogleFonts.raleway(
                  color: Color.fromRGBO(143, 147, 154, 1),
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal
              ),
            ),
            Icon(
              Icons.arrow_right,
              color: Color.fromRGBO(143, 147, 154, 1),
              size: 32,
            ),
          ],
        ),
        );
    }


    //Sign Out
  GestureDetector SignOut(BuildContext context, String title) {
    return GestureDetector(
        onTap: () {
          FirebaseAuth.instance.signOut().then((value) {
            Navigator.push(
                context,
                MaterialPageRoute(builder:
                    (context) => new LogIn()));
            Fluttertoast.showToast(msg: "Signed Out Successfully",
                backgroundColor: Color.fromRGBO(244, 244, 244, 1),
                textColor: Color.fromRGBO(39, 39, 40, 1) );
          });
        },


      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.raleway(
                color: Color.fromRGBO(180, 25, 25, 1),
                fontSize: 18,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal
            ),
          ),
          Icon(
            Icons.logout,
            color: Color.fromRGBO(180, 25, 25, 1),
            size: 26,
          ),
        ],
      ),
    );
  }


}