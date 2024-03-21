import 'package:flutter/material.dart';

class CyberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF90CAF9),
        title: Text(
          'Cyber Security Information',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFFF8F8F8),
          ),
        ),
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Text(
                'Cyber Security Norms and Best Practices',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue, // Highlighted color
                ),
              ),
              SizedBox(height: 5),
              Text(
                '''
1. Always use genuine software.
2. Install the latest updates/patches for the operating system, Antivirus, and Application software.
3. Limit User Privileges on the Computer. Always access Internet as a Standard user and not as Administrator.
4. Check and verify email sender IDs and web links before opening file attachments and clicking on links in emails and webpages.
5. Phishing emails and SMS are used to get user credentials like username, password, credit card, and PIN numbers etc. Be wary of them.
6. Regularly check the last logging details of email accounts.
7. Use strong passwords and different passwords for different online services.
8. Regularly take backup of document files to avoid loss of files in case of emergencies like malware infections, hard disk crash, corrupted applications, and other unforeseen incidents.''',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'Tips for Safe Online Chatting',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue, // Highlighted color
                ),
              ),
              SizedBox(height: 5),
              Text(
                '''
1. Position the computer in your main living space and make sure the monitor faces OUTWARD into the room so there is no secrecy. This is the single MOST valuable thing you can do for your child's safety online.
2. Work as a team to set your boundaries. Discuss with your child exactly what is OK and what is not OK regarding what kind of websites are appropriate for them to visit, which chat rooms to visit, and what kinds of things to talk about there. Set logical consequences for when your child disregards your rules (like grounded from the Internet for 1 week), but do NOT threaten to ban the Internet forever.
3. Stress to your child that they need to tell you if they get any weird or upsetting messages while chatting, and that you will not be angry with them nor will you ban the internet as a result. Make it clear to the child that you understand that the child cannot control what other people say to him or her and that they are not to be blamed if this happens.
4. Set strict time limits for internet chat use and enforce them. Internet addiction is a real thing.
5. Make it clear to your child that people in chat rooms are ALWAYS strangers, no matter how often they chat to them, and no matter how well they think they know them, and that while they may be good or bad people, they are still strangers. Your child should therefore not always believe everything people say in chat rooms or online.
6. Make sure your child understands that they are never to tell a person online their real name, their school, their phone number, or where they live.
7. Do not permit your child to be left alone in cyberspace for long periods of time - this is when they are most vulnerable. Make sure that their chat time occurs when YOU are around in the house so that you can check in on them regularly.
8. Be sure to stress to your child that they are to behave politely and respectfully at all times while chatting online with strangers or sending email to friends.
9. Don't panic! No one can harm your child through the Internet as long as your child follows your rules.
10. Take an active interest in your child's activity online. Do NOT use the Internet as a babysitter. Learn to surf the Web and chat online yourself so you understand what it is that your child is doing. If you don't know how to chat online, ask your child to teach you!''',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
