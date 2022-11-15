import 'quiz2.dart';
import 'main.dart';
import 'package:flutter/material.dart';
import 'dart:async';

enum SingingCharacter { Google, Facebook, Adobe, Microsoft }

class QuizPage1 extends StatefulWidget{
  @override
  _OtpTimerState createState() => _OtpTimerState();
}


class _OtpTimerState extends State<QuizPage1> {
  SingingCharacter? _character ;

  final interval = const Duration(seconds: 1);

  final int timerMaxSeconds = 10;
  Timer? timer;
  int currentSeconds = 0;

  String get timerText =>
      '${((timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(2, '0')}: ${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}';

  Widget buildTimer() => SizedBox(
      height: 5,
      width: 342,
      child: Stack(
        fit: StackFit.expand,
        children: [
          LinearProgressIndicator(
            value: currentSeconds/timerMaxSeconds,
            valueColor: const AlwaysStoppedAnimation(Colors.green),
            backgroundColor: Colors.grey,
          ),
        ],
      )
  );

  startTimeout([int? milliseconds]) {
    var duration = interval;

    timer = Timer.periodic(duration, (t) {
      setState(() {
        print(t.tick);
        currentSeconds = t.tick;
        if (t.tick >= timerMaxSeconds){
          t.cancel();
          time += currentSeconds;
          if(answer == true){
            t.cancel();
            score+=10;
            correct+=1;
          }else{
            t.cancel();
            score-=5;
          }
          answer = false;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => QuizPage2()),
          );
        }
      });
    });
  }

  stopTimer() {
    timer?.cancel();
  }

  @override
  void initState() {
    startTimeout();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          color: Colors.white,
          height: 844,
          width: 390,
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Expanded(
                    child: Padding(
                      padding:  EdgeInsets.only(left: 10, right: 5),
                      child: Icon(Icons.access_time),
                    ),
                  ),
                  Expanded(
                    child:  Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(timerText + "s",
                        style: const TextStyle(
                          fontFamily: 'SF Pro Text',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          decoration: TextDecoration.none
                      ),
                    ),
                  ),
                ),
              ],
              ),

              buildTimer(),
          const Padding(padding: EdgeInsets.only(left: 24, right: 20, top: 8),
            child:
               Text("Question 1 of 3",
                  style:  TextStyle(
                  fontFamily: 'SF Pro Text',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  decoration: TextDecoration.none
                  )
              ),
          ),
              const Padding(padding: EdgeInsets.only(left: 24, right: 16, top: 8),
                child:
                 Text("Who created Flutter?",
                  style:  TextStyle(
                  fontFamily: 'SF Pro Text',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  decoration: TextDecoration.none
                  )
                )
              ),
              Material(
                child: Padding(padding: EdgeInsets.only(left: 20, top: 10, right: 10, bottom: 10),
                  child:
                    ListTile(
                      title: const Text('Google'),
                      leading: Radio<SingingCharacter>(
                        value: SingingCharacter.Google,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                            answer = true;
                          });
                        },
                      ),
                    ),
                ),
              ),
              Material(
                child: Padding(padding: EdgeInsets.only(left:20, top: 10, right: 10, bottom: 10),
                  child:
                  ListTile(
                    title: const Text('Facebook'),
                    leading: Radio<SingingCharacter>(
                      value: SingingCharacter.Facebook,
                      groupValue: _character,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _character = value;
                          answer = false;
                        });
                      },
                    ),
                  ),
                ),
              ),
              Material(
                child: Padding(padding: EdgeInsets.only(left: 20, top: 10, right: 10, bottom: 10),
                  child:
                  ListTile(
                    title: const Text('Adobe'),
                    leading: Radio<SingingCharacter>(
                      value: SingingCharacter.Adobe,
                      groupValue: _character,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _character = value;
                          answer = false;
                        });
                      },
                    ),
                  ),
                ),
              ),
              Material(
                child: Padding(padding: EdgeInsets.only(left: 20, top: 10, right: 10, bottom: 10),
                  child:
                  ListTile(
                    title: const Text('Microsoft'),
                    leading: Radio<SingingCharacter>(
                      value: SingingCharacter.Microsoft,
                      groupValue: _character,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _character = value;
                          answer = false;
                        });
                      },
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
                    stopTimer();
                    time += currentSeconds;
                    if(answer == true){
                      score+=10;
                      correct+=1;
                    }else{
                      score-=5;
                    }
                    answer = false;
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => QuizPage2(),),
                    );
                  },
                  child: const Text(
                    'Next',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}