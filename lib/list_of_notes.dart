import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_taking_app/addNewNote.dart';

class NotesList extends StatelessWidget {
  final ref = FirebaseFirestore.instance.collection('Notes');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddNote()));
                },
                icon: Icon(Icons.add_circle_outline))
          ],
          backgroundColor: Colors.yellow.shade200,
          title: Text('Notes'),
          centerTitle: true,
          foregroundColor: Colors.black,
        ),
        body: StreamBuilder(
            stream: ref.snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              return GridView.builder(
                  itemCount: snapshot.hasData ? snapshot.data?.docs.length : 0,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1),
                  itemBuilder: (_, index) {
                    return Container(
                      margin: EdgeInsets.only(left: 25, right: 25, top: 25),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.yellow.shade600),
                      boxShadow: [BoxShadow(color: Colors.yellow.shade100, offset: Offset(4,8))]),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Text(snapshot.data?.docs[index].get('Title'),
                              style: TextStyle(fontSize: 35)
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(snapshot.data?.docs[index].get('Body'),
                            style: TextStyle(fontSize: 18),

                          ),
                        ],
                        ),
                      ),
                    );
                  });
            })
    );
  }
}
