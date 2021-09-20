import 'package:flutter/material.dart';
import 'package:flutter_ap_biomet/main.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter/services.dart';



class Contact extends StatelessWidget {

  var homeValueString = 'Contact';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[900].withOpacity(0.9),
        title: Text('$homeValueString'),
        //title: Text("Gall"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
