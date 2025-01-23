import 'package:flutter/material.dart';
import 'main_screen.dart';
// ignore: use_key_in_widget_constructors
class SelectCityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String selectedCity = "Москва"; // Значение по умолчанию

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Возврат на предыдущий экран
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Text(
              "Выберите город, в котором вы хотите найти интересные места",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 8),
            Text(
              "В дальнейшем его можно будет изменить",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            SizedBox(height: 24),
            DropdownButtonFormField<String>(
              value: selectedCity,
              items: <String>['Москва', 'Санкт-Петербург', 'Казань', 'Новосибирск']
                  .map((String city) {
                return DropdownMenuItem<String>(
                  value: city,
                  child: Text(city),
                );
              }).toList(),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  selectedCity = newValue;
                }
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                 onPressed: () {
                   Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context) => MainScreen()),
                   );
                 },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, 
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text(
                  "Далее",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

