import 'package:flutter/material.dart';
import 'package:switcher_login/existing-screen.dart';
import 'package:switcher_login/new-screen.dart';
import 'package:switcher_login/widgets/animatedswitcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        dividerColor: Colors.grey,
        textTheme: TextTheme(
          display4: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  var _pvController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFF7AF5A),
              Color(0xFFFC4889),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Column(
                children: <Widget>[
                  FlutterLogo(colors: Colors.yellow, size: 100),
                  SizedBox(height: 25),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.11,
                    ),
                    child: AnimatedSwitcherDeivao(controller: _pvController),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.55,
                    child: PageView(
                      controller: _pvController,
                      children: <Widget>[
                        ExistingScreen(),
                        NewScreen(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
