import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class StandartScaffol extends StatelessWidget {
  const StandartScaffol({
    super.key,
    required this.body,
  });
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ),
        actions: [
          Icon(
            Icons.settings_outlined,
          ).p12(),
          Icon(
            Icons.notifications_outlined,
          ).p12(),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/mainBack.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: body,
            // top: kToolbarHeight,
          ),
        ],
      ),
    );
  }
}
