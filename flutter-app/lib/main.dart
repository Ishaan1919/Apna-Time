  import 'package:flutter/material.dart';
  import 'package:url_launcher/url_launcher.dart';
  import 'package:intl/intl.dart';


final Uri _url = Uri.parse("tel:911");

callLaunch(_url){
  launchUrl(_url);
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold(
        body: ClockThingie()
      ),
    );
  }
}
class ClockThingie extends StatefulWidget {
  @override
  State<ClockThingie> createState() => _ClockThingieState();
}

class _ClockThingieState extends State<ClockThingie> {

  String getTime(){
  var dusraH = int.parse((DateFormat.Hm().format(DateTime.now())).split(":").first);
  var dusraM = int.parse(DateFormat('mm').format(DateTime.now()));
  var dusraS = int.parse(DateFormat('ss').format(DateTime.now()));
  var scofday = ((dusraH) * 3600) + ((dusraM) * 60) + dusraS;
  var apnaH = (scofday~/2700);
  var apnaM = ((scofday - (apnaH * 2700) )~/60);
  var apnaS = (scofday - (apnaH * 2700 + apnaM * 60));
  var TRN = apnaH.toString() + ":" + apnaM.toString() + ":" + apnaS.toString();
  return(TRN);
  }

  String getDusraTime(){
    var dusraH = int.parse((DateFormat.Hm().format(DateTime.now())).split(":").first);
    var dusraM = int.parse(DateFormat('mm').format(DateTime.now()));
    var dusraS = int.parse(DateFormat('ss').format(DateTime.now()));
    var TRN = dusraH.toString() + ":" + dusraM.toString() + ":" + dusraS.toString();
    return(TRN);

  }

  @override
  Widget build(BuildContext context) {
    return

      Scaffold(
        backgroundColor: Color(0xff0E2224),
        body:StreamBuilder(
          stream: Stream.periodic(const Duration(seconds: 1)),
    builder: (context, snapshot) {
        return Container(

        child:Column(

          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            SizedBox(
              height: 80,
            ),
            Container(
            padding: EdgeInsets.symmetric(vertical: 0,horizontal: 100),
              child: CircleAvatar(
                backgroundColor: Color(0xff28282B),
                backgroundImage: AssetImage('images/7RRt.gif'),
                radius: 120,
              ),
          ),
            Text(
              "Apna Time",
              style: TextStyle(
                  fontFamily: "ZenDots",
                  fontSize: 40,
                  color: Colors.tealAccent),
            ),
                  Text(
                      getTime(),
                      style: TextStyle(
                      fontFamily: "ZenDots",
                      fontSize: 50,
                      color: Color(0xffFEFEFF),
                      letterSpacing: 3,
                      fontWeight: FontWeight.bold,
                      ),),
            SizedBox(
              height: 50,
            ),             Text(
              getDusraTime(),
              style: TextStyle(
                fontFamily: "ZenDots",
                fontSize: 10,
                color: Color(0xffFEFEFF),
                letterSpacing: 3,
                fontWeight: FontWeight.bold,
              ),),]
    ),
    );},
      ),
      );
  }
}
