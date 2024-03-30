import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:crime_track_master/police/widgetsPolice/titlebar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'archvFiles.dart';
import 'addArchv.dart'; // Import AddArchiveFilesPage



class ArchiveFilesPage extends StatefulWidget {
  @override
  _ArchiveFilesPageState createState() => _ArchiveFilesPageState();
}

class _ArchiveFilesPageState extends State<ArchiveFilesPage> {
  List<String>  archiveFiles = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTitleBar(title: 'Case Details'), // Custom title bar
            SizedBox(height: 10),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('addarchive').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final firs = snapshot.data?.docs.reversed.toList();
                    List<Widget> staffwidgets = [];
                    for (var addarchive in firs!) {
                      staffwidgets.add(
                        Card(
                          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Case Type: ${addarchive['Case Type']}'),
                                Text('Incident Details:${addarchive['Incident Details']}'),
                                Text('Location:${addarchive['Location']}'),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            String caseType = addarchive['Case Type'];
                                            String incidentdetails = addarchive['Incident Details'];
                                            String Location = addarchive['Location'];

                                            return Theme(
                                              data: ThemeData(
                                                  brightness: Brightness.light,
                                                  inputDecorationTheme: InputDecorationTheme(
                                                    focusedBorder: UnderlineInputBorder(
                                                      borderSide: BorderSide(color:Color(0xFF7B0305), // Set focused border color to red
                                                      ),
                                                    ),
                                                  )
                                              ),
                                              child: AlertDialog(
                                                title: Text('Edit Case'),
                                                content: SingleChildScrollView(
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      TextFormField(
                                                        cursorColor: Color(0xFF7B0305),
                                                        initialValue: caseType,
                                                        decoration: InputDecoration(labelText: 'Case Type'),
                                                        onChanged: (value) {
                                                          caseType = value;
                                                        },
                                                      ),
                                                      TextFormField(
                                                        cursorColor: Color(0xFF7B0305),
                                                        initialValue: incidentdetails,
                                                        decoration: InputDecoration(labelText: 'Incident Details'),
                                                        onChanged: (value) {
                                                          incidentdetails = value;
                                                        },
                                                      ),
                                                      TextFormField(
                                                        cursorColor: Color(0xFF7B0305),
                                                        initialValue: Location,
                                                        decoration: InputDecoration(labelText: 'Location'),
                                                        onChanged: (value) {
                                                          Location = value;
                                                        },
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context); // Close the dialog
                                                    },
                                                    style: ButtonStyle(
                                                      foregroundColor: MaterialStateProperty.all<Color>(const Color(0xFF7B0305)), // Change color here
                                                      backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                                    ),
                                                    child: Text(
                                                        'Cancel'
                                                    ),
                                                  ),
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      // Update the case details in the Firestore database
                                                      FirebaseFirestore.instance.collection('addarchive').doc(addarchive.id).update({
                                                        'Case Type': caseType,

                                                        'Incident Details': incidentdetails,
                                                        'Location': Location,

                                                      });
                                                      Navigator.pop(context); // Close the dialog
                                                    },
                                                    style: ButtonStyle(
                                                      backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF7B0305)), // Change color here
                                                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                                    ),
                                                    child: Text(
                                                        'Save Changes'
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      icon: Icon(Icons.edit),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                            title: Text('Delete Case'),
                                            content: Text('Are you sure you want to delete this case?'),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context); // Close the dialog
                                                },
                                                style: ButtonStyle(
                                                  foregroundColor: MaterialStateProperty.all<Color>(const Color(0xFF7B0305)), // Change color here
                                                  backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                                ),
                                                child: Text('Cancel'),
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  // Delete the case from Firestore
                                                  FirebaseFirestore.instance.collection('addarchive').doc(addarchive.id).delete();
                                                  Navigator.pop(context); // Close the dialog
                                                },
                                                style: ButtonStyle(
                                                  backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF7B0305)), // Change color here
                                                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                                ),
                                                child: Text('Delete'),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                      icon: Icon(Icons.delete),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                      );
                    }
                    return Expanded(
                      child: ListView(
                        children: staffwidgets,
                      ),
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddArchiveFilesPage(
                        onSubmit: (details) {
                          setState(() {
                            archiveFiles.add(details); // Add submitted case details to the list
                          });
                        },
                      ),
                    ),
                  );

                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF7B0305)),
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                ),
                child: Text(
                  'Create new Case',
                  style: GoogleFonts.merriweather(
                    textStyle: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
