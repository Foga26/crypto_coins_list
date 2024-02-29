import 'package:auto_route/auto_route.dart';
import 'package:crypto_coins_list/router/router.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MainScreenwidget extends StatelessWidget {
  const MainScreenwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [NewsRoute(), CryptoListRoute(), SettingRouteWidget()],
      builder: ((context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
              unselectedItemColor: const Color.fromARGB(255, 253, 253, 253),
              backgroundColor: const Color.fromARGB(115, 37, 34, 34),
              currentIndex:
                  tabsRouter.activeIndex, // устанавливаем текущий индекс
              onTap: (index) => onSelectTab(index, tabsRouter),
              selectedItemColor: const Color.fromARGB(255, 237, 240, 88),
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.newspaper),
                  label: 'Новости',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Монеты',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Settings',
                ),
              ]),
        );
      }),
    );
  }

  void onSelectTab(int index, TabsRouter tabsRouter) {
    tabsRouter.setActiveIndex(index);
  }
}
