import 'package:flutter/material.dart';

import 'main.dart';



class network extends StatefulWidget {
  const network({Key? key}) : super(key: key);

  @override
  State<network> createState() => _networkState();
}

class _networkState extends State<network> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white
      ,body: Column(children: [
        SizedBox(height: 88,),
      Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/g.png'), fit: BoxFit.cover)
          ,), width: 188,
          height: 188,),
      ),
      Text("Couldn't Connect",style:
      TextStyle(color: Colors.blue.shade900,fontSize: 19,fontWeight: FontWeight.w500),),
      SizedBox(height: 88,),

      Center(
        child: MaterialButton(height: 55,minWidth: 222,
           color:Colors.blue.shade900,shape: StadiumBorder() ,
          onPressed: (){  Navigator.pushReplacement(
            context, MaterialPageRoute(builder:
              (context) => home()));},child: Text('Reload',style:
        TextStyle(color: Colors.white),),),
      )
    ],),);
  }
}
