import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    title: 'Test task',
    initialRoute: '/',
      routes: {
        '/': (context) => MainMenu(),
        '/info': (context) => InfoScreen(),
        '/button': (context) => AppRealisation1(),
        '/inkwell': (context) => AppRealisation2(),
      },
    ));
}

class MainMenu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        centerTitle: true,
        title: Text(
            'RAINBOW',
          style: TextStyle(
            color: Colors.amber,
            letterSpacing: 2.0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 80.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              color: Colors.grey[850],
              padding: EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
              child: Text(
                'Rainbow 1',
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 18.0,
                  letterSpacing: 1.0,
                ),
              ),
              onPressed: () {
              Navigator.pushNamed(context, '/button');
                },
            ),
            RaisedButton(
              color: Colors.grey[850],
              padding: EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
              child: Text(
                'Rainbow 2',
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 18.0,
                  letterSpacing: 1.0,
                ),
              ),
              onPressed: () {
              Navigator.pushNamed(context, '/inkwell');
                },
            ),
            Divider(
              height: 20.0,
              color: Colors.grey[800],
            ),
            RaisedButton(
              color: Colors.grey[850],
              padding: EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
              child: Text(
                'About app',
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 18.0,
                  letterSpacing: 1.0,
                ),
              ),
              onPressed: () {
              Navigator.pushNamed(context, '/info');
                },
            ),
          ],
        ),
      ),
    );
  }
}

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
        title: Text(
          'About app',
          style: TextStyle(
            color: Colors.amber,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
        child: ListView(
/*        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,*/
          children: <Widget>[
            Image(
              image: AssetImage('assets/avatar.png'),
              height: 250.0,
              width: 250.0,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
              child: Text(
                'Ranbow - find you color',
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,

                ),
              ),
            ),
            Divider(
              height: 40.0,
              color: Colors.grey[800],
            ),
            Text(
              'Auther: Anton Klimkin',
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(
              height: 40.0,
              color: Colors.grey[800],
            ),
            Text(
                'The application implements two versions of the test task. \n\n'
                    'The first version "Rainbow 1" - works according to the task. \n\n'
                    'In the second "Rainbow 2" version, be careful with a double click;)'
                    'But remember: every thing can be fixed. So if something happens,'
                    ' just keep clicking gently. \n\n '
                    'You also can back to main menu by using interface '
                    'control buttons of your smartphone',
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 20.0),
            RaisedButton(
              color: Colors.grey[850],
              onPressed: () {
                Navigator.pop(context);
                },
              child: Text(
                  'Back',
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 18.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppRealisation1 extends StatefulWidget {
  @override
  _AppRealisation1State createState() => _AppRealisation1State();
}

class _AppRealisation1State extends State<AppRealisation1> {
  Color color = Colors.white;
  Random random = Random();

  void randomColor() {
    setState(() {
      color = Color.fromARGB(
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
      );
    });
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: RaisedButton(
              onLongPress: randomColor,
              onPressed: randomColor,
              color: color,
              elevation: 0.0,
              child: Text(
                  'Hey there',
                style: TextStyle(
                  fontSize: 24.0,
                  letterSpacing: 2.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AppRealisation2 extends StatefulWidget {
  @override
  _AppRealisation2State createState() => _AppRealisation2State();
}

class _AppRealisation2State extends State<AppRealisation2> {
  Random _random = Random();
  Color _color = Colors.white;
  int _count = 0;
  String _path = 'assets/screen0.png';


  void gentlyTap() {
    String path = 'assets/screen';
    String ext = '.png';
    setState(() {
      _color = Color.fromARGB(
        _random.nextInt(256),
        _random.nextInt(256),
        _random.nextInt(256),
        _random.nextInt(256),
      );
      if (_count != 0) {
        _path = path + _count.toString() + ext;
        _count--;
      } else {
        _path = 'assets/screen0.png';
      }
    });
  }

  void carelessTap() {
    List<String> pathList = [
      'assets/brgl1.png',
      'assets/brgl2.png',
      'assets/brgl3.png',
      'assets/brgl4.png',
      'assets/brgl5.png'
    ];
    _count = 4;
    setState(() {
      _color = Colors.black;
      _path = pathList[_random.nextInt(5)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: gentlyTap,
        onDoubleTap: carelessTap,
        child: Container(
          decoration: BoxDecoration(
            color: _color,
            image: DecorationImage(
              image: AssetImage(_path),
            ),
          ),
        ),
      ),
    );
  }
}


