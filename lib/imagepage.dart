
import 'package:flutter/material.dart';

import 'detail.dart';

class imgpage extends StatefulWidget {
 // imgpage({Key? key}) : super(key: key);



  @override
  State<imgpage> createState() => _imgpageState();
}

class _imgpageState extends State<imgpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(
      padding: EdgeInsets.all(22),
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.shade900
        ,image:DecorationImage(image:NetworkImage(
   imager
    ),fit: BoxFit.cover)
  ),),);
  }
}
