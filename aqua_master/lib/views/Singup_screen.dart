import 'package:aqua_master/views/Login_screen.dart';
import 'package:aqua_master/views/Singup_screen.dart';
import 'package:aqua_master/views/cooler_views.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand, // Ensures the image fills the screen
        children: [
          // Background Image
          Image.asset(
            'assets/mobile.jpg', // Path to your wallpaper image
            fit: BoxFit.cover, // Ensures the image covers the screen
          ),
          // Content on top of the background image
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(
                      16.0), // Add padding around the widget
                  child: Center(
                    child: Image.asset(
                      'assets/logo_aqua.png',
                      height: 100,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 1.0), // Padding between the image and text
                  child: Center(
                    child: const Text(
                      "AQUA MASTER",
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Center(
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
                const SizedBox(height: 15),
                buildTextField("Email ID", Icons.email, false),
                const SizedBox(height: 15),
                buildTextField("Enter Password", Icons.lock, true),
                const SizedBox(height: 15),
                buildTextField("Confirm Password", Icons.lock,
                    true), // Confirm Password field
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () {
                      Get.to(
                        CoolerView(),
                      );
                    },
                    child: const Text("Account created",
                        style: TextStyle(fontSize: 18)),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => LoginScreen());
                    },
                    child: const Text(
                      "Already have an account?Login",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
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

  Widget buildTextField(String hint, IconData icon, bool obscure) {
    return TextField(
      obscureText: obscure,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.black),
        filled: true,
        fillColor: Colors.black.withOpacity(0.1),
        prefixIcon: Icon(icon, color: Colors.black),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
