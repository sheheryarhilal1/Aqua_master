import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final String imagepath;
  final String title;
  final bool text;
  final String temperature;
  
  final void Function() onTaptoggle;
  final void Function() gridTap;
  final bool color;

  CustomContainer(
      {super.key,
      required this.imagepath,
      required this.title,
      required this.temperature,
  
      required this.onTaptoggle,
      required this.color,
      required this.gridTap,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: gridTap,
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.blue.withOpacity(0.5), width: 8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                spreadRadius: 5,
              ),
            ],
          ),
          child: Column(
            children: [
              Image.asset(
                imagepath,
                width: 50,
                height: 50,
              ),
              const SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                "$temperature",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              
              const SizedBox(height: 10),
              GestureDetector(
                onTap: onTaptoggle,
                child: Container(
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: color ? Colors.green : Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    text ? 'ON' : 'OFF',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
