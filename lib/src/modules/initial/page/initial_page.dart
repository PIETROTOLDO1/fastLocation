import 'dart:async';

import 'package:fastlocation/src/routes/app_router.dart';
import 'package:fastlocation/src/shared/colors/app_colors.dart';
import 'package:flutter/material.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticOut,
  );
  void redirect(BuildContext context) {
    Timer(const Duration(seconds: 3), () async {
      Navigator.of(context).pushReplacementNamed(AppRouter.home);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    redirect(context);
    return Scaffold(
      backgroundColor: AppColors.appPageBackground,
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text("Fast Location",
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 40,
                      fontWeight: FontWeight.bold)),
            ),
            RotationTransition(
              turns: _animation,
              child: const Padding(
                  padding: EdgeInsets.all(8),
                  child: Icon(
                    size: 150,
                    color: Colors.green,
                    Icons.directions,
                  )),
            )
          ],
        ),
      )),
    );
  }
}