import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'detail.dart';
import 'imagepage.dart';






//import '../seller pages/sellerprofil.dart';

class frontbuyer extends StatefulWidget {
  const frontbuyer({Key? key}) : super(key: key);

  @override

  State<frontbuyer> createState() => _frontbuyerState();
}




// anonimouse sign in part



String userName = "";
String email = "";
//AuthService authService = AuthService();
Stream? groups;
bool _isLoading = false;
String groupName = "";
Stream<QuerySnapshot>? chats;
TextEditingController messageController = TextEditingController();

final FirebaseFirestore firestoree = FirebaseFirestore.instance;

String thename = '';

final Query<Map<String, dynamic>> data =
FirebaseFirestore.instance.collection('front').orderBy('time');

sendRequest() {


}
// for  user favourite



//final FirebaseFirestore firestore = FirebaseFirestore.instance.collection('front');

final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();


class _frontbuyerState extends State<frontbuyer> {


  int imageheight = 667;
  int imagewidth = 444;

  @override
  String passx = 'password';


  void initState() {
    // TODO: implement initState
    super.initState();
    //edata();
    print(passx);
  }

//inistate for favourites and  annonimouse sgn in


  @override
// final GoogleSignIn gog = GoogleSignIn();
  String urlone = '';

  String urltwo = '';

  String urlthree = '';

  Widget build(BuildContext context) {
    return Scaffold(


        backgroundColor: Colors.white,
        body:
        Stack(
          children: [
            StreamBuilder(
                stream: data.snapshots(),
                builder: (context,
                    AsyncSnapshot<QuerySnapshot?>StreamSnapshot) {
                  if (StreamSnapshot.hasData) {
                    return

                      Container(
                        decoration: BoxDecoration(color: Colors.brown.shade100,
                          image: DecorationImage(
                              image: AssetImage('assets/d.jpg'), fit: BoxFit.cover),

                        ), width: double.infinity,
                        height: 667,
                        child: ListView.builder(
                            itemCount: StreamSnapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              String ant = 'N';
                              DocumentSnapshot documentSnapshot
                              = StreamSnapshot.data!.docs[index];
                              num rate = documentSnapshot['com'];
                              num ratee = documentSnapshot['comm'];


                              updater() async {
                                setState(() {
                                  rate = documentSnapshot['com'];
                                });
                              };

                              updates() async {
                                setState(() {
                                  rate++;
                                });
                              };


                              updaterr() async {
                                setState(() {
                                  ratee = documentSnapshot['comm'];
                                });
                              };

                              updatess() async {
                                setState(() {
                                  ratee++;
                                });
                              };


                              comdate() async {
                                await updaterr();
                                updatess();
                              };


                              return documentSnapshot['rate'] == 1
                              // Text
                                  ? Column(
                                children: [
                                  Container(margin: EdgeInsets.only(left: 0,
                                      right: 0),
                                    alignment: Alignment.centerLeft,
                                    decoration: BoxDecoration(
                                      color: Colors.white
                                      ,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20),
                                      ),
                                    ),
                                    padding: EdgeInsets.all(19),

                                    child: Text(
                                      documentSnapshot['name'] ?? '',
                                      textAlign: TextAlign.start,
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                          letterSpacing: -0.5),
                                    ),
                                  ),
                                  Container(
                                    child: Row(children: [
                                    ],),
                                  ),

                                ],
                              )
                                  : Column(
                                children: [
                                  SizedBox(height: 11,)
                                 , Row(
                                    children: [
                                    ],
                                  ),
                                  SizedBox(height: 29,),
                                  Container(
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .height,
                                    height: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 1.8,
                                    child: MaterialButton(onPressed: () {
                                      setState(() {
                                        imager = documentSnapshot['url'] ?? '';
                                        Future.delayed(Duration(microseconds: 1))
                                            .whenComplete(() =>
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        imgpage())));
                                      });
                                    }),

                                    decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                              ),
                                        color: Colors.grey.shade900
                                        ,
                                        image: DecorationImage(image: NetworkImage(
                                            documentSnapshot['url'] ?? ''
                                        ), fit: BoxFit.cover),
                                        border: Border.all(
                                            width: 1, color: Colors.white)),


                                  ),


                                ],
                              );
                            }),
                      );
                  } else {
                    return Container();
                  }
                }),
            Align(alignment: Alignment.topCenter,
              child: Column(
                children: [
                  SizedBox(height: 19,),
                  Row(
                    children: [
                      SizedBox(width: 11,),
                      GestureDetector(onTap: (){
                        setState(() {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                backgroundColor: Colors.white,
                                title:Center(child:
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("For advert placement and more "
                                        "contact us at 'unixcareofficial@gmail.com'"
                               , style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                    letterSpacing: -0.5),),

                                  ],
                                )),
                              ));

                        });},
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/o.png'), fit: BoxFit.cover),

                          ), width: 66,
                          height: 66,),
                      ),
                      Text(
                        '',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize:39 ,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            letterSpacing: -0.5),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));;
  }


  final Query<Map<String, dynamic>> datard = FirebaseFirestore.instance.
  collection('front').orderBy('time');

  chatMessages() {
    return StreamBuilder(
      stream: datard.snapshots(),
      builder: (context,
          AsyncSnapshot<QuerySnapshot?>StreamSnapshot) {
        if (StreamSnapshot.hasData) {
          return

            Container(decoration: BoxDecoration(color: Colors.brown.shade100,
                image: DecorationImage(
                    image: AssetImage('assets/f.png'), fit: BoxFit.cover)
            ),
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              width: double.infinity,

              child: ListView.builder(padding: EdgeInsets.all(14),
                  itemCount: StreamSnapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    String ant = 'N';
                    final DocumentSnapshot documentSnapshot
                    = StreamSnapshot.data!.docs[index];
                    Color love = Colors.red;
                    Color lover = Colors.white;
                    Color lov = lover;
                    return MaterialButton(onPressed: () {
                      setState(() {
                        imager = documentSnapshot['url'] ?? '';
                        Future.delayed(Duration(seconds: 1)).whenComplete(() =>
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => imgpage())));
                      });
                    },
                        child:

                        Container(
                          padding: EdgeInsets.only(
                              top: 4,
                              bottom: 4,
                              left: 24,
                              right: 0),
                          alignment: Alignment.centerLeft,
                          child: Container(
                            margin: const EdgeInsets.only(right: 30),
                            padding:
                            const EdgeInsets.only(
                                top: 17, bottom: 17, left: 20, right: 20),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                              color: Colors.blueGrey,),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      imager = documentSnapshot['url'] ?? '';
                                      Future.delayed(Duration(microseconds: 1))
                                          .whenComplete(() =>
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      imgpage())));
                                    });
                                  }, child:
                                Container(height: 44,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade900
                                      ,
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              documentSnapshot['url'] ?? ''
                                          ), fit: BoxFit.cover),
                                      borderRadius:
                                      BorderRadius.circular(44),
                                      border: Border.all(
                                         color: Colors.white)),
                                  padding: EdgeInsets.fromLTRB(
                                      15.0, 10.0, 15.0, 10.0),
                                  width: 44,

                                  margin: EdgeInsets.only(
                                      bottom: 10.0, right: 10.0),
                                ),),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      documentSnapshot['name'],
                                      textAlign: TextAlign.start,
                                      style: const TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          letterSpacing: -0.5),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(documentSnapshot['content'],
                                        style: const TextStyle(
                                            fontSize: 16, color: Colors.white))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                    );
                  }),
            );
        } else {
          return Container(color: Colors.white,child: Center(child: Text('Nothing yet'),),);
        }
      },
    );
  }
}