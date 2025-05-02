import 'package:flutter/material.dart';
import 'package:device_frame/device_frame.dart';
import 'package:jm_hub/ui/home_screen.dart';
import 'package:jm_hub/ui/web_frame_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PhoneAppContainer(),
    );
  }
}

class PhoneAppContainer extends StatefulWidget {
  const PhoneAppContainer({Key? key}) : super(key: key);

  @override
  State<PhoneAppContainer> createState() => _PhoneAppContainerState();
}

class _PhoneAppContainerState extends State<PhoneAppContainer> {
  Widget _currentScreen = HomeScreen();

  void navigateToWeb(String url, String title) {
    setState(() {
      _currentScreen = WebFrameScreen(
        url: url,
        title: title,
      );
    });
  }

  void navigateToHome() {
    setState(() {
      _currentScreen = HomeScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DeviceFrame(
          device: Devices.android.bigPhone,
          isFrameVisible: true,
          orientation: Orientation.portrait,
          screen: WillPopScope(
            onWillPop: () async {
              // 뒤로 가기 버튼 처리
              if (_currentScreen is! HomeScreen) {
                navigateToHome();
                return false; // 앱 종료 방지
              }
              return true; // 홈 화면에서는 앱 종료 허용
            },
            child: NavigatorInherited(
              navigateToWeb: navigateToWeb,
              navigateToHome: navigateToHome,
              child: _currentScreen,
            ),
          ),
        ),
      ),
    );
  }
}

// 네비게이션 콜백을 자식 위젯에게 전달하기 위한 InheritedWidget
class NavigatorInherited extends InheritedWidget {
  final Function(String, String) navigateToWeb;
  final Function() navigateToHome;

  const NavigatorInherited({
    super.key,
    required this.navigateToWeb,
    required this.navigateToHome,
    required super.child,
  });

  static NavigatorInherited of(BuildContext context) {
    final NavigatorInherited? result =
    context.dependOnInheritedWidgetOfExactType<NavigatorInherited>();
    assert(result != null, 'No NavigatorInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(NavigatorInherited oldWidget) {
    return navigateToWeb != oldWidget.navigateToWeb ||
        navigateToHome != oldWidget.navigateToHome;
  }
}