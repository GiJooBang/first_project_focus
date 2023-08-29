import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class TimeUpdate with ChangeNotifier {
  int _firstTime = 0;
  int _onTime = 0;
  int _lastTime = 0;

  int get firstTime => _firstTime;
  int get onTime => _onTime;
  int get lastTime => _lastTime;

  // 외부 클래스에서 접근할 경우->
  // TimeUpdate timeUpdate = TimeUpdate();
  // int currentFirstTime = timeUpdate.firstTime; // _firstTime의 값
  // int currentOnTime = timeUpdate.onTime;       // _onTime의 값
  // int currentLastTime = timeUpdate.lastTime;   // _lastTime의 값


  TimeStorage _timeStorage = TimeStorage();

  Future<void> setFirstTime() async {
    int loadedFirstTime = await _timeStorage.loadTime(); // FirstTime을 불러오기
    _firstTime = loadedFirstTime;
    notifyListeners();
  }

  void setOnTime(int onTime) {
    _onTime = onTime; // 실시간 업데이트 - 이 데이터는 내부저장소에 저장 안되도록 하기
    notifyListeners();}

  Future<void> setLastTime(int lastTime) async {
    await _timeStorage.saveTime(firstTime);
    _lastTime = lastTime; //내부저장소로 업데이트된 최종 시간 저장하기
    notifyListeners();}
}

//          int newTime = DateTime.now().minute;
//          Provider.of<TimeProvider>(context, listen: false)
//               .setCurrentTime(newTime);

//          children: <Widget>[
//             Consumer<TimeUpdate>(
//               builder: (context, timeUpdate, child) {
//                 return Text(
//                   '현재 시간: ${timeUpdate.OnTime} 분',
//                   style: TextStyle(fontSize: 20),
//                 );
//               },
//             ),

// 특정한 시간을 내부저장소에 path_provider로 저장하고 불러오는 매우 간단한 class

class TimeStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/time_data.txt');
  }

  Future<void> saveTime(int time) async {
    final file = await _localFile;
    await file.writeAsString(time.toString());
  }

  Future<int> loadTime() async {
    try {
      final file = await _localFile;
      if (await file.exists()) {
        final String contents = await file.readAsString();
        return int.parse(contents);
      }
    } catch (e) {
      print('Error reading data: $e');
    }
    return 0;
  }
}
