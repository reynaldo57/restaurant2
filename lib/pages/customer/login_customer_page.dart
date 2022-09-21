

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginCustomerPage extends StatefulWidget {

  @override
  _LoginCustomerPageState createState() => _LoginCustomerPageState();
}

class _LoginCustomerPageState extends State<LoginCustomerPage> {

  GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);

  signOut() async{
    googleSignIn.signOut();
  }

  googleCheckUser(){
    print(googleSignIn.currentUser);
  }



  loginGoogle() async{

    try{
      GoogleSignInAccount? googleSignInAcount = await googleSignIn.signIn();
      print(googleSignInAcount!.email);
      print(googleSignInAcount.displayName);
      print(googleSignInAcount.photoUrl);

      if(googleSignInAcount == null){
        return;
      }

      GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAcount.authentication;

      print(googleSignInAuthentication.accessToken);
      print(googleSignInAuthentication.idToken);

      OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      UserCredential user = await FirebaseAuth.instance.signInWithCredential(credential);
      print(user);

    }catch (e){
      print(e);
    }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 50.0,
                  ),
                  Container(
                    width: double.infinity,
                    height: 50.0,
                    child: ElevatedButton(
                      onPressed: () {
                        loginGoogle();
                      },
                      child: Text(
                        "GOOGLE LOGIN",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Container(
                    width: double.infinity,
                    height: 50.0,
                    child: ElevatedButton(
                      onPressed: () {
                        signOut();
                      },
                      child: Text(
                        "GOOGLE SingOut",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Container(
                    width: double.infinity,
                    height: 50.0,
                    child: ElevatedButton(
                      onPressed: () {
                        googleCheckUser();
                      },
                      child: Text(
                        "Check User",
                      ),
                    ),
                  ),
                  
                ],
              )
            ),
          ),
        ));
  }
  }

