// frontedit
import 'dart:io';
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart'as fire_core;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

import 'detail.dart';
import 'frontpage.dart';



class marketpageedit extends StatefulWidget {
  const marketpageedit({Key? key}) : super(key: key);

  @override
  State<marketpageedit> createState() => _marketpageeditState();
}

// seller in a perticular skill has been set, dont forget to add text controllers
// so seller can add content

String myurl = '';

String myurll = '';

String myurlll = '';
int nu=1;

final TextEditingController _namee = TextEditingController();
final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();



final storagee = FirebaseStorage.instance.ref('pic/$picturee').child(imgfilee.path);



// seller jobs cataloge , where buyers can add to it


//String sending = 'Sending ....';

//  firebase storage  for pics code

int nee =1;
int nuu =1;
XFile? picturee;
File imgfilee = File(picturee!.path);










final CollectionReference data = FirebaseFirestore.instance.collection(skills);


class _marketpageeditState extends State<marketpageedit> {

  @override

  String sending = 'Sending ....';


  final TextEditingController detail = TextEditingController();


  Future <void> uploadd () async{
    try{
      await  storagee.putFile( imgfilee);
      await storagee.getDownloadURL().then(
              (value) {
            setState(() {
              print(value);
              myurll   = value ;
            });}).whenComplete((){ setState(() {
        print(myurll);
        myurlll  =  myurll;
      });}) ;
      await  Future.delayed(Duration(seconds: 5));
      print(myurlll);

    } on fire_core.
    FirebaseException catch
    (e) {print(e);}
  }


  final TextEditingController detaile = TextEditingController();
  final TextEditingController _namee = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FirebaseFirestore firestore = FirebaseFirestore.instance;


  void _created() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;
    try {
      await firestore.collection('market').add({
        'url': myurll,
        'rate': 2,
        'com': 2,
        'comm': 2,
        "time": DateTime.now().millisecondsSinceEpoch,

      }).whenComplete(() {
        setState(() {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar
            (SnackBar(content: Text('Uploaded')));
        });
      });
    } catch (e) {
      print(e);
    }
  }



  void _create() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;
    try {
      await firestore.collection('market').add({
        'com': 2,
        'comm': 2,
        'name': _passwordController.text,
        'rate': 1,
        "time": DateTime.now().millisecondsSinceEpoch,}).whenComplete(() {
        setState(() {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar
            (SnackBar(content: Text('Uploaded')));
        });
      });
    } catch (e) {
      print(e);
    }
  }


@override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(width: 444,height: 667,padding: EdgeInsets.all(22),
        color: Colors.white,
        child: ListView(children: [
          SizedBox(height: 44,),
          Row(
            children: [

            ],
          ),
          SizedBox(height: 44,),
          Container(padding: EdgeInsets.all(22),
              decoration: BoxDecoration(borderRadius:
              BorderRadius.circular(11), border: Border.all(width: 9,color: Colors.white)),
              height: 222,width: 222,child:MaterialButton(onPressed: () async{
                ImagePicker picker= ImagePicker();
                final imgee= await picker.pickImage(

                    source: ImageSource.gallery);
                setState(()  {
                  picturee = imgee;
                  nu = 2;});
                setState(() {
                });

              }, child: nu == 1?
              Image(image: AssetImage( 'assets/l.png' ),fit: BoxFit.cover,):
              Image(image: FileImage(File(imgfilee.path)) ,fit: BoxFit.cover
                , )
                ,
              )
          ),

          SizedBox(height: 55,),

   TextField(controller: _passwordController,
   ),
          SizedBox(height: 44,),

          MaterialButton(
              minWidth: 77,height: 44,
              child:  Text('image',style: TextStyle(color: Colors.black),),
              color: Colors.orange,
              textColor: Colors.black,
              onPressed: () async{


                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                          backgroundColor: Colors.transparent,
                          title: Column(
                            children: [
                              CircularProgressIndicator(color: Colors.orange,),
                              SizedBox(height: 9,),
                              Text(
                                  sendings),
                            ],
                          ),
                          actions: [
                            ]));
                  uploadd().whenComplete((){ setState(() {
             _created();


                  });});


              }),

 SizedBox(height: 77,),

          MaterialButton(
              minWidth: 77,height: 44,
              child:  Text('front',style: TextStyle(color: Colors.black),),
              color: Colors.orange,
              textColor: Colors.black,
              onPressed: () async{


                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                          backgroundColor: Colors.transparent,
                          title: Column(
                            children: [
                              CircularProgressIndicator(color: Colors.orange,),
                              SizedBox(height: 9,),
                              Text(
                                  sendings),
                            ],
                          ),
                          actions: [



                          ]));
                   setState(() {
                     _create();
                   });

                    print(myurll);


                  //  _create();


              })
        ],),
      ),
    );
  }
}





















