import 'package:flutter/material.dart';
import 'slider_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 0, 0, 1.0),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Center(
            child: Text(
              "RÜV",
              style: TextStyle(
                fontFamily: "TT Norms Pro",
                fontSize: 150,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Color.fromRGBO(2, 18, 254, 1),
                shadows: [
                  Shadow(
                    blurRadius: 120,
                    color: Color.fromRGBO(81, 186, 87, 1.0),
                    offset: Offset(0, 0),
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: 412,
              height: 394,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF131646), Color(0xFF242EC0)],
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                ),
                border: Border(
                  top: BorderSide(width: 1, color: Colors.transparent),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "ruventure -",
                      style: TextStyle(
                        fontFamily: 'TT Norms Pro',
                        color: Color.fromRGBO(2, 18, 255, 1),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        letterSpacing: 0.01,
                        height: 18 / 24,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Лучшие места твоего города в одном приложении",
                      style: TextStyle(
                        fontFamily: 'TT Norms Pro',
                        color: Color.fromRGBO(173, 255, 218, 1),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.italic,
                        letterSpacing: 0.01,
                        height: 14 / 14,
                      ),
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SliderScreen()),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blue.shade800,
                            shape: BoxShape.circle,
                          ),
                          padding: EdgeInsets.all(12),
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
