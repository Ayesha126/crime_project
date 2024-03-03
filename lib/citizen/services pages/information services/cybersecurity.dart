import 'package:flutter/material.dart';

class CyberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF90CAF9),
          title: Text('Cyber Security Information',
            style:TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFFF8F8F8)
            ),
          ),
          centerTitle: true,
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
        body: Padding(
        padding: const EdgeInsets.all(4.0),
    child: SingleChildScrollView(
    child: Text(
      '''  Cyber Security Norms and Best Practices
      1. Always use genuine software.
      2. Install the latest updates /patches for the operating sysytem,Antivirus and Application software.
      3. Limit User Privileges on the Computer. Always access Internet as a Standard user and not as Administrator.
      4. Check and verify email sender IDs and web links before opening file attachments and clicking on links in emails and webpages.
      5. Phishing emails and SMS are used to get user credentials like username,password cerdit card and PIN numbers etc. Be wary of them.
      6. Regularly check the last logging details of email accounts.
      7. Use strong passwords and different passwords for diffrenet online services.
      8. Regularly take backup of document files to avoid loss of files in case of emergencies like malware infections, hard disk crash,corrupted applications and other unforeseen incidents.
      
          Tips for Safe Online Chatting
      1. Position the computer in your main living space and make sure the monitor faces OUTWARD into the room so there is no secrecy.THis is the single MOST valuable thing you can do for your childs safety online.
      2. Work as a team to set your boundaries. Discuss with your child exactly what is OK and what is not OK regrading what kind of web sites are appropriate for thwm to visit, which chat rooms to visit and what kinds of things to talk about there.Set logical consequence for when your child disregards your rulles(like grounded from the Internet for 1 week), but do NOT threaten to ban the Internet forever.
          ''',
      style: TextStyle(fontSize: 13),
    ),
    ),
        ),
    );
  }
}