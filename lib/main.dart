import 'package:flutter/material.dart';
import 'package:device_frame/device_frame.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: DeviceFrame(
            device: Devices.ios.iPhone13ProMax,
            isFrameVisible: true,
            orientation: Orientation.portrait,
            screen: YourAppUI(),
          ),
        ),
      ),
    );
  }
}

class YourAppUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 여기에 당신이 만든 실제 앱 UI 구현
    return Container(
      color: Colors.white,
      child: Center(
        child: Text('당신의 앱 UI'),
      ),
    );
  }
}