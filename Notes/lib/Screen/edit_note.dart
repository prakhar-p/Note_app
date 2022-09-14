

import 'dart:math';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../Style/app_style.dart';

class Edit_Screen extends StatefulWidget {
  const Edit_Screen({Key? key}) : super(key: key);

  @override
  State<Edit_Screen> createState() => _Edit_ScreenState();
}

class _Edit_ScreenState extends State<Edit_Screen> {
  int color_id=Random().nextInt(AppStyle.cardColor.length);
  TextEditingController _titlecontroller=TextEditingController();
  TextEditingController _maincontroller=TextEditingController();
  String date=DateTime.now().toString();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppStyle.cardColor[color_id],
      appBar: AppBar(
        backgroundColor: AppStyle.cardColor[color_id],
        elevation: 0.5,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("Add a new Note",style: TextStyle(color: Colors.black),),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titlecontroller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Note Title'
              ),
              style: AppStyle.title,
            ),
            SizedBox(height: 8.0,),
            Text(date,style: AppStyle.datetitle,),
            SizedBox(height: 30.0,),

            TextField(
              controller: _maincontroller,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Note Content'
              ),
              style: AppStyle.content,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppStyle.accentColor,
        onPressed: () async {
            FirebaseFirestore.instance.collection("p-note").add({
              "title":_titlecontroller.text,
              "creation_date":date,
              "content":_maincontroller.text,
              "color_id":color_id
            }).then((value){
              print(value.id);
              Navigator.pop(context);
            }).catchError((error)=>print("Failed to add new note Please Try Again"));
        },
        child: Icon(Icons.save),
      ),
    );
  }
}
