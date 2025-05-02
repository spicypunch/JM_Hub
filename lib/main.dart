import 'package:flutter/material.dart';
import 'package:device_frame/device_frame.dart';
import 'package:jm_hub/ui/home_screen.dart';

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
        // backgroundColor: Color(0xFFF5ECCE),
        backgroundColor: Colors.grey,
        body: Center(
          child: DeviceFrame(
            device: Devices.android.samsungGalaxyNote20Ultra,
            isFrameVisible: true,
            orientation: Orientation.portrait,
            screen: HomeScreen(),
          ),
        ),
      ),
    );
  }
}
