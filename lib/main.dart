import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int counter = 0;

  void decrement() {
    setState(() {
      counter--;
    });
  }

  void increment() {
    setState(() {
      counter++;
    });
  }

  bool get isFull => counter == 20;
  bool get isEmpty => counter <= 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/wallpaper_app2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(isFull ? 'Lotado!' : 'Pode entrar!',
                style: TextStyle(
                  fontSize: 30,
                  color: isFull ? Colors.red : Colors.white,
                  fontWeight: FontWeight.w400,
                )),
            Padding(
              padding: const EdgeInsets.all(60),
              child: Text('$counter',
                  style: TextStyle(
                      fontSize: 90,
                      color: isFull ? Colors.red : Colors.white,
                      fontWeight: FontWeight.w400)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: isEmpty ? null : decrement,
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    fixedSize: const Size(100, 100),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: Text('Saiu',
                      style: TextStyle(
                        color: isEmpty ? Colors.red : Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      )),
                ),
                const SizedBox(width: 32),
                TextButton(
                  onPressed: isFull ? null : increment,
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      fixedSize: const Size(100, 100),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      )),
                  child: Text('Entrou',
                      style: TextStyle(
                        color: isFull ? Colors.red : Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
