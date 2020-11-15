import 'package:flash_chat/screens/display_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/components/rounded_button.dart';


class EnterRainfall extends StatefulWidget {
  final String state;
  EnterRainfall({this.state});
  static String id = 'enter_rainfall';
  @override
  _EnterRainfallState createState() => _EnterRainfallState();
}

class _EnterRainfallState extends State<EnterRainfall> {
  final _auth = FirebaseAuth.instance;
  String state_id;
  User loggedInUser;
  bool showSpinner = false;
  List<double> rainfall = [0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0];
  @override
  void initState(){
    super.initState();
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
        title: Text('⚡️Enter Rainfall Data'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
                  child: Text(
                      'Enter the estimated rainfall in the place for following months',
                       textAlign: TextAlign.center,
                       style: TextStyle(
                         fontSize: 20.0,
                         fontWeight: FontWeight.bold,
                       ) ,
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                TextField(
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    //Do something with the user input.
                    rainfall[0]=double.parse(value);
                  },
                  decoration: kTextFieldDecoration.copyWith(hintText: 'Rainfall in January'),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    //Do something with the user input.
                    rainfall[1]=double.parse(value);
                  },
                  decoration: kTextFieldDecoration.copyWith(hintText: 'Rainfall in February'),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    //Do something with the user input.
                    rainfall[2]=double.parse(value);
                  },
                  decoration: kTextFieldDecoration.copyWith(hintText: 'Rainfall in March'),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    //Do something with the user input.
                    rainfall[3]=double.parse(value);
                  },
                  decoration: kTextFieldDecoration.copyWith(hintText: 'Rainfall in April'),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    //Do something with the user input.
                    rainfall[4]=double.parse(value);
                  },
                  decoration: kTextFieldDecoration.copyWith(hintText: 'Rainfall in May'),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    //Do something with the user input.
                    rainfall[5]=double.parse(value);
                  },
                  decoration: kTextFieldDecoration.copyWith(hintText: 'Rainfall in June'),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    //Do something with the user input.
                    rainfall[6]=double.parse(value);
                  },
                  decoration: kTextFieldDecoration.copyWith(hintText: 'Rainfall in July'),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    //Do something with the user input.
                    rainfall[7]=double.parse(value);
                  },
                  decoration: kTextFieldDecoration.copyWith(hintText: 'Rainfall in August'),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    //Do something with the user input.
                    rainfall[8]=double.parse(value);
                  },
                  decoration: kTextFieldDecoration.copyWith(hintText: 'Rainfall in September'),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    //Do something with the user input.
                    rainfall[9]=double.parse(value);
                  },
                  decoration: kTextFieldDecoration.copyWith(hintText: 'Rainfall in October'),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    //Do something with the user input.
                    rainfall[10]=double.parse(value);
                  },
                  decoration: kTextFieldDecoration.copyWith(hintText: 'Rainfall in November'),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    //Do something with the user input.
                    rainfall[11]=double.parse(value);
                  },
                  decoration: kTextFieldDecoration.copyWith(hintText: 'Rainfall in December'),
                ),
                SizedBox(
                  height: 24.0,
                ),
                RoundedButton(
                  title: 'Predict',
                  colour: Colors.blueAccent,
                  onPressed: () {
                    if(rainfall[6]+rainfall[7]+rainfall[8]+rainfall[5]>2100.0){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>DisplayScreen(predict:1,state: state_id)));
                    }
                    else{
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>DisplayScreen(predict:0,state: state_id)));
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}