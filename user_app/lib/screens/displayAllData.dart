import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DisplayAllData extends StatefulWidget {

  final String disability;
  final String state;

  const DisplayAllData({Key? key, required this.disability, required this.state}) : super(key: key);

  @override
  State<DisplayAllData> createState() => _DisplayAllDataState();
}

class _DisplayAllDataState extends State<DisplayAllData> {

  String? states;
  String? disabilities;

  var list = [];
  List? newlist = [];

  @override
  void initState() {
    // TODO: implement initState
    states = widget.state;
    disabilities = widget.disability;
    super.initState();

    FirebaseFirestore.instance
        .collection('nodal')
        .where('st',isEqualTo: states)
        .get()
        .then((QuerySnapshot querySnapshot) => {
      querySnapshot.docs.forEach((doc) async {

        print(doc);

        // jobcards.add(doc);
        // String jobid = doc['jobid'];

        setState(() {});
      }),
    }).catchError((onError){
      print(onError);
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
