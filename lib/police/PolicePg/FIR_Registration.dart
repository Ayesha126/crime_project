import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../widgetsPolice/titlebar.dart';
import 'FIR_form.dart';


class FIRRegistrationPage extends StatefulWidget {
  @override
  _FIRRegistrationPageState createState() => _FIRRegistrationPageState();
}

class _FIRRegistrationPageState extends State<FIRRegistrationPage> {
  List<String> _firDetails = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomTitleBar(title: 'FIR Details'), // Custom title bar
            SizedBox(height: 10),
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('fir').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final firs = snapshot.data?.docs.reversed.toList();
                  List<Widget> firwidgets = [];
                  for (var fir in firs!) {
                    firwidgets.add(
                      Card(
                        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('FIR ID: ${fir['FIR ID']}'),
                              Text('Victim Name: ${fir['Victim Name']}'),
                              Text('Victim Address: ${fir['Victim Address']}'),
                              Text('Complainant Name: ${fir['Complainant Name']}'),
                              Text('Complainant Contact: ${fir['Complainant Contact']}'),
                              Text('Relationship to Victim: ${fir['Relationship to Victim']}'),
                              Text('Incident Date: ${fir['Incident Date']}'),
                              Text('Incident Type: ${fir['Incident Type']}'),
                              Text('Incident Details: ${fir['Incident Details']}'),
                              Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              String firid = fir['FIR ID'];
                                              String victimName = fir['Victim Name'];
                                              String victimAddress = fir['Victim Address'];
                                              String complainantName = fir['Complainant Name'];
                                              String complainantContact = fir['Complainant Contact'];
                                              String relationshipToVictim = fir['Relationship to Victim'];
                                              String incidentDate = fir['Incident Date'];
                                              String incidentType = fir['Incident Type'];
                                              String incidentDetails = fir['Incident Details'];
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
                                                  title: Text('Edit FIR'),
                                                  content: SingleChildScrollView(
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                                      children: [
                                                        TextFormField(
                                                        cursorColor: Color(0xFF7B0305),
                                                      initialValue: firid,
                                                          onChanged: (value) {
                                                            firid = value;
                                                          },
                                                          decoration: InputDecoration(labelText: 'FIR Id'),
                                                        ),
                                                        TextFormField(
                                                            cursorColor: Color(0xFF7B0305),
                                                            initialValue: victimName,
                                                          onChanged: (value) {
                                                            victimName = value;
                                                          },
                                                          decoration: InputDecoration(labelText: 'Victim Name'),
                                                        ),
                                                        TextFormField(
                                                            cursorColor: Color(0xFF7B0305),
                                                            initialValue: victimAddress,
                                                          onChanged: (value) {
                                                            victimAddress = value;
                                                          },
                                                          decoration: InputDecoration(labelText: 'Victim Address'),
                                                        ),
                                                        TextFormField(
                                                          initialValue: complainantName,
                                                          onChanged: (value) {
                                                            complainantName = value;
                                                          },
                                                          decoration: InputDecoration(labelText: 'Complainant Name'),
                                                        ),
                                                        TextFormField(
                                                            cursorColor: Color(0xFF7B0305),
                                                            initialValue: complainantContact,
                                                          onChanged: (value) {
                                                            complainantContact = value;
                                                          },
                                                          decoration: InputDecoration(labelText: 'Complainant Contact'),
                                                        ),
                                                        TextFormField(
                                                            cursorColor: Color(0xFF7B0305),
                                                            initialValue: relationshipToVictim,
                                                          onChanged: (value) {
                                                            relationshipToVictim = value;
                                                          },
                                                          decoration: InputDecoration(labelText: 'Relationship to Victim'),
                                                        ),
                                                        TextFormField(
                                                            cursorColor: Color(0xFF7B0305),
                                                            initialValue: incidentDate,
                                                          onChanged: (value) {
                                                            incidentDate = value;
                                                          },
                                                          decoration: InputDecoration(labelText: 'Incident Date'),
                                                        ),
                                                        TextFormField(
                                                            cursorColor: Color(0xFF7B0305),
                                                            initialValue: incidentType,
                                                          onChanged: (value) {
                                                            incidentType = value;
                                                          },
                                                          decoration: InputDecoration(labelText: 'Incident Type'),
                                                        ),
                                                        TextFormField(
                                                          cursorColor: Color(0xFF7B0305),
                                                          initialValue: incidentDetails,
                                                          onChanged: (value) {
                                                            incidentDetails = value;
                                                          },
                                                          decoration: InputDecoration(labelText: 'Incident Details'),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      style: ButtonStyle(
                                                        foregroundColor: MaterialStateProperty.all<Color>(const Color(0xFF7B0305)), // Change color here
                                                        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                                      ),
                                                      child: Text('Cancel'),
                                                    ),
                                                    ElevatedButton(
                                                      onPressed: () {
                                                        FirebaseFirestore.instance.collection('fir').doc(fir.id).update({
                                                          'FIR ID': firid,
                                                          'Victim Name': victimName,
                                                          'Victim Address': victimAddress,
                                                          'Complainant Name': complainantName,
                                                          'Complainant Contact': complainantContact,
                                                          'Relationship to Victim': relationshipToVictim,
                                                          'Incident Date': incidentDate,
                                                          'Incident Type': incidentType,
                                                          'Incident Details': incidentDetails,
                                                        });
                                                        Navigator.pop(context);
                                                      },
                                                      style: ButtonStyle(
                                                        backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF7B0305)), // Change color here
                                                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                                      ),
                                                      child: Text('Save Changes'),
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
                                            builder: (context) {
                                              return AlertDialog(
                                                title: Text('Delete FIR'),
                                                content: Text('Are you sure you want to delete this FIR?'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    style: ButtonStyle(
                                                      foregroundColor: MaterialStateProperty.all<Color>(const Color(0xFF7B0305)), // Change color here
                                                      backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                                    ),
                                                    child: Text('Cancel'),
                                                  ),
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      FirebaseFirestore.instance.collection('fir').doc(fir.id).delete();
                                                      Navigator.pop(context);
                                                    },
                                                    style: ButtonStyle(
                                                      backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF7B0305)), // Change color here
                                                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                                    ),
                                                    child: Text('Delete'),
                                                  ),
                                                ],
                                              );
                                            },
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
                      children: firwidgets,
                    ),
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FIRFormPage(
                        onSubmit: (details) {
                          setState(() {
                            _firDetails.add(details);
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
                  'Create new FIR',
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
