import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'wantedAdd.dart'; // Import the WantedInsertPage
import '../widgetsPolice/titlebar.dart';
import 'dart:io'; // Import File class

class WantedDisplayPage extends StatefulWidget {
  @override
  _WantedDisplayPageState createState() => _WantedDisplayPageState();
}

class _WantedDisplayPageState extends State<WantedDisplayPage> {
  List<Map<String, String>> wantedIndividuals = [];

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        textTheme: GoogleFonts.merriweatherTextTheme(), // Apply Google Font to the text theme
      ),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTitleBar(title: 'Wanted List'),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Display list of wanted individuals
                    for (var individual in wantedIndividuals)
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Column(
                          children: [
                            Divider(), // Add a divider above the content
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Display image
                                if (individual['photoUrl'] != null)
                                  Container(
                                    margin: EdgeInsets.only(right: 16.0),
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      image: DecorationImage(
                                        image: FileImage(File(individual['photoUrl']!)),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                // Display name and description
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Name: ${individual['name']}',
                                        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 8.0),
                                      Text(
                                        'Description: ${individual['description']}',
                                        style: TextStyle(fontSize: 14.0),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Divider(), // Add a divider below the content
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => WantedInsertPage()),
            );

            if (result != null) {
              setState(() {
                wantedIndividuals.add(result);
              });
            }
          },
          backgroundColor: Color(0xFF7B0305),

          child: Icon(Icons.add,color: Colors.white,),
        ),
      ),
    );
  }
}
