import 'dart:ui';
import 'package:messageme_app/screens/registration_screen.dart';
import 'package:messageme_app/screens/signin_screen.dart';
import 'package:messageme_app/widgets/my_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
 static const String screenRoute = 'welcome_screen';
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
          Column(children: [
            Container(
              child: Image.asset('images/logo.png') ,
            ),
            Text('MessageMe',
            style: TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.w900,
              color: Colors.indigo
            ),)
          ],),
            SizedBox(height: 30.0),
            MyButton(color: Colors.yellow[900]!,
                title: 'Sign In',
                onPressed: (){
              Navigator.pushNamed(context, SingInScreen.screenRoute);
                }
            ),
            MyButton(color: Colors.blue[800]!,
                title: 'Register',
                onPressed: (){
                  Navigator.pushNamed(context, RegistrationScreen.screenRoute);
                }
            )
        ],),
      ),
    );
  }
}


