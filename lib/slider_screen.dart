import 'package:flutter/material.dart';
import 'auth_screen.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({super.key});

  @override
  _SliderScreenState createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  int currentIndex = 0;

  final List<Map<String, String>> sliderData = [
    {"text": "Откройте для себя новые места!", "image": "image1.jpg"},
    {"text": "Планируйте маршруты легко!", "image": "image2.jpg"},
    {"text": "Находите лучшие места поблизости!", "image": "image3.jpg"},
    {"text": "Наслаждайтесь каждым моментом!", "image": "image4.jfif"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: PageView.builder(
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemCount: sliderData.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    Container(
                      width: 250,
                      height: 235,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28),
                        image: DecorationImage(
                          image: AssetImage(sliderData[index]["image"]!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      sliderData[index]["text"]!,
                      style: const TextStyle(
                        fontFamily: "Faberge",
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Spacer(),
                  ],
                );
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    sliderData.length,
                    (index) => buildDot(index),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AuthScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.all(0),
                    minimumSize: const Size(134, 35),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Пропустить',
                    style: TextStyle(
                      fontFamily: "Faberge",
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDot(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 10,
      width: currentIndex == index ? 12 : 8,
      decoration: BoxDecoration(
        color: currentIndex == index ? Colors.black : Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }
}
