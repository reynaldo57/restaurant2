

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginCustomerPage extends StatefulWidget {

  @override
  _LoginCustomerPageState createState() => _LoginCustomerPageState();
}

class _LoginCustomerPageState extends State<LoginCustomerPage> {

  signOut() async{
    GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
    googleSignIn.signOut();
  }



  loginGoogle() async{
    GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);

    try{
      GoogleSignInAccount? googleSignInAcount = await googleSignIn.signIn();
      print(googleSignInAcount!.email);
      print(googleSignInAcount.displayName);
      print(googleSignInAcount.photoUrl);
      
      if(googleSignInAcount == null){
        return ;
      }

      GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAcount.authentication;
      print(googleSignInAuthentication);

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
                ],
              )
            ),
          ),
        ));
  }
  }

