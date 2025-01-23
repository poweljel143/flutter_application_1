import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Set<int> favoritePlaces = {}; // Хранение индексов избранных мест

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.black),
          onPressed: () {
            // Открыть меню
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Верхние изображения
              Container(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildImageCard("assets/image1.jpg"),
                    _buildImageCard("assets/image2.jpg"),
                    _buildImageCard("assets/image3.jpg"),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Куда сходить в Томске?",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              // Поле поиска
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Поиск",
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  IconButton(
                    icon: Icon(Icons.filter_list),
                    onPressed: () {
                      // Открыть фильтры
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.favorite_border),
                    onPressed: () {
                      // Показать избранное
                    },
                  ),
                ],
              ),
              SizedBox(height: 16),
              // Сетка мест
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 3 / 4,
                ),
                itemCount: 6, // Количество мест
                itemBuilder: (context, index) {
                  return _buildPlaceCard(
                    index,
                    "Название места $index",
                    "характеристика $index",
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Карточка изображения
  Widget _buildImageCard(String imagePath) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset(
          imagePath,
          height: 200,
          width: 300,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // Карточка места
  Widget _buildPlaceCard(int index, String title, String subtitle) {
    bool isFavorite = favoritePlaces.contains(index); // Проверка, является ли место избранным

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.asset(
                "assets/place.jpg",
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  subtitle,
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.grey,
            ),
            onPressed: () {
              setState(() {
                if (isFavorite) {
                  favoritePlaces.remove(index); // Удалить из избранного
                } else {
                  favoritePlaces.add(index); // Добавить в избранное
                }
              });
            },
          ),
        ],
      ),
    );
  }
}
