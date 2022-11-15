import 'quiz3.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'main.dart';

enum SingingCharacter { answers1, answers2, answers3, answers4 }

class QuizPage2 extends StatefulWidget{
  @override
  _OtpTimerState createState() => _OtpTimerState();
}


class _OtpTimerState extends State<QuizPage2> {
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
            MaterialPageRoute(builder: (context) => QuizPage3()),
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
                      padding:  EdgeInsets.only(left:10, right: 5),
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
              const Padding(padding: EdgeInsets.only(left: 24, right: 200, top: 80),
                child:
                Text("Question 2 of 3",
                    style:  TextStyle(
                        fontFamily: 'SF Pro Text',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        decoration: TextDecoration.none
                    )
                ),
              ),
              const Padding(padding: EdgeInsets.only(left: 4, right: 160, top: 8),
                  child:
                  Text("What is Flutter?",
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
                    title: const Text('Android Development Kit'),
                    leading: Radio<SingingCharacter>(
                      value: SingingCharacter.answers1,
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
                    title: const Text('IOS Development Kit'),
                    leading: Radio<SingingCharacter>(
                      value: SingingCharacter.answers2,
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
                    title: const Text('Web Development Kit'),
                    leading: Radio<SingingCharacter>(
                      value: SingingCharacter.answers3,
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
                    title: const Text('SDK to build beautiful IOS, Android, Web & Desktop Native Apps'),
                    leading: Radio<SingingCharacter>(
                      value: SingingCharacter.answers4,
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
              Padding(padding: EdgeInsets.only(left: 55, top: 32, right: 55, bottom: 189),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    minimumSize: const Size(280, 46),

                  ),
                  onPressed: () async {
                    stopTimer();
                    var duration = interval;
                    Timer.periodic(duration, (timer) {timer.cancel(); });
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
                      MaterialPageRoute(builder: (context) => QuizPage3()),
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