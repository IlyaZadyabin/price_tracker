import 'package:flutter/material.dart';
import 'package:price_tracker/bootstrap.dart';
import 'package:price_tracker/view/home/screen/home_screen.dart';

void main() {
  bootstrap(App.new);
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Price tracker',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}
