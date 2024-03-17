import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:crime_track_master/police/PolicePg/staffDetails.dart';
import 'package:crime_track_master/police/widgetsPolice/titlebar.dart';
import 'package:google_fonts/google_fonts.dart';

class StaffDisplayPage extends StatefulWidget {
  final List<String> staffDetails;

  StaffDisplayPage({required this.staffDetails});

  @override
  _StaffDisplayPageState createState() => _StaffDisplayPageState();
}

class _StaffDisplayPageState extends State<StaffDisplayPage> {
  @override
  Widget build(BuildContext context) {
    // Transparent color

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomTitleBar(title: 'Staff Details'), // Custom title bar
            SizedBox(height: 10),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('staffdetails').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final staffsdetail = snapshot.data?.docs.reversed.toList();
                    List<Widget> staffwidgets = [];
                    for (var staffdetails in staffsdetail!) {
                      staffwidgets.add(
                        Card(
                          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Staff Department:  ${staffdetails['Staff Department']}'),
                                Text('Staff Email:  ${staffdetails['Staff Email']}'),
                                Text('Staff Name:  ${staffdetails['Staff Name']}'),
                                Text('Staff Phone Number:  ${staffdetails['Staff Phone Number']}'),
                                Text('Staff Position:  ${staffdetails['Staff Position']}'),
                                Text('Staff ID:  ${staffdetails['Staff ID']}'),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(onPressed: (){
                                      showDialog(context: context,
                                          builder:(context){
                                        String StaffDepartment=staffdetails['Staff Department'];
                                        String StaffEmail= staffdetails['Staff Email'];
                                        String StaffName= staffdetails['Staff Name'];
                                        String StaffPhoneNumber=staffdetails['Staff Phone Number'];
                                        String Position=staffdetails['Staff Position'];
                                        String StaffId=staffdetails['Staff ID'];
                                        return Theme(data: ThemeData(
                                          brightness: Brightness.light,
                                          inputDecorationTheme: InputDecorationTheme(
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(color: Color(0xFF7B0305),),
                                            )
                                          ),
                                        ),
                                            child: AlertDialog(
                                              title: Text('Edit Staff Details'),
                                              content: SingleChildScrollView(
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    TextFormField(
                                                      cursorColor: Color(0xFF7B0305),
                                                      initialValue: StaffDepartment,
                                                      decoration: InputDecoration(labelText: 'Staff Department'),
                                                      onChanged: (value){
                                                        StaffDepartment=value;
                                                      },
                                                    ),
                                                    TextFormField(
                                                      cursorColor: Color(0xFF7B0305),
                                                      initialValue: StaffEmail,
                                                      decoration: InputDecoration(labelText: 'Staff Email'),
                                                      onChanged: (value){
                                                        StaffEmail=value;
                                                      },
                                                    ),
                                                    TextFormField(
                                                      cursorColor: Color(0xFF7B0305),
                                                      initialValue: StaffName,
                                                      decoration: InputDecoration(labelText: 'Staff Name'),
                                                      onChanged: (value){
                                                        StaffName =value;
                                                      },
                                                    ),
                                                    TextFormField(
                                                      cursorColor: Color(0xFF7B0305),
                                                      initialValue: StaffPhoneNumber,
                                                      decoration: InputDecoration(labelText: 'Staff Phone Number'),
                                                      onChanged: (value){
                                                        StaffName =value;
                                                      },
                                                    ),
                                                    TextFormField(
                                                      cursorColor: Color(0xFF7B0305),
                                                      initialValue: Position,
                                                      decoration: InputDecoration(labelText: 'Staff Position'),
                                                      onChanged: (value){
                                                        StaffName =value;
                                                      },
                                                    ),
                                                    TextFormField(
                                                      cursorColor: Color(0xFF7B0305),
                                                      initialValue: StaffId,
                                                      decoration: InputDecoration(labelText: 'Staff ID'),
                                                      onChanged: (value){
                                                        StaffName =value;
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              actions: [
                                                TextButton(onPressed: (){
                                                  Navigator.pop(context);
                                                },
                                                  style: ButtonStyle(
                                                    foregroundColor: MaterialStateProperty.all<Color>(const Color(0xFF7B0305)),
                                                    backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                                  ),
                                                  child: Text('Cancel'),
                                                ),
                                                ElevatedButton(onPressed: (){
                                                  FirebaseFirestore.instance.collection('staffdetails').doc(staffdetails.id).update({
                                                    'Staff Department': StaffDepartment,
                                                    'Staff Email': StaffEmail,
                                                    'Staff Name': StaffName,
                                                    'Staff Phone Number':StaffPhoneNumber,
                                                    'Staff Position': Position,
                                                    'Staff ID':StaffId,
                                                  });
                                                  Navigator.pop(context);
                                                },
                                                  style: ButtonStyle(
                                                    backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF7B0305)),
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
                                    IconButton(onPressed: (){
                                      showDialog(context: context,
                                          builder: (context) => AlertDialog(
                                            title: Text('Delete Case'),
                                            content: Text('Are you sure you want to delete this case?'),
                                            actions: [
                                              TextButton(onPressed: (){
                                                Navigator.pop(context);
                                              },
                                                  style: ButtonStyle(
                                                    foregroundColor: MaterialStateProperty.all<Color>(const Color(0xFF7B0305)),
                                                    backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                                  ),
                                                  child: Text('Cancel'),
                                              ),
                                              ElevatedButton(onPressed: (){
                                                FirebaseFirestore.instance.collection('staffdetails').doc(staffdetails.id).delete();
                                                Navigator.pop(context);
                                              },
                                                  style: ButtonStyle(
                                                    backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF7B0305)),
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
                                )
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
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StaffDetailsPage(
                        onSubmit: (details) {
                          setState(() {
                            // Update the parent's state with the new details
                            widget.staffDetails.add(details);
                          });
                        },
                      ),
                    ),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color(0xFF7B0305)), // Change color here
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                ),
                child: Text(
                  'Add new Staff ',
                  style: GoogleFonts.merriweather( // Example of changing font to Open Sans
                    textStyle: const TextStyle(
                      fontSize: 18,
                      color: Colors.white, // Background color of the title bar
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
