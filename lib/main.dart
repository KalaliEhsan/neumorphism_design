import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: const Color(0xff333333),
        body: const Center(
          child: Text(
            'Neumorphism Design',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.white38
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const <Widget>[
              CustomNeuButton(icon: Icons.home),
              CustomNeuButton(icon: Icons.wallet),
              CustomNeuButton(icon: Icons.person),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomNeuButton extends StatefulWidget {
  final IconData icon;

  const CustomNeuButton({super.key, required this.icon});

  @override
  State<CustomNeuButton> createState() => _CustomNeuButtonState();
}

class _CustomNeuButtonState extends State<CustomNeuButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    Offset distance = isPressed ? const Offset(1, 1) : const Offset(3, 3);
    double blur = isPressed ? 4.0 : 10.0;

    return Listener(
      onPointerDown: (details) {
        setState(() {
          isPressed = !isPressed;
        });
      },
      onPointerUp: (details) {
        setState(() {
          isPressed = !isPressed;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        width: 50,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0xff333333),
          borderRadius: BorderRadius.circular(16),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff333333),
              Color(0xff333333),
            ],
          ),
          boxShadow:
              // isPressed
              //     ? []
              //     :
              [
            BoxShadow(
              color: const Color(0xff525252),
              offset: -distance,
              blurRadius: blur,
              spreadRadius: 0.0,
            ),
            BoxShadow(
              color: const Color(0xff141414),
              offset: distance,
              blurRadius: blur,
              spreadRadius: 0.0,
            ),
          ],
        ),
        child: Icon(widget.icon, color: Colors.white10),
      ),
    );
  }
}
