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
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  void decrement() {
    setState(() {
      count--;
    });
    print(count);
  }

  void increment() {
    setState(() {
      count++;
    });
    print(count);
  }

  bool get isEmpty => count <= 0;
  bool get isFull => count >= 15;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 51, 19, 235),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/fliper.jpg"),
                fit: BoxFit.cover),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                isFull ? "Crowded!" : "Welcome !",
                style: const TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 3,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(32),
                child: Text(count.toString(),
                    style: TextStyle(
                      fontSize: 100,
                      color: isFull ? Colors.red : Colors.white,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 3,
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: isEmpty
                          ? Colors.white.withOpacity(0.2)
                          : Colors.white,
                      fixedSize: const Size(70, 70),
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: isEmpty ? null : decrement,
                    child: const Text(
                      "Saiu",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(width: 32),
                  TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: isFull
                            ? Colors.white.withOpacity(0.2)
                            : Colors.white,
                        fixedSize: const Size(70, 70),
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        )),
                    onPressed: isFull ? null : increment,
                    child: const Text(
                      "Entrou",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
