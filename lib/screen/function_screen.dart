import 'package:flutter/material.dart';
import 'package:first_project_focus/widget/timer.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Function Screen",
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          centerTitle: true,
          flexibleSpace: new Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  Colors.blue,
                  Colors.orange,
                ],
              ),
            ),
          ),
        ),
        body: Center(
          child: MyTimer(),
        ),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Image.asset("asset/img/timer/bottom1.png",width: 60, height: 60),
                label: '타이머',
              ),
              BottomNavigationBarItem(
                icon: Image.asset("asset/img/timer/bottom2.png",width: 60, height: 60),
                label: '통계',
              ),
              BottomNavigationBarItem(
                icon: Image.asset("asset/img/timer/bottom3.png",width: 60, height: 60),
                label: '마이펫',
              ),
              BottomNavigationBarItem(
                icon: Image.asset("asset/img/timer/bottom4.png",width: 60, height: 60),
                label: '설정',
              ),
            ]),
      ),
    );
  }
}