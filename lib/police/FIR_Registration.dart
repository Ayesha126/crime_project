import 'package:crime_track_master/police/widgetsPolice/titlebar.dart';
import 'package:flutter/material.dart';
import 'PolicePg/FIR_form.dart';

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
            ElevatedButton(
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
                backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF7B0305)), // Change color here
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              child: Text('Add FIR Details'),
            ),
            SizedBox(height: 20),
            Text(
              'FIR Details:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: _firDetails.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_firDetails[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

