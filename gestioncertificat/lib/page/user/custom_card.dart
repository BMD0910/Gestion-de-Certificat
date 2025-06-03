import 'package:flutter/material.dart';

class MyCustomCard extends StatelessWidget {
  // final List<Widget>? children;
  final Widget? child;
  const MyCustomCard({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 24),
      // height: MediaQuery.of(context).size.height - heightElementsEnHaut,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.elliptical(40, 40), topRight: Radius.elliptical(50, 50)),
        ),
        // color: Colors.amber,
        color: Color.fromARGB(255, 230, 244, 231),
      ),
      child: child,
    );
  }
}