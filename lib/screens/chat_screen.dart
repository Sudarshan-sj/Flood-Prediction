import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'enter_rainfall.dart';

class ChatScreen extends StatefulWidget {
  static String id = 'chat_screen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;
  User loggedInUser;
  String state_id;
  List<String> state = ['ANDAMAN & NICOBAR ISLANDS' ,'ARUNACHAL PRADESH', 'ASSAM & MEGHALAYA',
      'NAGA MANI MIZO TRIPURA', 'SUB HIMALAYAN WEST BENGAL & SIKKIM',
      'GANGETIC WEST BENGAL', 'ORISSA' ,'JHARKHAND', 'BIHAR', 'EAST UTTAR PRADESH',
      'WEST UTTAR PRADESH', 'UTTARAKHAND', 'HARYANA DELHI & CHANDIGARH', 'PUNJAB',
      'HIMACHAL PRADESH' ,'JAMMU & KASHMIR' ,'WEST RAJASTHAN', 'EAST RAJASTHAN'
      'WEST MADHYA PRADESH', 'EAST MADHYA PRADESH', 'GUJARAT REGION',
      'SAURASHTRA & KUTCH' ,'KONKAN & GOA' ,'MADHYA MAHARASHTRA', 'MATATHWADA',
      'VIDARBHA', 'CHHATTISGARH', 'COASTAL ANDHRA PRADESH', 'TELANGANA',
      'RAYALSEEMA', 'TAMIL NADU', 'COASTAL KARNATAKA', 'NORTH INTERIOR KARNATAKA',
      'SOUTH INTERIOR KARNATAKA', 'KERALA' ,'LAKSHADWEEP'];


  @override
  void initState(){
    super.initState();
    getCurrentUser();
  }
  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
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
        title: Text('⚡️Select City'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                decoration: kMessageContainerDecoration,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child:DropDownField(
                        onValueChanged: (dynamic value) {
                          state_id = value;
                        },
                        value: state_id,
                        required: true,
                        hintText: 'Choose a state',
                        labelText: 'State',
                        items: state,
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black, fontSize: 12.0,
                        ),
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        //Implement send functionality.
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>EnterRainfall(state: state_id)));
                      },
                      child: Text(
                        'Predict',
                        style: kSendButtonTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
