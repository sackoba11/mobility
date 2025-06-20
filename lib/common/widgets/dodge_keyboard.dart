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
        top: 20,
        left: 20,
        right: 20,
        bottom: MediaQuery.viewInsetsOf(context).bottom + 20,
      ),
      child: child,
    );
  }
}
