

import 'dart:ui';
//import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes/Screen/reader.dart';
import 'package:notes/Style/app_style.dart';
import 'package:notes/Widget/note_card.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'edit_note.dart';

void delete(id){
  FirebaseFirestore.instance.collection("p-note").doc(id).delete();
  Fluttertoast.showToast(msg: "Deleted Successfully");
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.maincolor,
      appBar: AppBar(
        elevation: 0.5,
        title: Text("Notes"),
        centerTitle: true,
        backgroundColor: Colors.orange[700],
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your recent Notes",
              style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
            SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance.collection("p-note").snapshots(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasData) {
                    return GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      children: snapshot.data!.docs
                          .map<Widget>((note) => noteCard(() {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ReaderScreen(note)));
                              }, note))
                          .toList(),

                    );
                  }
                  return Text(
                    "There is no Notes",
                    style: GoogleFonts.nunito(color: Colors.white),
                  );

                },
              ),
            )

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Edit_Screen()));
        },
        label: Text("Add Note"),
        icon: Icon(Icons.add),
      ),
    );
  }
}
