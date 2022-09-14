import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notes/Style/app_style.dart';


class ReaderScreen extends StatefulWidget {
  ReaderScreen(this.doc,{Key? key}) : super(key: key);
  QueryDocumentSnapshot doc;
  @override
  State<ReaderScreen> createState() => _ReaderScreenState();
}

class _ReaderScreenState extends State<ReaderScreen> {
  @override
  Widget build(BuildContext context) {
    int color_id=widget.doc['color_id'];
    return Scaffold(
      backgroundColor: AppStyle.cardColor[color_id],
      appBar: AppBar(
        title:Text('Note'),
        centerTitle: true,
        backgroundColor: AppStyle.cardColor[color_id],
        elevation: 0.5,

      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.doc["title"],
              style: AppStyle.title,
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              widget.doc["creation_date"],
              style: AppStyle.datetitle,
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              widget.doc["content"],
              style: AppStyle.content,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppStyle.accentColor,
        onPressed: () async {
          FirebaseFirestore.instance.collection("p-note").doc().delete().then((value){
            //print(value.id);
            Navigator.pop(context);
          }).catchError((error)=>print("Failed to Remove note Please Try Again"));
        },
        child: Icon(Icons.delete),
      ),
    );
  }
}
