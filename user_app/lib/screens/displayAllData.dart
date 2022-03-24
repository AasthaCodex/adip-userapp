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
  String? scheme;

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
          //print(querySnapshot),
          print(querySnapshot.docs),
      querySnapshot.docs.forEach((doc) async {

        print(doc);
        list = doc.get('hospital');
        print(list);

        // jobcards.add(doc);
        // String jobid = doc['jobid'];

        setState(() {});
      }),
    }).catchError((onError){
      print(onError);
    });

    FirebaseFirestore.instance
        .collection('schemes')
        .where('dt', isEqualTo: disabilities)
        .where('states', isEqualTo: states)
        .get()
        .then((QuerySnapshot querySnapshot) => {
      //print(querySnapshot),
      print(querySnapshot.docs),
      querySnapshot.docs.forEach((doc) async {

        newlist!.add(doc);
        scheme = doc['scheme'];
        print(scheme);

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
      backgroundColor: Color(0xfffff3e9),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 60, left: 20),
            child: Text('Scheme Name - ', style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                //color: Colors.deepOrange
            ),),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20),
            child: Container(
              height: 80,
              width: 350,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 2)
                  //borderRadius: BorderRadius.circular(20)
              ),
              child: Center(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('$scheme', style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange
                ),),
              )),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (BuildContext context,int index){
                return Padding(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
                  child: Container(
                    height: 260,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.white,
                        border: Border.all(color: Colors.black, width: 2),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Hospital Name',
                            style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                          child: Text('${list[index]["address"]}',
                            style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              color: Colors.deepOrange
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Contact Person',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                          child: Text('${list[index]["person"]}',
                            style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepOrange
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Phone No',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                          child: Text('${list[index]["contact"]}',
                            style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepOrange
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Email Id',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                          child: Text('${list[index]["email"]}',
                            style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepOrange
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}
