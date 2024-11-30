import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'registration_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 50),
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back, color: Colors.black),
              ),
            ),
            const Spacer(),
            Center(
              child: Container(
                width: 170.73,
                height: 165.25,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("RUventure.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Любимые места в одном приложении",
              style: TextStyle(fontFamily: "Faberge", fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              "Войдите или зарегистрируйтесь, чтобы использовать приложение",
              style: TextStyle(fontFamily: "Faberge", fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                minimumSize: const Size(301, 56),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
              ),
              child: const Text("Войти", style: TextStyle(fontFamily: "Faberge", color: Colors.white)),
            ),
            const SizedBox(height: 10),
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RegistrationScreen()),
                );
              },
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(301, 56),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
              ),
              child: const Text(
                "Создать аккаунт",
                style: TextStyle(fontFamily: "Faberge", color: Colors.black),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
