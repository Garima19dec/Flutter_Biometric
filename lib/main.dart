//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_ap_biomet/Home.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter/services.dart';
//import 'package:flutter_svg/svg.dart';


void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: AuthApp(),
));

class AuthApp extends StatefulWidget {
  @override
  _AuthAppState createState() => _AuthAppState();
}

class _AuthAppState extends State<AuthApp> {
  LocalAuthentication auth = LocalAuthentication();
  bool _canCheckBiometric;
  List<BiometricType> _availableBiometric;
  String authorized = "Not authorized";

  //checking biometrics
  //this function will check the sensors and will tell us
  // if we can use them or not
  Future<void> _checkBiometric() async{
    bool canCheckBiometric;
    try{
      canCheckBiometric = await auth.canCheckBiometrics;
    } on PlatformException catch(e){
      print(e);
    }
    if(!mounted) return;

    setState(() {
      _canCheckBiometric = canCheckBiometric;
    });
  }

  //this function will get all the available biometrics inside our device
  //it will return a list of objects, but for our example it will only
  //return the fingerprint biometric
  Future<void> _getAvailableBiometrics() async{
    List<BiometricType> availableBiometric;
    try{
      availableBiometric = await auth.getAvailableBiometrics();
    } on PlatformException catch(e){
      print(e);
    }
    if(!mounted) return;

    setState(() {
      _availableBiometric = availableBiometric;
    });
  }

  //this function will open an authentication dialog
  // and it will check if we are authenticated or not
  // so we will add the major action here like moving to another activity
  // or just display a text that will tell us that we are authenticated
  Future<void> _authenticate() async{
    bool authenticated = false;
    try{
      authenticated = await auth.authenticateWithBiometrics(
          localizedReason: "Scan your finger print to authenticate",
          useErrorDialogs: true,
          stickyAuth: false
      );
    } on PlatformException catch(e){
      print(e);
    }
    if(!mounted) return;

    setState(() {
      if(authenticated) {
        authorized = "Autherized success";
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Home()),
        );
      } else {
        authorized = "Failed to authenticate";
      }
 //     authorized = authenticated ? "Autherized success" : "Failed to authenticate";
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _checkBiometric();
    _getAvailableBiometrics();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black.withOpacity(0.9),
          title: Text('Welcome'),
          automaticallyImplyLeading: false,
          //title: Text("Gall"),
        ),



        body: Column(

          children: <Widget>[
            Padding(padding: EdgeInsets.all(30.0)),
            Text("Welcome to My Activity...!!",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
                color: Colors.green[900],
               ),
              ),
            Container(

            /*
                //for full screen set heightFactor: 1.0,widthFactor: 1.0,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/signup.png"),
                      //fit: BoxFit.fill,
                    ),
                  ),
                ),*/

                child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      new Image.asset("assets/signup.png")
                    ]
                )
            ),
            Padding(padding: EdgeInsets.only(bottom: 90.0)),
           /* Positioned(
              top: 10,
              left: 10,
              child: Image.asset(
                "assets/signup.png",
              ),
            ),*/
            Center(
              child: RaisedButton(
                onPressed: _authenticate,
                child:Text("Login via Fingerprint..!"),

              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 40.0)),
        /*  Column(
          children: <Widget>[
             if('$authorized'.equalsIgnoreCase("Autherized success"))
                Navigator.push(
                context,
                MaterialPageRoute(
                builder: (context) => Home()),
              );

             ],
            ),
*/
            Text("Can check biometric: $_canCheckBiometric"),
            Text("Available biometric: $_availableBiometric"),
            Text("Current State: $authorized"),

          ],
        ),
      ),
    );
  }
}