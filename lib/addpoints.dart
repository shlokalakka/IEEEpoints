import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import'round_button.dart';
import'update points.dart';

final _firestore = Firestore.instance;
FirebaseUser loggedInUser;

class Question extends StatefulWidget {
  static const String id = 'question';
  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  final stringController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  String  score ;
  String name;
  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }
  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
              }),
        ],
        title: Text('Number of Points ',
        style:TextStyle(color:Colors.cyan[900],)),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
            height: 8,
          ),
        Center(
          child:Text('IEEE',
            style: TextStyle(
              fontSize: 45.0,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
            SizedBox(
              height: 200,
            ),

            Expanded(
              child:TextField(
                onChanged: (value) {
                  score = value;
                },
                decoration:
                kTextFieldDecoration.copyWith(hintText: 'Enter number of points'),

              ),
            ),

        RoundedButton(
          title: 'Next',
          colour: Colors.cyan[900],
          onPressed: () {
          _firestore.collection('creds').document('123').setData({
               'name': 'hi',
            'score': int.parse(score),

                  });
    if (loggedInUser != null){
    Navigator.push(context, MaterialPageRoute(builder: (context) => TabbedAppBarSample()));}
    },


        ),
          ],
      ),

        ),
      );



  }
}