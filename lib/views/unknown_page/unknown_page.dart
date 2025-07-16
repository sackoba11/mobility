import 'package:flutter/material.dart';

import '../../utils/constants/app string/app_string.dart';

class UnknownPage extends StatelessWidget {
  const UnknownPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(AppString.errorRouting),
      ),
    );
  }
}
