import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crime_track_master/police/PolicePg/wantedAdd.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WantedDisplayPage extends StatefulWidget {
  @override
  _WantedDisplayPageState createState() => _WantedDisplayPageState();
}

class _WantedDisplayPageState extends State<WantedDisplayPage> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        textTheme: GoogleFonts.merriweatherTextTheme(), // Apply Google Font to the text theme
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Wanted List"),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('wantedPersons').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            var documents = snapshot.data!.docs;
            return ListView.builder(
              itemCount: documents.length,
              itemBuilder: (context, index) {
                var individual = documents[index];
                var photoUrl = individual['image']; // Assuming this is a base64 string
                return ListTile(
                  leading: photoUrl != null
                      ? CircleAvatar(
                    // This is a basic example, consider using a better decoding method for performance
                    backgroundImage: MemoryImage(Base64Decoder().convert(photoUrl)),
                  )
                      : CircleAvatar(child: Icon(Icons.person)),
                  title: Text(individual['name'] ?? 'No Name'),
                  subtitle: Text(individual['description'] ?? 'No Description'),
                );
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => WantedInsertPage()),
            );
          },
          backgroundColor: Color(0xFF7B0305),
          child: Icon(Icons.add, color: Colors.white,),
        ),
      ),
    );
  }
}
