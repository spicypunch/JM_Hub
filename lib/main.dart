import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:jm_hub/ui/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Color> backgroundColors = [
    Colors.black87,
    Colors.grey,
    Color(0xFFF5ECCE),
    Colors.blue.shade100,
    Colors.green.shade100,
    Colors.pink.shade100,
    Colors.purple.shade100,
    Colors.white
  ];

  int currentColorIndex = 6;

  bool showColorPicker = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: backgroundColors[currentColorIndex],
        body: Stack(
          children: [
            // Main content
            Center(
              child: DeviceFrame(
                device: Devices.android.samsungGalaxyNote20Ultra,
                isFrameVisible: true,
                orientation: Orientation.portrait,
                screen: HomeScreen(),
              ),
            ),

            Positioned(
              top: 20,
              right: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        showColorPicker = !showColorPicker;
                      });
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: backgroundColors[currentColorIndex],
                        border: Border.all(color: Colors.black, width: 2),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  if (showColorPicker)
                    Container(
                      margin: EdgeInsets.only(top: 8),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 5,
                            offset: Offset(5, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        children: List.generate(
                          backgroundColors.length,
                          (index) => GestureDetector(
                            onTap: () {
                              setState(() {
                                currentColorIndex = index;
                                showColorPicker = false;
                              });
                            },
                            child: Container(
                              width: 30,
                              height: 30,
                              margin: EdgeInsets.only(
                                  bottom: index != backgroundColors.length - 1
                                      ? 8
                                      : 0),
                              decoration: BoxDecoration(
                                color: backgroundColors[index],
                                border: Border.all(
                                  color: currentColorIndex == index
                                      ? Colors.black
                                      : Colors.grey,
                                  width: currentColorIndex == index ? 2 : 1,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
