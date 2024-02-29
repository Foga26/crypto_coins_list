import 'package:auto_route/auto_route.dart';
import 'package:crypto_coins_list/main_screen/main_screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

@RoutePage()
class LottieScreenWidget extends StatefulWidget {
  const LottieScreenWidget({super.key});

  @override
  State<LottieScreenWidget> createState() => _LottieScreenWidgetState();
}

class _LottieScreenWidgetState extends State<LottieScreenWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool isLoaded = false;
  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 750));

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          isLoaded = true;
        });
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: isLoaded
            ? const MainScreenwidget()
            : Lottie.asset('assets/animation.json', controller: _controller,
                onLoaded: (comp) {
                _controller.duration = comp.duration;
                _controller.forward();
              }),
      ),
    );
  }
}
