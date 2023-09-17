import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

class MyTimer extends StatefulWidget {
  const MyTimer({Key? key}) : super(key: key);
  @override
  State<MyTimer> createState() => _MyTimer();
}

class _MyTimer extends State<MyTimer> {
  int _duration = 0;
  final CountDownController _controller = CountDownController();
  Map<String, List<int>> dateDurationMap = {};    // 날짜: [시간1,시간2,...] 형식으로 데이터 저장

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(
              children: [
                Positioned.fill(
                  child: Image.asset("asset/img/timer/bottom3.png"),
                ),
                CircularCountDownTimer(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width,
                  duration: _duration,   // 목표 시간 설정
                  fillColor: Colors.green[300]!,
                  ringColor: Colors.green.withOpacity(0.25),
                  strokeWidth: 20.0,
                  autoStart: false,
                  controller: _controller,
                  onComplete: () {
                    //_controller.restart();
                    final now = DateTime.now();
                    final formattedDate = '${now.year}.${now.month}.${now.day}';
                    final saveTime = _duration;

                    if (dateDurationMap.containsKey(formattedDate)) {
                      dateDurationMap[formattedDate]!.add(saveTime);
                    } else {
                      dateDurationMap[formattedDate] = [saveTime];
                    }

                    //print('날짜 및 지속 시간 맵: $dateDurationMap');
                  },
                  isTimerTextShown: true,
                  textStyle: const TextStyle(
                    fontSize: 60.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  textFormat: CountdownTextFormat.HH_MM_SS,
                  isReverse: true,
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: () {
                  _controller.start();
                },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    textStyle: const TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: Text("Start"),
                ),
                ElevatedButton(onPressed: () {
                  _controller.pause();
                },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    textStyle: const TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: const Text("Pause"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}