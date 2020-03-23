import 'package:flutter/material.dart';
import 'package:ieeepoint/home.dart';
import'home.dart';
import'Design.dart';

class TabbedAppBarSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: choices.length,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.cyan[900],
            title: const Text('Adding Points'),
            bottom: TabBar(
              unselectedLabelColor: Colors.cyan[900],
              isScrollable: true,
              tabs: choices.map((Choice choice) {
                return Tab(
                  text: choice.title,
                );
              }).toList(),
            ),
          ),
          body: TabBarView(
            children:[
              MyHomePage(),
              WelcomeScreen(),
              WelcomeScreen(),
              WelcomeScreen(),
              WelcomeScreen(),
        ]
          ),

            ),
          ),
        );


  }
}

class Choice {
  const Choice({this.title});

  final String title;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Design'),
  const Choice(title: 'Marketing'),
  const Choice(title: 'Sponsorship'),
  const Choice(title: 'Technical'),
  const Choice(title: 'Logistics'),
];


void main() {
  runApp(TabbedAppBarSample());
}