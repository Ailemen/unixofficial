// library
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart'as fire_core;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_document_picker/flutter_document_picker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'detail.dart';
import 'frontpage.dart';



class editor extends StatefulWidget {
  const editor({Key? key}) : super(key: key);

  @override
  State<editor> createState() => _editorState();
}

// seller in a perticular skill has been set, dont forget to add text controllers
// so seller can add content
final FirebaseAuth _auth = FirebaseAuth.instance;
var currentUser = _auth.currentUser;
String myurl = '';
String pick ='(0) Pick a file';
String myurll = '';
String holder = 'this';

String myurlll = '';
String mypdf = '';
int nu =1;

final TextEditingController _namee = TextEditingController();
final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();


File ?tfile ;



// seller jobs cataloge , where buyers can add to it


//String sending = 'Sending ....';

//  firebase storage  for pics code

String link  = '';
int nee =1;
int nuu =1;
XFile? picturee;
File imgfilee = File(picturee!.path);


int ne =1;

File imgfile = File(picturee!.path);


int neee =1;
int nuuu =1;
XFile? pictureee;
File imgfileee = File(picturee!.path);








final CollectionReference data = FirebaseFirestore.instance.collection(skills);

class _editorState extends State<editor> {

  @override
  void initState() {
    // TODO: implement initState

  }
  String sending = 'Sending ....';

  FirebaseStorage storageee = FirebaseStorage.instance;
  Future <void> uploaddd () async{
    try{
      await  storageee.ref('pic/$picturee').child(imgfilee.path).putFile( imgfileee);
      var dowurl = await storageee.ref().child( imgfilee.path).getDownloadURL().toString();
      setState(() {
        dowurl = myurlll;
      });

    } on fire_core.
    FirebaseException catch
    (e) {print(e);}
  }


  final TextEditingController detail = TextEditingController();


  final storagee = FirebaseStorage.instance.ref('pic/$picturee').child("${holder}");
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
        myurll  =  myurll;
      });}) ;
      await  Future.delayed(Duration(seconds: 5));
      print(myurlll);
      print('Completed');

    } on fire_core.
    FirebaseException catch
    (e) {print(e);}
  }





  FirebaseStorage pdfstorage = FirebaseStorage.instance;
  Future <void> uploadpdf ( String string  ,File file ) async{
    try{
      await  pdfstorage.ref('pdf/$string').putFile(file);
      await pdfstorage.ref('pdf/$string').getDownloadURL().then(
              (value) {
            setState(() {
              print(value);
              mypdf   = value ;
            });}).whenComplete((){ setState(() {
        print(myurll);
      mypdf  =  mypdf;
      });}) ;
      await  Future.delayed(Duration(seconds: 5));
      print(myurlll);
      print('Completed');;
      setState(() {

      });
    } on fire_core.
    FirebaseException catch
    (e) {print(e);}
  }



  FirebaseStorage storage = FirebaseStorage.instance;
  Future <void> upload () async{
    try{
      await  storage.ref('pic/$picturee').putFile( imgfile);
      var dowurl = await storage.ref().getDownloadURL().toString();
      setState(() {
        dowurl = myurl;
      });
    } on fire_core.
    FirebaseException catch
    (e) {print(e);}
  }
  final TextEditingController detaile = TextEditingController();
  final TextEditingController _namee = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  void _create() async {
  //  final FirebaseAuth _auth = FirebaseAuth.instance;
   // var currentUser = _auth.currentUser;
    try {
      await firestore.collection('library').add({
        'name': _passwordController.text.toUpperCase(),
        'img': myurll,
        'pdf': mypdf,
        'owner':_namee.text,
        'nom':1,
        "email":currentUser!.email,
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




  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(width: 444,height: 667,padding: EdgeInsets.all(22),
        color: Colors.white,
        child: ListView(children: [
          SizedBox(height: 44,),
          Center(
            child: Text(
              "Upload your doc",
              style:
              TextStyle(color: Colors.blue.shade900,
                  fontSize: 22,fontWeight: FontWeight.w500),
            ),
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
                  holder=imgee!.path;
                });

              }, child: nu == 1?
              Image(image: AssetImage( 'assets/l.png' ),fit: BoxFit.cover,):
              Image(image: FileImage(File(imgfilee.path)) ,fit: BoxFit.cover
                , )
                ,
              )
          ),
          Row(
            children: [

            ],
          ),
          SizedBox(height: 44,),


          TextFormField(controller: _passwordController,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.person,
                color: Colors.blue.shade900,
              ),
              hintText: 'Book name',
            ),
          ),
          SizedBox(height: 44,),
          TextFormField(controller: _namee,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.book,
                color: Colors.blue.shade900,
              ),
              hintText: 'About document',
            ),
          ),
          SizedBox(height: 44,),
          MaterialButton(height: 77,minWidth: 111,
            shape: StadiumBorder(),
            color: Colors.blue.shade900
            ,onPressed: ()async{
              final path = await FlutterDocumentPicker.openDocument();
              setState(() {
                pick='(1) File Selected';
              });
              print(path);
              File file = File(path!);
              setState(() {
                tfile=file;
                print(file);
              });

          },child: Text(pick,style:
            TextStyle(color: Colors.white),),),
          SizedBox(height: 44,),
          MaterialButton(
              shape: StadiumBorder(),
              minWidth: 77,height: 77,
              child:  Row(
                children: [
                  SizedBox(width: 99,),
                  Center(child: Text('Upload',style: TextStyle(color: Colors.black),)),
                  Icon(Icons.upload),
                ],
              ),
              color: Colors.orange,
              textColor: Colors.black,
              onPressed: () async{
                    if(_passwordController.text.isNotEmpty&& _namee.text.isNotEmpty
                    && picturee!.path.isNotEmpty&& tfile!.path.isNotEmpty){
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                              backgroundColor: Colors.white,
                              title: Column(
                                children: [
                                  Center(child: SpinKitDualRing(color:
                                  Colors.blue.shade900,size: 44,),),
                                  SizedBox(height: 9,),
                                  Text('Uploading....',style:
                                  TextStyle(color: Colors.blue.shade900,
                                      fontWeight: FontWeight.w500),)
                                ],
                              ),
                              actions: [


                              ]));
                await uploadpdf( tfile!.path.toString(), tfile!)
                    .whenComplete(() { print('done');
                uploadd().whenComplete((){
                  _create();}
                );});}else{ return setState(() {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                              backgroundColor: Colors.white,
                              title: Column(
                                children: [

                                  Text(
                                      'Notice !'),
                                  Text(
                                      'Please complete form '
                                    ,style: TextStyle(color: Colors.green),),
                                ],
                              ),
                              actions: [


                              ]));
                      print(link);
                    });}
                print(link);
                    setState(() {

                print(link);
                                  });


                //  getPdfAndUpload();


              })
        ],),
      ),
    );
  }

}





















