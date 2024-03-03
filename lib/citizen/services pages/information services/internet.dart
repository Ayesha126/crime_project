import 'package:flutter/material.dart';

class InternetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF90CAF9),
        title: Text('Internet Tips',
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
            '''
            Over confidence is not a good thing.
     
     You may be a person who is enthusiastic about internet and not keen on internet aware of dangers in the cyber world and who takes precautions to protect privacy and sensitive data. However do you know anything in detail about the new friends you made in the cyber world, anything about the group or communities you joined or about a person in the cyber world who you think as a good man ?. Will you inform your parents/wife/husband/friend that you are going to meet a person who is a friend of you in the cyber world? Think about it.
       
          Do not share your private information with anyone the cyber world.
     
     Chances are there that a cordial relationship of today will become enmity tomorrow. The photos, mails, chats, and videos etc you shared with a person while you were in friendship may be used against you after your break up. The information you share in the cyber world may be used against you by your jealous friend, enemy or by a criminal. 
       
          Do not share your password with anyone. 
     
     Do not share your password and other sensitive information with your friends, is blind belief knowingly or unknowingly your friend may use your credentials against you .
            ''',
            style: TextStyle(fontSize: 13),
          ),
        ),
      ),
    );
  }
}