import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../widgets/customBottomBar.dart';

class ScreenTemplate extends StatelessWidget {
  final Widget body;
  final Color backgroundColor;

  ScreenTemplate({required this.body, this.backgroundColor = background_blue});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: backgroundColor,
        child: body,
      ),
      bottomNavigationBar: CustomBottomBar(),
    );
  }
}