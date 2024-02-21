import 'package:auto_route/auto_route.dart';
import 'package:crypto_coins_list/features/crypto_list/view/crypto_list_screen.dart';
import 'package:crypto_coins_list/features/news/view/news_screen.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MainScreenwidget extends StatefulWidget {
  const MainScreenwidget({super.key});

  @override
  State<MainScreenwidget> createState() => _MainScreenwidgetState();
}

class _MainScreenwidgetState extends State<MainScreenwidget> {
  int _selectedTab = 0;

  void onSelectTab(int index) {
    if (_selectedTab == index) return;

    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOption = <Widget>[
      News(),
      CryptoListScreen(),
    ];

    return Scaffold(
      body: SafeArea(
        child: _widgetOption[_selectedTab],
      ),
      bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Color.fromARGB(255, 253, 253, 253),
          backgroundColor: Color.fromARGB(115, 37, 34, 34),
          currentIndex: _selectedTab, // устанавливаем текущий индекс
          onTap: (index) {
            setState(() {
              _selectedTab = index; //изменяем текущий индекс при нажатии
            });
          },
          selectedItemColor: Color.fromARGB(255, 237, 240, 88),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.newspaper),
              label: 'Новости',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Монеты',
            ),
          ]),
    );
  }
}
