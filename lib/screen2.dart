import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class Screen2 extends StatefulWidget
{
  Screen2State createState() => Screen2State();
}
class Screen2State extends State<Screen2>
{
  double w=0, h=0;
  @override
  Widget build(BuildContext context) {
    w=MediaQuery.of(context).size.width;
    h=MediaQuery.of(context).size.height;
    print('width = $w and height = $h');
    return Scaffold(
        appBar: NeumorphicAppBar(
          color: Color.fromARGB(255, 0x27, 0x27, 0x27),
          actions: [
            IconButton(onPressed: null, icon: Icon(Icons.person)),
          ],
        ),
      body: Container(
        color: Color.fromARGB(255, 0x27, 0x27, 0x27),
        child:  ListView(
      children: [
      clockDisplay(),
      Container(height: 20,),
      textTimeDisplay(),
      Container(height: 30,),
      bedAndWakeTimeDisplay(),
      Container(height: 20,),
      Container(padding: EdgeInsets.all(20), child: editSleepScheduleButton(),)
      ],
    ),
      ),
      // Container(
      //   color: Colors.black54,

      // )
    );
  }
  clockDisplay()
  {
    return Container(
      padding: EdgeInsets.fromLTRB(w/15, 0, w/15, 0),
      child: Container(
        padding: EdgeInsets.fromLTRB(w/12, w/12,w/12,w/12),
        height: h/3+60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(w/2),
            color: Colors.black87
        ),
        child: halfCircle()
      ),
    );
  }
  halfCircle()
  {
    return Container(
      padding: EdgeInsets.all(w/10),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 0xf3, 0x85, 0x50),
        borderRadius: BorderRadius.circular(w/2),
      ),
      child: innerCircle(),
    );
  }
  innerCircle()
  {
    return Container(
      height: 10,
      padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(w/2+30),
        color: Colors.black87
      ),
      child: Stack(
        children: [
          Positioned(child: Text('12 AM', style: TextStyle(color: Colors.white38, fontWeight: FontWeight.bold, fontSize: 16),), top: 0, left: 50,),
          Positioned(child: Text('2', style: TextStyle(color: Colors.white38, fontWeight: FontWeight.bold, fontSize: 16),), top: 30, left: 110,),
          Positioned(child: Text('4', style: TextStyle(color: Colors.white38, fontWeight: FontWeight.bold, fontSize: 16),), top: 60, left: 130,),
          Positioned(child: Text('6 AM', style: TextStyle(color: Colors.white38, fontWeight: FontWeight.bold, fontSize: 16),), top: 90, left: 125,),
          Positioned(child: Text('8', style: TextStyle(color: Colors.white38, fontWeight: FontWeight.bold, fontSize: 16),), top: 120, left: 130,),
          Positioned(child: Text('10', style: TextStyle(color: Colors.white38, fontWeight: FontWeight.bold, fontSize: 16),), top: 150, left: 110,),
          Positioned(child: Text('12 PM', style: TextStyle(color: Colors.white38, fontWeight: FontWeight.bold, fontSize: 16),), bottom: 0, left: 50,),
          Positioned(child: Text('10', style: TextStyle(color: Colors.white38, fontWeight: FontWeight.bold, fontSize: 16),), top: 30, right: 125,),
          Positioned(child: Text('8', style: TextStyle(color: Colors.white38, fontWeight: FontWeight.bold, fontSize: 16),), top: 60, right: 145,),
          Positioned(child: Text('6 PM', style: TextStyle(color: Colors.white38, fontWeight: FontWeight.bold, fontSize: 16),), top: 90, right: 125,),
          Positioned(child: Text('4', style: TextStyle(color: Colors.white38, fontWeight: FontWeight.bold, fontSize: 16),), top: 120, right: 145,),
          Positioned(child: Text('2', style: TextStyle(color: Colors.white38, fontWeight: FontWeight.bold, fontSize: 16),), top: 150, right: 125,),
        ],
      ),
    );
  }

  textTimeDisplay()
  {
    return Container(
      padding: EdgeInsets.fromLTRB(w/24, 0, 0, 0),
      child: ListTile(
        title: Center(
          child: Text(
            '12 hr 15 min',
            style: TextStyle(
              color: Color.fromARGB(255, 0xfa, 0xfa, 0xfa),
              fontWeight: FontWeight.bold,
              fontSize: 28
            ),
          ),
        ),
        subtitle: Center(
          child: Text(
            'This schedule does not meet your sleep goal',
            style: TextStyle(
              color: Colors.white38,
              fontSize: 12,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      )
    );
  }
  
  
  bedAndWakeTimeDisplay()
  {
    return Container(
      padding: EdgeInsets.fromLTRB(w/9, 0, w/9, 0),
      child: Row(
        children: [
          Flexible(child: bedTimeDisplay()),
          Container(width: 30),
          Flexible(child: wakeTimeDisplay())
        ],
      ),
    );
  }
  bedTimeDisplay()
  {
    return Neumorphic(
      style: NeumorphicStyle(
        shape: NeumorphicShape.concave,
        shadowLightColor: Color.fromARGB(255, 0x19, 0x19, 0x19),
        shadowDarkColorEmboss: Color.fromARGB(255, 0x19, 0x19, 0x19),
          color: Color.fromARGB(255, 0x18, 0x18, 0x18),
        disableDepth: false,
        depth: 300,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
        surfaceIntensity: -100,
      ),
      child: ListTile(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.car_rental_outlined,
              color: Colors.white54,
            ),
            Text('Bedtime', style: TextStyle(
              color: Colors.white54,
              fontWeight: FontWeight.bold,
              fontSize: 16
            ),),
            Text(
              '1:00 AM',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
            )
          ],
        ),
        subtitle: Text(
          'Tomorrow',
          style: TextStyle(
            fontSize: 12,
            color: Colors.white54
          ),
        ),
      ),
    );
  }
  wakeTimeDisplay()
  {
    return Neumorphic(
      style: NeumorphicStyle(
        shape: NeumorphicShape.concave,
        shadowLightColor: Color.fromARGB(255, 0x19, 0x19, 0x19),
        shadowDarkColorEmboss: Color.fromARGB(255, 0x19, 0x19, 0x19),
        color: Color.fromARGB(255, 0x18, 0x18, 0x18),
        disableDepth: false,
        depth: 300,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
        surfaceIntensity: -100,
      ),
      child: ListTile(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.doorbell,
              color: Colors.white54,
            ),
            Text('Wake up', style: TextStyle(
                color: Colors.white54,
                fontWeight: FontWeight.bold,
                fontSize: 16
            ),),
            Text(
              '8:15 AM',
              style: TextStyle(
                  color: Colors.white70,
                  fontSize: 24,
                  fontWeight: FontWeight.bold
              ),
            )
          ],
        ),
        subtitle: Text(
          'Tomorrow',
          style: TextStyle(
              fontSize: 12,
              color: Colors.white54
          ),
        ),
      ),
    );
  }

  editSleepScheduleButton()
  {
    return Neumorphic(
      // padding: EdgeInsets.,
      style:  NeumorphicStyle(
        shape: NeumorphicShape.concave,
        shadowLightColor: Color.fromARGB(255, 0x19, 0x19, 0x19),
        shadowDarkColorEmboss: Color.fromARGB(255, 0x19, 0x19, 0x19),
        color: Color.fromARGB(255, 0x18, 0x18, 0x18),
        disableDepth: false,
        depth: 300,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
        surfaceIntensity: -100,
      ),
      // padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
      // padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: NeumorphicButton(
        padding: EdgeInsets.all(15),
        style:  NeumorphicStyle(
          shape: NeumorphicShape.concave,
          shadowLightColor: Color.fromARGB(255, 0x19, 0x19, 0x19),
          shadowDarkColorEmboss: Color.fromARGB(255, 0x19, 0x19, 0x19),
          color: Color.fromARGB(255, 0x18, 0x18, 0x18),
          disableDepth: false,
          depth: 300,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
          surfaceIntensity: -100,
        ),
        onPressed: null,
        // color: Colors.black54,
        child: Center(
          child: Text(
            'Edit Sleep',
            style: TextStyle(
                color: Color.fromARGB(255, 0xb6, 0x66, 0x41),
                fontSize: 18,
                fontWeight: FontWeight.normal
            ),
          ),
        ),
      ),
    );
  }
}