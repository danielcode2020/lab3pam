import 'quiz1.dart';
import 'main.dart';
import 'package:flutter/material.dart';
import 'dart:async';





class Finish extends StatefulWidget{
  @override
  _OtpTimerState createState() => _OtpTimerState();
}


class _OtpTimerState extends State<Finish> {

  final interval = const Duration(seconds: 1);

  final int timerMaxSeconds = 60;

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
    Timer.periodic(duration, (timer) {
      setState(() {
        print(timer.tick);
        currentSeconds = timer.tick;
        if (timer.tick >= timerMaxSeconds) timer.cancel();
      });
    });
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
              const Padding(padding: EdgeInsets.only(left: 10, right: 10, top: 20),
                child:
                Text("New Rating",
                    style:  TextStyle(
                        fontFamily: 'SF Pro Text',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        decoration: TextDecoration.none
                    )
                ),
              ),
              const Padding(padding: EdgeInsets.only(left: 15, right: 16, top: 8),
                  child:
                  Text("425",
                      style:  TextStyle(
                          fontFamily: 'SF Pro Text',
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          decoration: TextDecoration.none
                      )
                  )
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                    Text("Score     ",
                        style:  TextStyle(
                            fontFamily: 'SF Pro Text',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            decoration: TextDecoration.none
                        ),
                      ),

                    Text("Correct     ",
                        style:  TextStyle(
                            fontFamily: 'SF Pro Text',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            decoration: TextDecoration.none
                        ),
                      ),

                       Text('Completed In',
                        style:  TextStyle(
                            fontFamily: 'SF Pro Text',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            decoration: TextDecoration.none
                        ),
                      ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children:  [
                  Text(score.toString() + "     ",
                    style:  const TextStyle(
                        fontFamily: 'SF Pro Text',
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        decoration: TextDecoration.none
                    ),
                  ),

                  Text(correct.toString() + "     ",
                    style:  const TextStyle(
                        fontFamily: 'SF Pro Text',
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        decoration: TextDecoration.none
                    ),
                  ),

                  Text(time.toString() + "s",
                    style: const TextStyle(
                        fontFamily: 'SF Pro Text',
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        decoration: TextDecoration.none
                    ),
                  ),
                ],
              ),
              Padding(padding: const EdgeInsets.only(left: 55, top: 32, right: 55, bottom: 8),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white10,
                    minimumSize: const Size(280, 46),

                  ),
                  onPressed: () async {
                    time = 0;
                    correct = 0;
                    score = 0;
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  child: const Text(
                    'leave',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ),
              Padding(padding: const EdgeInsets.only(left: 55, top: 8, right: 55, bottom: 189),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    minimumSize: const Size(280, 46),

                  ),
                  onPressed: () async {
                    time = 0;
                    correct = 0;
                    score = 0;
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => QuizPage1()),
                    );
                  },
                  child: const Text(
                    'New Game',
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