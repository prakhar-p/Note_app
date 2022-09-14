//import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notes/Style/app_style.dart';

Widget noteCard(Function()? onTap, QueryDocumentSnapshot doc) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(5.0),

      decoration: BoxDecoration(
        color: AppStyle.cardColor[doc['color_id']],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            doc["title"],
            style: AppStyle.title,
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            doc["creation_date"],
            style: AppStyle.datetitle,
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            doc["content"],
            style: AppStyle.content,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    ),
  );
}
