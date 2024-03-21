import 'package:flutter/material.dart';

class InternetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF90CAF9),
        title: Text(
          'Internet Tips',
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

              Text(
                'Over confidence is not a good thing.',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue, // Highlighted color
                ),
              ),
              SizedBox(height: 10),
              Text(
                '''
You may be a person who is enthusiastic about the internet and not keen on internet awareness of dangers in the cyber world and who takes precautions to protect privacy and sensitive data. However, do you know anything in detail about the new friends you made in the cyber world, anything about the groups or communities you joined or about a person in the cyber world who you think is a good person? Will you inform your parents/wife/husband/friend that you are going to meet a person who is a friend of yours in the cyber world? Think about it.   ''',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Do not share your private information with anyone in the cyber world.',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue, // Highlighted color
                ),
              ),
              SizedBox(height: 10),
              Text('''    
 Chances are there that a cordial relationship of today will become enmity tomorrow. The photos, mails, chats, and videos, etc., you shared with a person while you were in friendship may be used against you after your breakup. The information you share in the cyber world may be used against you by your jealous friend, enemy, or by a criminal.   ''',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'Do not share your password with anyone.',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue, // Highlighted color
                ),
              ),
              SizedBox(height: 10),
              Text('''    
 Do not share your password and other sensitive information with your friends, is blind belief knowingly or unknowingly your friend may use your credentials against you.  ''',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'Unplug or Close webcam when it is not in use',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue, // Highlighted color
                ),
              ),
              SizedBox(height: 10),
              Text('''   
 Softwares that can spy on you by recording your video are available now. These softwares can start themselves and can record your video without your permission and knowledge. So always unplug or close webcams when not in use.   ''',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'Do not allow others to download pirated materials by using your computer',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue, // Highlighted color
                ),
              ),
              SizedBox(height: 10),
              Text('''     
 You may be well aware of the consequence of downloading pirated materials on your computer or mobile phone. If you share your computer or mobile with others, chances are there that they may access it in the future without permission. They may access your emails and notes, etc. So always secure your computer or mobile phones, etc., by using passwords.  ''',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'Use antivirus/Security software.',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue, // Highlighted color
                ),
              ),
              SizedBox(height: 10),
              Text('''     
Use updated antivirus or Security software. Do not show laziness in installing or updating antivirus/security software. Do the antivirus software updating periodically. Use antivirus/security software after ensuring credibility and authenticity. ''',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'Internet Tips',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue, // Highlighted color
                ),
              ),
              SizedBox(height: 10),
              Text(''' 
 1. Try to visit/use lawful websites only.
 2. Sites which use https protocol have better security than sites which use http protocol so expect some security flaws while browsing websites which use http.
 3. Do not disclose your password to anyone
 4. Do not open email from strangers
 5. Give importance to privacy and security of others as yours
 6. Do not believe blindly in the friendship and relationships in the cyber world
 7. Do not share personal, family, and banking details with strangers
 8. Inform parents/friends/authorities if someone sends inappropriate or irritating mails to you
 9. Refuse the invitations from online friends to meet somewhere.
 10. Do not use copyrighted materials from the internet without prior permission
 11. Do not click on suspicious links
 12. Free software/mobile applications may contain malwares.
                
                 ''',
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
