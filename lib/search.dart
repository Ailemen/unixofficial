
import 'dart:io';
import 'package:firebase_core/firebase_core.dart'as firebase_core;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

import 'package:path_provider/path_provider.dart';

import 'auth/login_page.dart';




class searchengine extends StatefulWidget {
  String urlname  = '';




  State<searchengine> createState() => _searchengineState();
}





Future lal( ) async {

}
int pages =1;
bool   isReady=false;

String searchKey ='';
Stream ?date;
Query<Map<String, dynamic>>? dataa ;
class _searchengineState extends State<searchengine> {


@override

void main(String string) async {
 setState(() {
   PDF().cachedFromUrl(
     string.toString(),
     placeholder: (progress) => Center(child: Text('$progress %')),
     errorWidget: (error) => Center(child: Text(error.toString())),
   );
 });
}



FirebaseStorage pdfstorage = FirebaseStorage.instance;
Future<void> downloadFileExample(String string) async {
  //First you get the documents folder location on the device...
  Directory appDocDir = await getApplicationDocumentsDirectory();

  print(appDocDir.path);
  //Here you'll specify the file it should be saved as
  File downloadToFile = File('${appDocDir.path}/downloaded-pdf.pdf');
  //Here you'll specify the file it should download from Cloud Storage
  String fileToDownload = 'pdf//data/user/0/com.example.notificate/cache/edosasa.pdf';

  //Now you can try to download the specified file, and write it to the downloadToFile.
  try {
    await pdfstorage
        .ref(fileToDownload)
        .writeToFile(downloadToFile).whenComplete((){setState(() {
      PDFView(
        filePath: downloadToFile.path,
        enableSwipe: true,
        swipeHorizontal: true,
        autoSpacing: false,
        pageFling: false,
        onRender: (_pages) {
          setState(() {
            pages = _pages!;
            isReady = true;
          });
        },
        onError: (error) {
          print(error.toString());
        },
        onPageError: (page, error) {
          print('$page: ${error.toString()}');
        },


      );
       //   Navigator.pop(context);
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                  backgroundColor: Colors.white,
                  title: Column(
                    children: [
                      SizedBox(height: 9,),
                      Text(
                          'Done'),
                    ],
                  ),
                  actions: [
                  ]));
        });});
  } on firebase_core.FirebaseException catch (e) {
    // e.g, e.code == 'canceled'
    print('Download error: $e');
  }
}
  void initState() {
    // TODO: implement initState
    setState(() {
      dataa =   FirebaseFirestore.instance.collection('library').orderBy('name')
          .where('name', isGreaterThanOrEqualTo: searchKey)
          .where('name', isLessThan: "${searchKey}z");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add,color: Colors.white,),
        onPressed: () {
          ///  popUpDialog(context);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>LoginPage()));
        },
        elevation: 0,
        backgroundColor: Colors.blue.shade900,

      ),
      body: Container
        (    padding: EdgeInsets.all(9),
        child: ListView(children: [
      Container(
        height: 77
        ,padding: EdgeInsets.all(9),

        child: TextFormField(
    decoration: InputDecoration(
fillColor: Colors.blue.shade200,
    hintText: '                     Search books ...',
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue.shade900,width: 1),
            borderRadius: BorderRadius.circular(22),

          ),
         ),
            onChanged: (value){
              setState(() {

           searchKey = value;
                dataa =   FirebaseFirestore.instance.collection('library').orderBy('name')
                    .where('name', isGreaterThanOrEqualTo: searchKey.toUpperCase())
                    .where('name', isLessThan: "${searchKey.toUpperCase()}z");

            //  searchengine(press: lal()).press;
              });
            }),
      ),

      StreamBuilder(
          stream: dataa!.snapshots(),
          builder: (context,
              AsyncSnapshot<QuerySnapshot?>StreamSnapshot)
          {    if(StreamSnapshot.hasData){

            return

              Container( decoration: BoxDecoration(

              ),
                height: MediaQuery.of(context).size.height,
                width: double.infinity,

                child: ListView.builder(padding: EdgeInsets.all(14),
                    itemCount: StreamSnapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      String ant ='https://www.fiverr.com/s2/8631867a24';
                      final DocumentSnapshot documentSnapshot
                      = StreamSnapshot.data!.docs[index];
                      Color  love = Colors.red;
                      Color  lover = Colors.white;
                      Color  lov = lover;
                      return   MaterialButton(onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute<dynamic>(
                            builder: (_) => PDFViewerFromUrl(
                          url:"${documentSnapshot['pdf']??""}" ,
                        ),
                        ),);
                        setState(() {


                       //   downloadFileExample(documentSnapshot['pdf'] );
                     //     urlname = documentSnapshot['url'];
                          Future.delayed(Duration(milliseconds: 11)).whenComplete(()
                          {setState(() {

                        //    _launchUrl();
                          });});
                        });
                      },
                        child: Column(
                          children: [

                            Container( height: MediaQuery
                            .of(context)
                            .size
                            .height / 2,
                              width:   MediaQuery
                          .of(context)
                          .size
                          .width,
                              decoration: BoxDecoration(

                                  borderRadius:
                                  BorderRadius.circular(22), border:
                              Border.all(width: 2,color: Colors.white)),
                              child: ListTile(
                                title: Row(
                                  children: [
                                    Container(height: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 2.4,
                                      width:MediaQuery
                                  .of(context)
                                  .size
                                  .width /1.5,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage('${documentSnapshot['img']??""}'),
                                              fit: BoxFit.cover),
                                          borderRadius:
                                          BorderRadius.circular(22), border:
                                      Border.all(width: 2,color: Colors.grey)),
                                    ),

                                  ],
                                ),
                                subtitle: Column(
                                  children: [
                                    SizedBox(height: 8,),
                                    Row(
                                      children: [SizedBox(width: 5,),
                                        Text(documentSnapshot['name']??"".toUpperCase(),
                                            style:  TextStyle(fontSize:
                                            18, color: Colors.blue.shade900)
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [ SizedBox(width: 5,),
                                        Text(documentSnapshot['owner']??"".toUpperCase(),
                                            style:  TextStyle(fontSize:
                                            14, color: Colors.grey.shade500)
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [SizedBox(width: 5,),

                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.star,color:documentSnapshot['nom']
                                            ==1?Colors.white:Colors.blue.shade900 ,),
                                        Icon(Icons.star,color:documentSnapshot['nom']
                                            ==1?Colors.white:Colors.blue.shade900 ,),
                                        Icon(Icons.star,color:documentSnapshot['nom']
                                            ==1?Colors.white:Colors.blue.shade900 ,),
                                        Icon(Icons.star,color:documentSnapshot['nom']
                                            ==1?Colors.white:Colors.blue.shade900 ,),
                                        Icon(Icons.star,color:documentSnapshot['nom']
                                            ==1?Colors.white:Colors.blue.shade900 ,),
                                      ],
                                    ),
                                    SizedBox(height: 5,)
                                  ],
                                ),
                              ),
                            ),
                            Row(
                              children: [ SizedBox(width: 22,),
                                MaterialButton(onPressed:(){setState(() {
                                  //     dataa.doc(documentSnapshot.id).delete();
                                });},
                                  child: Container(
                                    decoration: BoxDecoration(borderRadius:
                                    BorderRadius.circular(11), border: Border.all(width: 1,color: Colors.orange.shade800)),
                                  ),
                                ),
                              ],
                            ),  ],
                        ),
                      );
                    }),
              );} else{  return Container(color: Colors.white);}

          }),
    ],),),);
  }
}







class PDFViewerFromUrl extends StatelessWidget {
 PDFViewerFromUrl({Key? key, required this.url}) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: const PDF().fromUrl(
        url,
        placeholder: (double progress) => Center(child: Text('$progress %')),
        errorWidget: (dynamic error) => Center(child: Text(error.toString())),
      ),
    );
  }
}

class PDFViewerCachedFromUrl extends StatelessWidget {
  const PDFViewerCachedFromUrl({Key? key, required this.url}) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cached PDF From Url'),
      ),
      body: const PDF().cachedFromUrl(
        url,
        placeholder: (double progress) => Center(child: Text('$progress %')),
        errorWidget: (dynamic error) => Center(child: Text(error.toString())),
      ),
    );
  }
}