import 'package:flutter/material.dart';
import 'package:flutter_ap_biomet/Contact.dart';
import 'package:flutter_ap_biomet/Gallery.dart';
import 'package:flutter_ap_biomet/Setting.dart';
import 'package:flutter_ap_biomet/Website.dart';
import 'package:flutter_ap_biomet/main.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter/services.dart';



/*
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
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
}*/


void main() {
  runApp(MaterialApp(
    //debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _ShapedDrawerState createState() => _ShapedDrawerState();
}

class _ShapedDrawerState extends State<Home> {
  static const routeName = '/LightDrawerPage';
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  final Color primary = Colors.white;

  final Color active = Colors.grey.shade800;

  final Color divider = Colors.grey.shade600;

  var homeValueString = 'Home';

  /*navigateToPage(BuildContext context, String page) {
    Navigator.of(context).pushNamedAndRemoveUntil(page, (Route<dynamic> route) => false);
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _key,
        appBar: AppBar(
          backgroundColor: Colors.indigo[900].withOpacity(0.9),
          title: Text('$homeValueString'),
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              setState(() {
                _key.currentState.openDrawer();

              });
            },
          ),
        ),

        /// ----------------
        /// Building drawer here .
        /// ---------------
        drawer: _buildDrawer(),

        /// ----------------
        /// Main Content .
        /// ---------------
       // Text:Text(),
        body: Center(
          child: Text("Welcome, You've logged in Successfully...!!",
           // '$homeValueString',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              color: Colors.green[900],
            ),
          ),
         // Text:Text('ujiguj'),
        )
    );
  }

  _buildDrawer() {
    final String image = 'assets/images/background1.jpg';
    return ClipPath(

      clipper: OvalRightBorderClipper(),

      child: Drawer(
        child: Container(
          padding: const EdgeInsets.only(left: 16.0, right: 40),
          decoration: BoxDecoration(
              color: primary, boxShadow: [BoxShadow(color: Colors.black45)]),
          width: 300,
          child: SafeArea(

            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: Icon(
                        Icons.power_settings_new,
                        color: Colors.black87,
                      ),
                      onPressed: () {
                       // Navigator.pop(context);
                        Navigator.pushReplacementNamed(context, '/'
                        );
                      },
                    ),
                  ),


                  Container(
                    height: 83,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.indigo[900],
                    ),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('images/insta_icon.png'),
                    ),
                  ),
                  SizedBox(height: 5.0),


                  Padding(padding: EdgeInsets.all(4.0)),
                  Text(
                    "Garima Sharma",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(4.0)),
                  Text(
                    "garima19dec1996@gmail.com",
                    style: TextStyle(
                        color: active,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600),
                  ),



                  SizedBox(height: 30.0),
                  ListTile(
                    leading: Icon(Icons.home),
                    title:Text('Home'),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Home() ),
                    ),
                        //Navigator.of(context).pushNamed("Gallery")
                        //navigateToPage(context,'gallery'),
                  ),
                  _buildDivider(),
                  //_buildRow(Icons.home, "Home"),
                  //_buildDivider(),
                //  _buildRow(Icons.android, 'Application'
                   //   , showBadge: true
                 // ),
                  ListTile(
                    leading: Icon(Icons.photo_size_select_actual),
                    title:Text('Gallery'),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Gallery() ),
                    ),
                    //Navigator.of(context).pushNamed("Gallery")
                    //navigateToPage(context,'gallery'),
                  ),
                  //_buildRow(Icons.photo_size_select_actual, "Gallery"),
                  _buildDivider(),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title:Text('Setting'),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Setting() ),
                    ),
                    //Navigator.of(context).pushNamed("Gallery")
                    //navigateToPage(context,'gallery'),
                  ),
               //   _buildRow(Icons.add, "And"),
                //  _buildDivider(),
                 // _buildRow(Icons.settings, "Setting"),
                  _buildDivider(),
                  ListTile(
                    leading: Icon(Icons.web),
                    title:Text('Website'),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Website() ),
                    ),
                    //Navigator.of(context).pushNamed("Gallery")
                    //navigateToPage(context,'gallery'),
                  ),
                  //_buildRow(Icons.web, "Website"
                   //   , showBadge: true
                  //),
                  /*_buildDivider(),
                  ListTile(
                    leading: Icon(Icons.query_builder),
                    title:Text('Any Query?'),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Query() ),*/
                   // ),
                    //Navigator.of(context).pushNamed("Gallery")
                    //navigateToPage(context,'gallery'),
                  //),
                //  _buildRow(Icons.developer_mode, "Developers"),
                //  _buildDivider(),
                  //_buildRow(Icons.query_builder, "Any Query?"),
                  _buildDivider(),
                  ListTile(
                    leading: Icon(Icons.message),
                    title:Text('Contact Us'),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Contact() ),
                    ),
                    //Navigator.of(context).pushNamed("Gallery")
                    //navigateToPage(context,'gallery'),
                  ),
                  //_buildRow(Icons.message, "Contact Us"),
                  _buildDivider(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// ---------------------------
  /// Building divider for drawer .
  /// ---------------------------

  Divider _buildDivider() {
    return Divider(
      color: divider,
    );
  }

  /// ---------------------------
  /// Building item  for drawer .
  /// ---------------------------

  Widget _buildRow(IconData icon, String title, {bool showBadge = false}) {
    final TextStyle tStyle = TextStyle(color: active, fontSize: 16.0);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Padding(
        padding: const EdgeInsets.only(right: 5.0),
        child: GestureDetector(
          onTap: () {
            setState(() {
              homeValueString = title;
              Navigator.pop(context);
              /*Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Gallery() ),

              );*/
            });
          },
          child: Row(
            children: [
              Icon(
                icon,
                color: active,
              ),
              SizedBox(width: 10.0),
              Text(
                title,
                style: tStyle,
              ),
              Spacer(),
              /*if (showBadge)
                Material(
                  color: Colors.deepOrange,
                  elevation: 4.0,
                  shadowColor: Colors.red,
                  borderRadius: BorderRadius.circular(5.0),
                  child: Container(
                    padding: EdgeInsets.all(4.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Text(
                      "5+",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),*/
            ],
          ),
        ),
      ),
    );
  }
}


class OvalRightBorderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(size.width - 40, 0);
    path.quadraticBezierTo(
        size.width, size.height / 4, size.width, size.height / 2);
    path.quadraticBezierTo(size.width, size.height - (size.height / 4),
        size.width - 40, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

