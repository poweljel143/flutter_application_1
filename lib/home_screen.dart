import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.menu, color: Colors.white),
                  Icon(Icons.signal_cellular_alt, color: Colors.white),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Куда сходить \nв Томске?",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 16),
            Container(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildImageCard("assets/tomsk1.jpg"),
                  _buildImageCard("assets/tomsk2.jpg"),
                  _buildImageCard("assets/tomsk3.jpg"),
                ],
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Поиск",
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.search, color: Colors.white),
                  filled: true,
                  fillColor: Colors.grey[900],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                padding: EdgeInsets.all(16),
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildPlaceCard("Лампочка", "assets/lampochka.jpg", "гастробар"),
                  _buildPlaceCard("Лагерный сад", "assets/lager_sad.jpg", "парк"),
                  _buildPlaceCard("Ново-Соборная площадь", "assets/novo_sobornaya.jpg", "центральная площадь"),
                  _buildPlaceCard("Городской сад", "assets/gorodskoy_sad.jpg", "парк культуры и отдыха"),
                  _buildPlaceCard("Театр 2+ку", "assets/teatr.jpg", "театр живых кукол"),
                  _buildPlaceCard("Ботанический сад ТГУ", "assets/bot_sad.jpg", "заповедный парк"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageCard(String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(imagePath, width: 160, fit: BoxFit.cover),
      ),
    );
  }

  Widget _buildPlaceCard(String title, String imagePath, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(imagePath, height: 100, fit: BoxFit.cover),
        ),
        SizedBox(height: 8),
        Text(title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        Text(subtitle, style: TextStyle(color: Colors.grey)),
      ],
    );
  }
}
