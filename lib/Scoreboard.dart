import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class LoadDataFromFirestore extends StatefulWidget {
  @override
  _LoadDataFromFirestoreState createState() => _LoadDataFromFirestoreState();
}
class _LoadDataFromFirestoreState extends State<LoadDataFromFirestore> {
  @override
  void initState() {
    super.initState();
    getDriversList().then((results) {
      setState(() {
        querySnapshot = results;
      });
    });
  }
  QuerySnapshot querySnapshot;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            color:Colors.cyan[900],
              icon: Icon(Icons.close,),
              onPressed: () {

                Navigator.pop(context);
              }),

        ],

        title: Text(
          "ScoreBoard",
          textAlign: TextAlign.center,
          style:TextStyle(color:Colors.cyan[900],fontWeight:FontWeight.bold ) ,),
      ),

      body:

      _showDrivers(),

    );

  }

  Widget _showDrivers() {
    if (querySnapshot != null) {

      return ListView.builder(

          primary: false,
          itemCount: querySnapshot.documents.length,
          padding: EdgeInsets.all(12),
          itemBuilder: (context,i) {
            return  Column(
              children: <Widget>[
                Container(

                  width:1000.0,
                  height:40.0,
                  color:Colors.cyan[900],
                  child:Align(
                    alignment: Alignment.center,
                    child:Text(" ${querySnapshot.documents[i].data['name']}:                                           ""${querySnapshot.documents[i].data['score']}",


                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,fontSize: 20,
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height:5,
                ),
              ],
            );

          }
      );
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }

  //get firestore instance
  getDriversList() async {
    return await Firestore.instance.collection('profile').getDocuments();
  }


}