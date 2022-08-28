import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:messageme_app/screens/chat_screen.dart';
import 'package:messageme_app/widgets/my_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

 class RegistrationScreen extends StatefulWidget {
   static const String screenRoute = 'registration_screen';

   const RegistrationScreen({Key? key}) : super(key: key);

   @override
   State<RegistrationScreen> createState() => _RegistrationScreenState();
 }

 class _RegistrationScreenState extends State<RegistrationScreen> {
   final _auth = FirebaseAuth.instance;

  late String email;
  late String password;

  bool showSpinner = false;

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: Colors.white,
       body: ModalProgressHUD(
         inAsyncCall: showSpinner,
         child: Padding(
           padding: const EdgeInsets.symmetric(horizontal: 24),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.stretch,
             children: [
               Container(
                 height: 180,
                 child: Image.asset('images/logo.png'),
               ),
               SizedBox(height: 50),
               TextField(
                 keyboardType: TextInputType.emailAddress,
                 textAlign: TextAlign.center,
                 onChanged: (value){
                   email = value;
                 },
                 decoration: InputDecoration (
                   hintText: 'Enter your email',
                   contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                   border: OutlineInputBorder(
                     borderRadius: BorderRadius.all(Radius.circular(10))
                   ),

                   enabledBorder: OutlineInputBorder(
                     borderSide: BorderSide(color: Colors.orange,
                     width: 1 ),
                       borderRadius: BorderRadius.all(Radius.circular(10))
                   ),
                   focusedBorder: OutlineInputBorder(
                       borderSide: BorderSide(color: Colors.blue,
                           width: 2 ),
                       borderRadius: BorderRadius.all(Radius.circular(10))
                   ),
                 ),
               ),
               SizedBox(height: 10),
               TextField(
                 obscureText: true,
                 textAlign: TextAlign.center,
                 onChanged: (value){
                   password = value;
                 },
                 decoration: InputDecoration (
                   hintText: 'Enter your password',
                   contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                   border: OutlineInputBorder(
                       borderRadius: BorderRadius.all(Radius.circular(10))
                   ),

                   enabledBorder: OutlineInputBorder(
                       borderSide: BorderSide(color: Colors.orange,
                           width: 1 ),
                       borderRadius: BorderRadius.all(Radius.circular(10))
                   ),
                   focusedBorder: OutlineInputBorder(
                       borderSide: BorderSide(color: Colors.blue,
                           width: 2 ),
                       borderRadius: BorderRadius.all(Radius.circular(10))
                   ),
                 ),
               ),
               SizedBox(height: 20),
               MyButton(color: Colors.blue[800]!,
                   title: 'Register', onPressed: (){
                 setState(() {
                   showSpinner = true;
                 });

               try{
                 final newUser =  _auth.createUserWithEmailAndPassword(
                     email: email,
                     password: password);
                 Navigator.pushNamed(context, ChatScreen.screenRoute);
                 setState(() {
                   showSpinner = false;
                 });
               }catch(e){
                 print(e);
               }
                   },
               )
             ],
           ),
         ),
       ),
     );
   }
 }
