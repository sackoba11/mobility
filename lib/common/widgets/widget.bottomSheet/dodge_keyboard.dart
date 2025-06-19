import 'package:flutter/material.dart';

class DodgeKeyboard extends StatelessWidget {
  final Widget child;

  const DodgeKeyboard({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.viewInsetsOf(context).bottom,
      ),
      child: child,
    );
  }
}
