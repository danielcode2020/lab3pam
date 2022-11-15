import 'package:flutter/material.dart';
import 'package:lab3/finish.dart';
import 'quiz1.dart';

void main(){
  runApp(MyApp());
}

int correct = 0;
int score = 0;
int time = 0;
bool answer = false;

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Math Your Brain',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          children: <Widget>[
            Container(
            height: 844,
            width: 390,
              child: Column(
                children: [
                Padding(padding:
                  EdgeInsets.only(left: 16, top: 63, right: 16, bottom: 44),
                  child: Image(
                      image: AssetImage('lib/assets/img.png')
                  ),
                ),
                   Padding( padding: EdgeInsets.only(left: 87, right: 86),
                      child: Container(
                      width: 217,
                      height: 112,
                      child: Text(
                      'Math for everyone',
                      style: TextStyle(
                        fontFamily: 'SF Pro Text',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: 55, top: 32, right: 55, bottom: 189),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        minimumSize: const Size(280, 46),

                      ),
                      onPressed: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => QuizPage1()),
                        );
                      },
                      child: const Text(
                        'Start',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

