import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:crime_track_master/police/widgetsPolice/titlebar.dart';
import 'caseRegister.dart';
class CaseDisplayPage extends StatefulWidget {
  @override
  _CaseDisplayPageState createState() => _CaseDisplayPageState();
}
class _CaseDisplayPageState extends State<CaseDisplayPage> {
  List<String> _caseDetails = []; // List to hold case details

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
              stream: FirebaseFirestore.instance.collection('casereg').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final firs = snapshot.data?.docs.reversed.toList();
                  List<Widget> staffwidgets = [];
                  for (var casereg in firs!) {
                    staffwidgets.add(
                      Card(
                        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Case Type: ${casereg['Case Type']}'),
                              Text('Date and Time:${casereg['Date and Time']}'),
                              Text('Evidence:${casereg['Evidence']}'),
                              Text('Incident Details:${casereg['Incident Details']}'),
                              Text('Location:${casereg['Location']}'),
                              Text('Witness Information:${casereg['Witness Information']}'),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          String caseType = casereg['Case Type'];
                                          String dateTime = casereg['Date and Time'];
                                          String evidence = casereg['Evidence'];
                                          String incidentDetails = casereg['Incident Details'];
                                          String location = casereg['Location'];
                                          String witnessInfo = casereg['Witness Information'];
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
                                                      initialValue: dateTime,
                                                      decoration: InputDecoration(labelText: 'Date and Time'),
                                                      onChanged: (value) {
                                                        dateTime = value;
                                                      },
                                                    ),
                                                    TextFormField(
                                                      cursorColor: Color(0xFF7B0305),
                                                      initialValue: evidence,
                                                      decoration: InputDecoration(labelText: 'Evidence'),
                                                      onChanged: (value) {
                                                        evidence = value;
                                                      },
                                                    ),
                                                    TextFormField(
                                                      cursorColor: Color(0xFF7B0305),
                                                      initialValue: incidentDetails,
                                                      decoration: InputDecoration(labelText: 'Incident Details'),
                                                      onChanged: (value) {
                                                        incidentDetails = value;
                                                      },
                                                    ),
                                                    TextFormField(
                                                      cursorColor: Color(0xFF7B0305),
                                                      initialValue: location,
                                                      decoration: InputDecoration(labelText: 'Location'),
                                                      onChanged: (value) {
                                                        location = value;
                                                      },
                                                    ),
                                                    TextFormField(
                                                      cursorColor: Color(0xFF7B0305),
                                                      initialValue: witnessInfo,
                                                      decoration: InputDecoration(labelText: 'Witness Information'),
                                                      onChanged: (value) {
                                                        witnessInfo = value;
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
                                                    FirebaseFirestore.instance.collection('casereg').doc(casereg.id).update({
                                                      'Case Type': caseType,
                                                      'Date and Time': dateTime,
                                                      'Evidence': evidence,
                                                      'Incident Details': incidentDetails,
                                                      'Location': location,
                                                      'Witness Information': witnessInfo,
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
                                                FirebaseFirestore.instance.collection('casereg').doc(casereg.id).delete();
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
                      builder: (context) => CaseRegistrationPage( // Navigate to case form page
                        onSubmit: (details) {
                          setState(() {
                            _caseDetails.add(details); // Add submitted case details to the list
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
