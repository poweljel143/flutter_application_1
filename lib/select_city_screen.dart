import 'package:flutter/material.dart';
import 'home_screen.dart';

class SelectCityScreen extends StatefulWidget {
  @override
  _SelectCityScreenState createState() => _SelectCityScreenState();
}

class _SelectCityScreenState extends State<SelectCityScreen> {
  String selectedCity = "Москва";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              Icon(Icons.apartment, color: Color.fromRGBO(2, 18, 254, 1), size: 48),
              SizedBox(height: 16),
              Text(
                "Выберите город, \nв котором вы хотите найти \nинтересные места",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "В дальнейшем его можно будет изменить",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              SizedBox(height: 32),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    colors: [Color.fromRGBO(2, 18, 254, 1), Color.fromRGBO(173, 255, 218, 1)],
                  ),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: selectedCity,
                    dropdownColor: Colors.black,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                    icon: Icon(Icons.arrow_drop_down, color: Colors.white),
                    items: [
                      'Москва', 'Санкт-Петербург', 'Казань', 'Новосибирск'
                    ].map((String city) {
                      return DropdownMenuItem<String>(
                        value: city,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(city),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          selectedCity = newValue;
                        });
                      }
                    },
                    menuMaxHeight: double.infinity,
                  ),
                ),
              ),
              Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white, width: 1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text(
                    "Далее",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
