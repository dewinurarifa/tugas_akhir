import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key,
    required this.child,
    required this.topImage,
    this.bottomImage,
    this.bottomLeftImage,
  }) : super(key: key);

  final String topImage;
  final String? bottomImage;
  final String? bottomLeftImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                topImage,
                width: 120,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: bottomImage == null
                  ? const SizedBox()
                  : Image.asset(bottomImage!, width: 120),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: bottomLeftImage == null
                  ? const SizedBox()
                  : Image.asset(bottomLeftImage!, width: 120),
            ),
            SafeArea(child: child),
          ],
        ),
      ),
    );
  }
}
