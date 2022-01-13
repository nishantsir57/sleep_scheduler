import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget
{
  HomeState createState()=> HomeState();
}
class HomeState extends State<Home>
{
  double w=0, h=0;
  bool switchValue=false;
  var _selectedIndex=1;
  PageController _pageController=PageController();


  void onTapped(int index)
  {
    // setState(() {
    //   // _selectedIndex=index;
    // });
    _pageController.jumpToPage(1);
  }

  @override
  Widget build(BuildContext context) {
    w=MediaQuery.of(context).size.width;
    h=MediaQuery.of(context).size.height;
    print(w);
    print('Height = ${MediaQuery.of(context).size.height}');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black38,
        actions: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)
              ),
              color: Colors.black12,
              border: Border.all(color: Colors.white)
            ),
            child: IconButton(
              color: Colors.white,
              onPressed: null,
              icon: Icon(Icons.person_outline, color: Colors.white,),

            ),
          )
        ],
      ),
      backgroundColor: Colors.black54,
      body:PageView(
        controller: _pageController,
        children: [
          Container(
            color: Colors.yellowAccent,
          ),
          buildBody(),
          Container(
              color: Colors.greenAccent,
          ),
          Container(
            color: Colors.redAccent,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.redAccent,
        currentIndex: _selectedIndex,
        onTap: onTapped,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: '',
              backgroundColor: Colors.black
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lock_clock),
            label: ''
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.alarm_on_rounded),
            label: ''
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: '',
              backgroundColor: Colors.black
          ),
        ],
      ),
    );
  }

  buildBody()
  {
    return Container(
      color: Colors.black54,
      child: ListView(
        children: [
          Container(height: 10,),
          headingTextView(),
          Container(height: 8,),
          subHeadingTextView(),
          Container(height: 10,),
          weeklySleepDisplay(),
          Container(height: 10,),
          daysDisplay(),
          Container(height: 20,),
          textDisplay(),
          Container(height: 20,),
          lineDisplay(),
          Container(height: 20,),
          timeChangeDisplay(),
          Container(height: 20,),
          Container(
            padding: EdgeInsets.fromLTRB(w/9, 0, 0, 0),
            child: Text('Other', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
          ),
          Container(height: 20,),
          lineDisplay(),
          Container(height: 10,),
          alarmDisplay(),
          Container(height: 20,)

        ],
      ),
    );
  }
  headingTextView()
  {
    return Container(
      padding: EdgeInsets.fromLTRB(w/9, 0, 0, 0),
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
    return Container(
      padding: EdgeInsets.fromLTRB(w/9, 0, 0, 0),
      child: Text(
        '7 hours last week',
        style: TextStyle(
          color: Colors.white70,
          fontSize: 12
        ),
      ),
    );
  }

  weeklySleepDisplay()
  {
    return Container(
      padding: EdgeInsets.fromLTRB(w/9, 0, w/9, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          heightDisplay(h/4),
          Container(width: w/12,),
          heightDisplay(h/6),
          Container(width:  w/12,),
          heightDisplay(h/4),
          Container(width: w/12,),
          heightDisplay(h/3),
          Container(width: w/12,),
          heightDisplay(h/5),
          Container(width: w/12,),
          heightDisplay(h/6),
          Container(width: w/12,),
          heightDisplay(h/3),
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
        border: Border.all(
          color: Colors.deepOrange
        ),
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.redAccent,
        gradient: LinearGradient(
          colors: [
            Colors.orange,
            Colors.deepOrangeAccent,
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp
        )
      ),
    );
  }

  daysDisplay()
  {
    return Container(
      padding: EdgeInsets.fromLTRB(w/9, 0, 0, 0),
      alignment: Alignment.center,
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
    return Container(
      padding: EdgeInsets.fromLTRB(w/12, 0, w/9, 0),
      child: ListTile(
        leading: Text(
          'Sleep | Wake up',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        trailing: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.deepOrange
          ),
          child: IconButton(
            focusColor: Colors.white,
            color: Colors.white,
            hoverColor: Colors.white,
            icon: Icon(Icons.add),
            onPressed: null,
          ),
        )
      ),
    );
  }

  lineDisplay()
  {
    return Container(
        padding: EdgeInsets.fromLTRB(w/12, 0, w/12, 0),
        child:Container(

        decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.black
      ),
      height: 2,
    ));
  }

  timeChangeDisplay()
  {
    return Container(
      padding: EdgeInsets.fromLTRB(w/15, 0, 0, 0),
        child:Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        color: Colors.black87
      ),
      padding: EdgeInsets.fromLTRB(w/26, 0, 0, 0),
      child: ListTile(
        title: Text(
          '8:15 AM',
          style: TextStyle(
            color: Colors.white,
            fontSize: 34,
            fontWeight: FontWeight.bold
          ),
        ),
        subtitle: Text(
            'Tomorrow Morning',
          style: TextStyle(
            color: Colors.white24,
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
        ),
        trailing: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            gradient: RadialGradient(
              colors: [
                Colors.black12,
                Colors.black87
              ],
              radius: 0.2
            ),
          ),
          child: RaisedButton(
            onPressed: null,
            child: Text(
              'Change',
              style: TextStyle(
                color: Colors.orangeAccent,

              ),
            ),
            color: Colors.black87,

          ),
        ),
      ),
    ));
  }

  alarmDisplay()
  {
    return Container(
      padding: EdgeInsets.fromLTRB(w/9, 0, 0, 0),
      child: ListTile(
        title: Text(
            '5:20 AM',
          style: TextStyle(
            color: Colors.white30,
            fontSize: 34,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          'Alarm, every day',
          style: TextStyle(
            color: Colors.white30,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: CupertinoSwitch(
          value: switchValue,
          onChanged: (value) {
            setState(() {
              switchValue=value;
            });
          },
        ),
      ),
    );
  }
}