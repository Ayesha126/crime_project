import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final List<Map<String, String>> _contacts = [
    {'name': 'Police Emergency Helpline', 'number': '112'},
    {'name': 'Police Chief Control Room', 'number': '02612241303'},
    {'name': 'Crime Stopper', 'number': '1090'},
    {'name': 'Women Helpline', 'number': '1091'},
    {'name': 'Child Helpline', 'number': '1098'},
    {'name': 'Railway Alert', 'number': '1072'},
    {'name': 'Cyber Crime Helpline', 'number': '155620'},
    {'name': 'Anti Ragging Helpline', 'number': '18001805522'},
    {'name': 'Disaster Management Helpline', 'number': '1078'},
    {'name': 'Consumer Protection Helpline', 'number': '18004251550'},
    {'name': 'Transgender Helpline', 'number': '18004252147'},
    {'name': 'Health Helpline', 'number': '1056'},
    {'name': 'Aadhar Customer Service Helpline', 'number': '1947'},
  ];

  void _callNumber(String number) async {
    await FlutterPhoneDirectCaller.callNumber(number);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF90CAF9),
        title:Text('Contact Page',
        style:TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFFF8F8F8)
        ),
        ),
        centerTitle: true,
      ),

      body: Column(
          children: [
      Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          hintText: 'Search contacts',
          prefixIcon: Icon(Icons.search),
        ),
      ),
    ),
            Expanded(
              child:ListView.builder(
                itemCount: _contacts.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                          title: Text(_contacts[index]['name']!),
                          onTap: () {
                            _callNumber(_contacts[index]['number']!);
                          },
                        trailing: Icon(Icons.star_border),
                      ),
                      Divider(),
                    ],
                  );
                },
              ),
            ),
          ],
      ),
    );
  }
}