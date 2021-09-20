/*
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_ap_biomet/main.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

void main()
{
  runApp(MaterialApp(
    //debugShowCheckedModeBanner: false,
    //title: 'Contact',

    home: Gallery(),
  ));
}


class Gallery extends StatefulWidget {
  static const routeName = '/TextFieldProperty';
  @override
  _TextFieldPropertyState createState() => _TextFieldPropertyState();
}

class _TextFieldPropertyState extends State<Gallery> {

  var homeValueString = 'Gallery';


  Future<Null> _cropImage(filePath) async {
    File croppedImage = await ImageCropper.cropImage(
        sourcePath: filePath,
        maxWidth: 1080,
        maxHeight: 1080,
        aspectRatio: CropAspectRatio(ratioX: 1.0, ratioY: 1.0)
    );
    if (croppedImage  != null) {
      imageFile = croppedImage ;
      setState(() {});
    }
  }

  /// Variables
  File imageFile;

  /// Widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0XFF307777),
          title: Text("Image Cropper"),
        ),
        body: Container(
            child: imageFile == null
                ? Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    color: Color(0XFF307777),
                    onPressed: () {
                      _getFromGallery();
                    },
                    child: Text(
                      "PICK FROM GALLERY",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            )
                : Container(
              child: Image.file(
                imageFile,
                fit: BoxFit.cover,
              ),
            )));
  }

  /// Get from gallery
  _getFromGallery() async {
    PickedFile pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    _cropImage(pickedFile.path);
  }

  /// Crop Image
  _cropImage(filePath) async {
    File croppedImage = await ImageCropper.cropImage(
      sourcePath: filePath,
      maxWidth: 1080,
      maxHeight: 1080,
    );
    if (croppedImage != null) {
      imageFile = croppedImage;
      setState(() {});
    }
  }
}
*/


/*@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[900].withOpacity(0.9),
        title: Text('$homeValueString'),
        //title: Text("Gall"),
      ),*/
      /*body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),*/



/*

      );

  }
}
*/

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main()
{
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Contact',

    home: Gallery(),
  ));
}


class Gallery extends StatefulWidget {
  Gallery({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<Gallery> {
  File _pickedImage;

  var homeValueString = 'Gallery';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text('Profile'),
        backgroundColor: Colors.indigo[900].withOpacity(0.9),
        title: Text('$homeValueString'),
      ),
      body: ListView(
        children: <Widget>[

          Padding
            (padding: EdgeInsets.only(top: 20.0,left: 20.0,bottom: 30.0,right: 20.0)),
          Text("Hey, want to upload an Image...!!",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              color: Colors.green[900],
            ),
          ),

          Padding(padding: EdgeInsets.only(top: 20.0,left: 20.0,bottom: 30.0)),
          Center(
            child: CircleAvatar(
              radius: 80,
              child: _pickedImage == null ? Text("Picture") : null,
              backgroundImage:
              _pickedImage != null ? FileImage(_pickedImage) : null,
            ),
          ),
          const SizedBox(height: 10.0,width: 50.0,),
          Padding(padding: EdgeInsets.all(20.0)),
          RaisedButton(
            shape:RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.black),
              ),
            child: Text("Pick Image",
            style: TextStyle(
              fontSize: 15,
            ),
            ),
            onPressed: () {
              _showPickOptionsDialog(context);
            },
          ),

        ],
      ),
    );
  }

  _loadPicker(ImageSource source) async {
    File picked = await ImagePicker.pickImage(source: source);
    if (picked != null) {
      //   setState(() {
      //     _pickedImage = picked;
      //    } );
      _cropImage(picked);
    }
    Navigator.pop(context);
  }

  _cropImage(File picked) async {
    File cropped = await ImageCropper.cropImage(
      androidUiSettings: AndroidUiSettings(
        statusBarColor: Colors.red,
        toolbarColor: Colors.red,
        toolbarTitle: "Crop Image",
        toolbarWidgetColor: Colors.white,
      ),
      sourcePath: picked.path,
       // aspectRatio: CropAspectRatio(ratioX: 1.0, ratioY: 1.0),  // fixed crop aspect ratio
      aspectRatioPresets: [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio16x9,
        CropAspectRatioPreset.ratio4x3,
      ],
      maxWidth: 800,
    );
    if (cropped != null) {
      setState(() {
        _pickedImage = cropped;
      });
    }
  }
  
  void _showPickOptionsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: Text("Pick from Gallery"),
              onTap: () {
                _loadPicker(ImageSource.gallery);
              },
            ),
            ListTile(
              title: Text("Take a pictuer"),
              onTap: () {
                _loadPicker(ImageSource.camera);
              },
            )
          ],
        ),
      ),
    );
  }
}