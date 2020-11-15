import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/components/rounded_button.dart';

class DisplayScreen extends StatefulWidget {
  final int predict;
  final String state;
  DisplayScreen({this.predict,this.state});
  static String id = 'display_screen';
  @override
  _DisplayScreenState createState() => _DisplayScreenState();
}

class _DisplayScreenState extends State<DisplayScreen> {
  final _auth = FirebaseAuth.instance;
  User loggedInUser;
  int floodpredict;
  String state_id;
  @override
  void initState(){
    super.initState();
    floodpredict = widget.predict;
    state_id = widget.state;
    getCurrentUser();
  }
  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    }
    catch(e){
      print(e);
    }
  }
  String returnText(){
    if(floodpredict==1){
      return("There are high chances of flood in $state_id. Be Careful!");
    }
    else{
      return("There are less chances of flood in $state_id!");
    }
  }
  Icon returnIcon(){
    if(floodpredict==1){
      return(Icon(
        Icons.warning,
        color: Colors.yellow,
        size: 70.0,
      ));
    }
    else{
      return(Icon(
        Icons.wb_sunny,
        color: Colors.yellow,
        size: 70.0,
      ));
    }
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                //Implement logout functionality
                _auth.signOut();
                Navigator.pop(context);
              }),
        ],
        title: Text('⚡️Predicton'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
              height: 40.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                      Center(child: returnIcon()),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  returnText(),
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
              RoundedButton(
                title: 'Predict Again',
                colour: Colors.blueAccent,
                onPressed: () {
                  int count = 0;
                  Navigator.of(context).popUntil((_) => count++ >=2);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}