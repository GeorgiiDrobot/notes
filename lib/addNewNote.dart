import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddNote extends StatelessWidget {
  TextEditingController title = TextEditingController();
  TextEditingController text_field = TextEditingController();

  CollectionReference reference =
      FirebaseFirestore.instance.collection('Notes');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade200,
        actions: [
          // ignore: deprecated_member_use
          FlatButton(
              onPressed: () {
                reference.add({
                  'Title': title.text,
                  'Body': text_field.text
                }).whenComplete(() => Navigator.pop(context));
              },

              child: const Text('Add',
                  style: TextStyle(color: Colors.black, fontSize: 20))),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                    border:
                        Border.all(color: Colors.black54)),
                child: TextField(
                  controller: title,
                  decoration: InputDecoration(
                      hintText: 'Title', contentPadding: EdgeInsets.all(20)),
                  cursorColor: Colors.black54,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Colors.black54)),
                  child: TextField(
                    controller: text_field,
                    maxLines: null,
                    expands: true,
                    decoration: InputDecoration(
                        hintText: 'Text Field',
                        contentPadding: EdgeInsets.all(20)),
                    cursorColor: Colors.black54,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
