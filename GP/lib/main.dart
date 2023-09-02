import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:intime_news/SignUp.dart';
import 'package:intime_news/edit_profile.dart';

import 'ForgotPassword.dart';
import 'Login.dart';
import 'cubit.dart';
import 'local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await Firebase.initializeApp();

  var firstScreen = CacheHelper.getData(key: "isLogged");
  runApp(MyApp(firstScreen));
}

class MyApp extends StatelessWidget {
  var whoIsFirst;

  MyApp(this.whoIsFirst);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeLayoutCubit())
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home:ForgotPassword(),

      ),
    );
  }
}