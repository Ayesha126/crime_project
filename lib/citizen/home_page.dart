import 'package:crime_track_master/citizen/widgets%20of%20citizen/CustomCaroule.dart';
import 'package:crime_track_master/citizen/widgets%20of%20citizen/Customapp_bar.dart';
import 'package:crime_track_master/citizen/widgets%20of%20citizen/livesafe.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: CustomAppBar(),
    body: SafeArea(
      child:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [

            Expanded(child: ListView(
              shrinkWrap: true,
              children: [
                CustomCaroule(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Color(0xFF90CAF9),
                    child: Text("Services",
                      style: GoogleFonts.laila(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1565C0),
                      ),
                      // This is the color code you want for the text
                    ),
                  ),
                ),
                LiveSafe(),
              ],
            ),
            ),
          ],
        ),
      ),
    ),
  );
}

class AmbulanceEmergency extends StatelessWidget {
  _callNumber(String number) async{
    await FlutterPhoneDirectCaller.callNumber(number);
  }
  //const Emergency({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0,bottom: 5),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),
        child: InkWell(
          onTap: () => _callNumber('108'),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Ambulance',
                        style: TextStyle(color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.width*0.06
                        ),
                      ),
                      Text('In case of Medical Emergencies Call',
                        style: TextStyle(color: Colors.white,
                          overflow: TextOverflow.ellipsis,
                          fontSize: MediaQuery.of(context).size.width*0.045,
                        ),

                      ),
                      Container(
                        child: Center(
                          child: Text('1-0-8',
                            style: TextStyle(color: Colors.red[300],
                              fontWeight: FontWeight.bold,
                              fontSize: MediaQuery.of(context).size.width*0.055,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}