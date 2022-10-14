import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController id = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController num = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Sweet Home")),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Ltuc_student')
            .orderBy('Student_id')
            .snapshots(),
        builder: (context, snapshot) {
          final docs = snapshot.data!.docs;
          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) => Column(children: [
              Text(
                "Student ID: " +
                    docs[index]['Student_id'].toString() +
                    "\n" +
                    "Student Name: " +
                    docs[index]['Student_name'] +
                    "\n"
                        "Number of Subject: " +
                    docs[index]['Subject#'].toString(),
                style: TextStyle(fontSize: 25),
              ),
              Divider(
                color: Colors.black,
                height: 30,
              )
            ]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  actions: [
                    TextField(
                      controller: id,
                      decoration: InputDecoration(
                          hintText: 'Enter Student ID',
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade600)),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade600))),
                    ),
                    TextField(
                      controller: name,
                      decoration: InputDecoration(
                          hintText: 'Enter Student Name',
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade600)),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade600))),
                    ),
                    TextField(
                      controller: num,
                      decoration: InputDecoration(
                          hintText: 'Enter Subject Number',
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade600)),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade600))),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        FirebaseFirestore.instance
                            .collection('Ltuc_student')
                            .add({
                          'Student_id': id.text,
                          'Student_name': name.text,
                          'Subject#': num.text
                        });
                      },
                      icon: Icon(Icons.add),
                      label: Text("Add"),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        FirebaseFirestore.instance
                            .collection('Ltuc_student')
                            .doc('4BPLQKqJBd0ZYDSBNL80')
                            .delete();
                      },
                      icon: Icon(Icons.delete),
                      label: Text("Delete"),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        FirebaseFirestore.instance
                            .collection('Ltuc_student')
                            .doc('xG9nt37fKg0rFtvrvksi')
                            .update({
                          'Student_id': id.text,
                          'Student_name': name.text,
                          'Subject#': num.text
                        });
                      },
                      icon: Icon(Icons.update),
                      label: Text("Update"),
                    ),
                  ],
                );
              });
        },
        child: Icon(Icons.edit),
      ),
    );
  }
}
