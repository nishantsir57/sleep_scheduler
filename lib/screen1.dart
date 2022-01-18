import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:sleep_scheduler/screen2.dart';

class Screen1 extends StatefulWidget
{
  Screen1State createState()=> Screen1State();
}
class Screen1State extends State<Screen1>
{
  double w=0, h=0;
  bool switchValue=false;
  var _selectedIndex=1;
  PageController _pageController=PageController();
  BuildContext? ctx;

  @override
  Widget build(BuildContext context) {
    ctx=context;
    w=MediaQuery.of(context).size.width;
    h=MediaQuery.of(context).size.height;
    print(w);
    final List<Widget> _widgets =<Widget>[
      Container(
        color: Color.fromARGB(255, 0x27, 0x27, 0x27),//Color.fromARGB(255, 0x27, 0x27, 0x27),
      ),
      buildBody(),
      Container(
        color: Color.fromARGB(255, 0x27, 0x27, 0x27),
      ),
      Container(
        color: Color.fromARGB(255, 0x27, 0x27, 0x27),
      ),
    ];
    return Scaffold(
      appBar: NeumorphicAppBar(
        color: Color.fromARGB(255, 0x27, 0x27, 0x27),
        actions: [
          IconButton(onPressed: null, icon: Icon(Icons.person)),
        ],
        ),
        // backgroundColor: Color(0x272727),
      body: //_widgets.elementAt(_selectedIndex),
      PageView(
        controller: _pageController,
        children: [
          Container(
            color: Color.fromARGB(255, 0x27, 0x27, 0x27),//Color.fromARGB(255, 0x27, 0x27, 0x27),
          ),
          buildBody(),
          Container(
              color: Color.fromARGB(255, 0x27, 0x27, 0x27),
          ),
          Container(
            color: Color.fromARGB(255, 0x27, 0x27, 0x27),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromARGB(255, 0x27, 0x27, 0x27),
        selectedItemColor: Color.fromARGB(255, 0x94, 0x4b, 0x42),
        currentIndex: _selectedIndex,
        onTap: onTapped,
        items: [
          BottomNavigationBarItem(
              icon: _selectedIndex == 0?bottomNavigationSelectedButton(Icons.home_outlined):bottomNavigationNotSelectedButton(Icons.home_outlined),
              label: '',
              backgroundColor: Color.fromARGB(255, 0x27, 0x27, 0x27),
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 1?bottomNavigationSelectedButton(Icons.alarm_add_sharp):bottomNavigationNotSelectedButton(Icons.alarm_add_sharp),
            label: '',
            backgroundColor: Color.fromARGB(255, 0x27, 0x27, 0x27),
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 2?bottomNavigationSelectedButton(Icons.alarm):bottomNavigationNotSelectedButton(Icons.alarm),
            label: '',
            backgroundColor: Color.fromARGB(255, 0x27, 0x27, 0x27),
          ),
          BottomNavigationBarItem(
              icon: _selectedIndex == 3?bottomNavigationSelectedButton(Icons.person_outline):bottomNavigationNotSelectedButton(Icons.person_outline),
              label: '',
              backgroundColor: Color.fromARGB(255, 0x27, 0x27, 0x27),
          ),
        ],
      ),
    );
  }

  void onTapped(int index)
  {
    print('changing page');
    setState(() {
      _selectedIndex=index;
    });
    _pageController.jumpToPage(index);
  }
  bottomNavigationSelectedButton(icon)
  {
    return Container(
      padding: EdgeInsets.all(6),
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20)
        ),
        color: Color.fromARGB(255, 0x1b, 0x1b, 0x1b),//Color.fromARGB(255, 0xb8, 0x76, 0x46),
      ),
      child: NeumorphicButton(
        style: NeumorphicStyle(
          disableDepth: false,
            color: Color.fromARGB(255, 0xb8, 0x76, 0x46),
            boxShape: NeumorphicBoxShape.circle(),
            depth: 20,
            shape: NeumorphicShape.concave
        ),
        padding: EdgeInsets.fromLTRB(2, 3.5, 2, 2),
        child: NeumorphicIcon(
          icon,
          size: 20,
          curve: Curves.bounceIn,
          style: NeumorphicStyle(
              lightSource: LightSource.top,
              color: Color.fromARGB(255, 0xff, 0xff, 0xff)
          ),
        ),
      ),);
  }
  bottomNavigationNotSelectedButton(icon)
  {
    return NeumorphicButton(
      style: NeumorphicStyle(
          color: Color.fromARGB(255, 0x1b, 0x1b, 0x1b),
          boxShape: NeumorphicBoxShape.circle(),
          depth: 100,
          shape: NeumorphicShape.convex
      ),
      child: NeumorphicIcon(
        icon,
        style: NeumorphicStyle(
            lightSource: LightSource.top,
            color: Color.fromARGB(255, 0xff, 0xff, 0xff)
        ),
      ),
    );
  }

  Widget buildBody()
  {
    return Container(
      color: Color.fromARGB(255, 0x27, 0x27, 0x27),
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        overflow: Overflow.visible,
        children: [
          headingTextView(),
          subHeadingTextView(),
          weeklySleepDisplay(),
          daysDisplay(),
          textDisplay(),
          lineDisplay(380.0),
          timeChangeDisplay(),
          lineDisplay(500.0),
          alarmDisplay(),

        ],
      ),
    );
  }
  headingTextView()
  {
    return Positioned(
      left: 40,
      child: Text(
        'Average Sleep',
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 28
        ),
      ),
    );
  }

  subHeadingTextView()
  {
    return Positioned(
      left: 40,
      top: 40,
      child: Text(
        '7 hours last week',
        style: TextStyle(
          color: Colors.white30,
          fontSize: 14
        ),
      ),
    );
  }

  weeklySleepDisplay()
  {
    return Positioned(
      top: 80,
      left: 40,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          heightDisplay(h/6),
          Container(width: w/12,),
          heightDisplay(h/7),
          Container(width:  w/12,),
          heightDisplay(h/6),
          Container(width: w/12,),
          heightDisplay(h/4),
          Container(width: w/12,),
          heightDisplay(h/6),
          Container(width: w/12,),
          heightDisplay(h/7),
          Container(width: w/12,),
          heightDisplay(h/4),
        ],
      ),
    );
  }

  heightDisplay(double height)
  {
    return Container(
      height: height,
      width: w/26,
      decoration: BoxDecoration(
        // border: Border.all(
        //   color: Colors.deepOrange
        // ),
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.redAccent,
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 0xa2, 0x51, 0x31),
            Color.fromARGB(255, 0x97, 0x4a, 0x2e),
            Color.fromARGB(255, 0x9c, 0x4d, 0x2f),
            Color.fromARGB(255, 0xa4, 0x51, 0x31),
            Color.fromARGB(255, 0xab, 0x55, 0x34),
            Color.fromARGB(255, 0xb8, 0x5b, 0x38),
            Color.fromARGB(255, 0xcb, 0x64, 0x3c),
            Color.fromARGB(255, 0xd5, 0x6a, 0x40),
            Color.fromARGB(255, 0xdc, 0x6d, 0x42)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [
            0.1,
            0.2,
            0.3,
            0.4,
            0.5,
            0.6,
            0.7,
            0.8,
            1.0
          ],
          tileMode: TileMode.clamp
        )
      ),
    );
  }

  daysDisplay()
  {
    return Positioned(
      left: 40,
      top: 290,
      child: Row(
        children: [
          daysTextDisplay('M'),
          Container(width: w/52+w/15),
          daysTextDisplay('T'),
          Container(width: w/52+w/15),
          daysTextDisplay('W'),
          Container(width: w/52+w/15),
          daysTextDisplay('T'),
          Container(width: w/52+w/15),
          daysTextDisplay('F'),
          Container(width: w/52+w/12),
          daysTextDisplay('S'),
          Container(width: w/52+w/12),
          daysTextDisplay('S'),


        ],
      ),
    );
  }

  daysTextDisplay(name)
  {
    return Text(
      name,
      style: TextStyle(
        color: Colors.white60,
      ),
      // textAlign: TextAlign.center,
    );
  }

  textDisplay()
  {
    return Positioned(
      left: 25,
      top: 320,
      right: 20,
      child: Neumorphic(
        padding: EdgeInsets.all(10),
        style: NeumorphicStyle(
          shadowLightColor: Color.fromARGB(255, 0x27, 0x27, 0x27),
          color: Color.fromARGB(255, 0x27, 0x27, 0x27),
          disableDepth: true,
        ),
        child: Row(
          children: [
            Container(width: 5,),
            Text(
              'Sleep | Wake up',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            Container(width: 70,),
            addButtonDisplay(),
            // Container(child: addButtonDisplay(),)
          ],
        ),)
    );
  }

  lineDisplay(top)
  {
    print('Displaying line');
    return Positioned(
      left: 30,
        top: top,
        child:Neumorphic(
          child: Text('                                                                                                                                                       '
              '                                                                                                                                                                '
              '                                                                                                                                                            '
              '                                                                                                                                             '
              '                                                                                                                                                                                '
              '                                                                                                                                   ',
            style: TextStyle(
            fontSize: 1.5
          ),),
          // curve: Curves.easeInQuint,

          style: NeumorphicStyle(
            color: Colors.black,
            disableDepth: true,
            shape: NeumorphicShape.concave
          ),
      ),
    );
  }

  timeChangeDisplay()
  {
    return Positioned(
      top: 410,
        left: 25,
        child:Neumorphic(
          padding: EdgeInsets.all(10),
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
          child:Row(
            children: [
              Column(
                children: [

                  Text(
                    '8:15 AM',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    'Tomorrow Morning',
                    style: TextStyle(
                      color: Colors.white24,
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                    ),
                  )
                ],
              ),

              Container(
                padding: EdgeInsets.fromLTRB(120, 0, 20, 0),
                child: Neumorphic(
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
                  padding: EdgeInsets.all(10),
                  child:NeumorphicText(
                  'Change',
                  textStyle: NeumorphicTextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  style: NeumorphicStyle(
                    color: Color.fromARGB(255, 0xb8, 0x58, 0x35),
                    disableDepth: false,
                    boxShape: NeumorphicBoxShape.circle(),
                    depth: 200,
                    shape: NeumorphicShape.concave,

                  ),
                  ),)
              ),
            ],
          )
        )
    );
  }

  alarmDisplay()
  {
    return Positioned(
      top: 540,
      left: 40,
      child: Row(
        children: [
          Column(
            children: [
              Text(
                '5:20 AM',
                style: TextStyle(
                  color: Colors.white30,
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Alarm, every day',
                style: TextStyle(
                  color: Colors.white30,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Container(width: 80,),
          Container(
            width: 60,
            height: 30,
            child:NeumorphicSwitch(
              style: NeumorphicSwitchStyle(
                disableDepth: false,
                // thumbBorder: NeumorphicBorder(
                //   width: 5,
                //   isEnabled: true,
                // ),
                trackDepth: 5,
                thumbDepth: 10,
                inactiveThumbColor: Color.fromARGB(255, 0xb2, 0xb2, 0xb2),
                activeThumbColor: Color.fromARGB(255, 0xb8, 0x76, 0x46),
                activeTrackColor: Color.fromARGB(255, 0xb2, 0xb2, 0xb2),
                lightSource: LightSource.left,

              ),
            value: switchValue,
            onChanged: (value) {
              setState(() {
                switchValue=value;
              });
            },
          ),)
        ],
        // trailing:
      ),
    );
  }

  addButtonDisplay() {
    return NeumorphicButton(

      padding: EdgeInsets.fromLTRB(0, 2, 0, 2),
      style: NeumorphicStyle(
          color: Color.fromARGB(255, 0xb8, 0x58, 0x35),
          disableDepth: false,
          boxShape: NeumorphicBoxShape.circle(),
          depth: 200,
          shape: NeumorphicShape.concave,
        border:  NeumorphicBorder(
          width: 3,
          color: Color.fromARGB(255, 0xb8, 0x58, 0x35),
        ),
      ),
      child: NeumorphicIcon(
        Icons.add,
        size: 35,
        style: NeumorphicStyle(
          disableDepth: false,
          depth: 200,
          shape: NeumorphicShape.concave,
            lightSource: LightSource.top,
            color: Color.fromARGB(255, 0xff, 0xff, 0xff)
        ),
      ),
    );
  }
}