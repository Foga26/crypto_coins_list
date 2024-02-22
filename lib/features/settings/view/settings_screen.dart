import 'package:auto_route/auto_route.dart';
import 'package:crypto_coins_list/features/settings/widgets/settings_toggle_card.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SettingScreenWidget extends StatelessWidget {
  const SettingScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: [
      const SliverAppBar(
        snap: true,
        centerTitle: true,
        floating: true,
        title: Text('Settings'),
        elevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
      SliverToBoxAdapter(
          child: SettingsToggleCard(
        title: 'Темная тема',
        value: true,
        onChanged: (bool? value) {},
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
