import 'package:auto_route/auto_route.dart';
import 'package:crypto_coins_list/features/settings/widgets/settings_toggle_card.dart';
import 'package:crypto_coins_list/features/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class SettingScreenWidget extends StatelessWidget {
  const SettingScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var isLight = Provider.of<ThemeTest>(context);
    return Scaffold(
        body: CustomScrollView(slivers: [
      const SliverAppBar(
        backgroundColor: Colors.transparent,
        snap: true,
        centerTitle: true,
        floating: true,
        title: Text('Settings'),
        elevation: 0,
      ),
      SliverToBoxAdapter(
          child: SettingsToggleCard(
        title: 'Темная тема',
        value: isLight.isLightTheme,
        onChanged: (bool? value) {
          isLight.darkTheme();
        },
      )),
      SliverToBoxAdapter(
          child: SettingsToggleCard(
        title: 'Уведомления',
        value: true,
        onChanged: (bool? value) {},
      )),
      SliverToBoxAdapter(
          child: SettingsToggleCard(
        title: 'Разрешить аналитику',
        value: true,
        onChanged: (bool? value) {},
      )),
    ]));
  }
}
