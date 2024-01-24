import 'package:flutter/material.dart';

class TextTitile extends StatelessWidget {
  const TextTitile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 400,
      color: Colors.black,
      child: TweenAnimationBuilder(
          builder: (BuildContext context, double val, child) {
            return Opacity(
              opacity: val,
              child: Padding(
                padding: EdgeInsets.only(top: val),
                child: child,
              ),
            );
          },
          tween: Tween<double>(begin: 0, end: 1),
          duration: const Duration(seconds: 1),
          child: const Text(
            'cars',
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          )),
    );
  }
}
