import 'package:flutter/material.dart';
import 'package:quick_ztory/core/core.dart';

void main() => runApp(const ZtoryApp());

class ZtoryApp extends StatelessWidget {
  const ZtoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ztory',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Ztory'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            AppColors.primaryColor.withOpacity(.7),
            AppColors.primaryColor.withOpacity(.3),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(height: topPadding),
              const SizedBox(height: 10),
              Stack(
                children: [
                  Image.asset(
                    Assets.cloudsImage,
                  ),
                  Image.asset(
                    Assets.rocketPersonImage,
                  ),
                ],
              ),
              const Spacer(),
              const Text(
                'You have pushed the button this many times:',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                '$_counter',
                style: const TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 200),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        backgroundColor: AppColors.primaryColor,
        child: const Icon(Icons.add),
      ), //
    );
  }
}
