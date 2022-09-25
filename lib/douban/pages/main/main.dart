import 'package:flutter/material.dart';
import '../home/home.dart';
import 'initialize_items.dart';

class MSMainPage extends StatefulWidget {
  const MSMainPage({Key? key}) : super(key: key);

  @override
  State<MSMainPage> createState() => _MSMainPageState();
}

class _MSMainPageState extends State<MSMainPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: items,
        currentIndex: _currentIndex,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
